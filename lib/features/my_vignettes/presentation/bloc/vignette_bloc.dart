import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tollhopper/features/login/data/data_sources/sign_in_up_local_data_sources.dart';
import 'package:tollhopper/features/my_vignettes/data/models/vignette_model.dart';
import 'package:tollhopper/features/my_vignettes/domain/usecases/get_vignette_use_case.dart';
import 'package:tollhopper/global/utils/functions.dart';

import '../widget/vignette_list_enum.dart';

part 'vignette_event.dart';
part 'vignette_state.dart';

class VignetteBloc extends Bloc<VignetteEvent, VignetteState> {
  VignetteBloc({
    required SignInUpLocalDataDataSource signInUpLocalDataDataSource,
    required GetVignettesUseCase getVignettesUseCase,
  })  : _signInUpLocalDataDataSource = signInUpLocalDataDataSource,
        _getVignettesUseCase = getVignettesUseCase,
        super(VignetteInitial()) {
    on<VignetteEvent>((event, emit) => emit(VignetteLoading()));
    on<GetVignettesHistory>(_getVignetteHistory);
  }

  final SignInUpLocalDataDataSource _signInUpLocalDataDataSource;
  final GetVignettesUseCase _getVignettesUseCase;

  Future<void> _getVignetteHistory(
      GetVignettesHistory event, Emitter<VignetteState> emit) async {
    final String? userToken = await _signInUpLocalDataDataSource.getToken();

    if (userToken == null) {
      emit(UserNotConnected());
    } else {
      final String customerId = getCustomerIdFromBackendToken(userToken);
      final result = await _getVignettesUseCase.call(
          GetVignettesParams(token: customerId, language: event.language));

      result.fold((failure) {
        emit(VignetteErrorState(message: mapFailureToMessage(failure)));
      }, (vignettes) {
        // Filter active Vignettes and sort them by end_date :
        // ? Sort in ascending order
        List<VignetteModel> activeVignette = getOrderedVignetteByStatus(
          vignettes: vignettes,
          status: VignettesListEnum.active,
        );

        // Filter active Vignettes and sort them by end_date :
        // ? Sort in descending order
        List<VignetteModel> expiredVignette = getOrderedVignetteByStatus(
          vignettes: vignettes,
          status: VignettesListEnum.expired,
        );

        emit(VignettesHistoryLoaded(
          activeVignettes: activeVignette,
          expiredVignettes: expiredVignette,
        ));
      });
    }
  }

  List<VignetteModel> getOrderedVignetteByStatus({
    required List<VignetteModel> vignettes,
    required VignettesListEnum status,
  }) {
    List<VignetteModel> filteredList =
        vignettes.where((vignette) => vignette.status == status).toList();
    sortVignetteList(vignettes: filteredList, status: status);
    return filteredList;
  }

  void sortVignetteList({
    required List<VignetteModel> vignettes,
    required VignettesListEnum status,
  }) {
    vignettes.sort(
      (v1, v2) => endDateIsBiggerThanStartDate(
              startDate: v1.endDate ?? '', endDate: v2.endDate ?? '')
          ? status == VignettesListEnum.active
              ? 0
              : 1
          : status == VignettesListEnum.active
              ? 1
              : 0,
    );
  }
}
