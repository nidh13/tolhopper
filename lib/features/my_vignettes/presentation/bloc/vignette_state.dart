part of 'vignette_bloc.dart';

@immutable
abstract class VignetteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VignetteInitial extends VignetteState {}

class VignetteLoading extends VignetteState {}

class VignettesHistoryLoaded extends VignetteState {
  VignettesHistoryLoaded({
    required this.activeVignettes,
    required this.expiredVignettes,
  });

  final List<VignetteModel> activeVignettes;
  final List<VignetteModel> expiredVignettes;

  @override
  List<Object?> get props => [activeVignettes, expiredVignettes];
}

class UserNotConnected extends VignetteState {}

class VignetteErrorState extends VignetteState {
  final String message;

  VignetteErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
