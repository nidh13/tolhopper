import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/domain/use_cases/add_products_in_cart_use_case.dart';
import 'package:tollhopper/features/cart_tab/domain/use_cases/delete_product_from_cart_use.dart';
import 'package:tollhopper/features/cart_tab/domain/use_cases/get_product_from_cart_use_case.dart';
import 'package:tollhopper/features/cart_tab/domain/use_cases/get_total_price_use_case.dart';
import 'package:tollhopper/global/utils/functions.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddProductToCartUseCase addProductToCartUseCase;
  final DeleteProductFromCartUseCase deleteProductFromCartUseCase;
  final GetTotalCartPriceUseCase getTotalCartPriceUseCase;
  final GetProductSFromUseCase getProductSFromUseCase;
  CartBloc(
      {required this.addProductToCartUseCase,
      required this.getTotalCartPriceUseCase,
      required this.deleteProductFromCartUseCase,
      required this.getProductSFromUseCase})
      : super(CartInitial());
  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is GetProductsFromCartEvent) {
      yield CartLoadingState();
      final listOrFailure = await getProductSFromUseCase(NoParams());
      yield listOrFailure.fold(
        (failure) => CartErrorState(message: mapFailureToMessage(failure)),
        (list) => list.isNotEmpty
            ? CartSuccessState(
                listItems: list,
                price: calculateTotalCartPrice(listItems: list))
            : CartEmptyState(),
      );
    } else if (event is AddProductsEvent) {
      yield CartLoadingState();
      final listOrFailure = await addProductToCartUseCase(
          AddProductToCartParams(items: event.listProducts));
      yield listOrFailure.fold(
        (failure) => CartErrorState(message: mapFailureToMessage(failure)),
        (list) => ProductsAddedState(
            listItems: list,
            price: calculateTotalCartPrice(listItems: list),
            isFromHome: event.isFromHome),
      );
    } else if (event is DeleteProductEvent) {
      yield DeleteLoadingState();
      final listOrFailure = await deleteProductFromCartUseCase(
          DeleteProductFromCartPrams(id: event.id));
      yield listOrFailure.fold(
        (failure) => CartErrorState(message: mapFailureToMessage(failure)),
        (list) => list.isNotEmpty
            ? CartSuccessState(
                listItems: list,
                price: calculateTotalCartPrice(listItems: list))
            : CartEmptyState(),
      );
    }
  }
}
