part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddProductsEvent extends CartEvent {
  final List<CartModel> listProducts;
  final bool isFromHome;
  AddProductsEvent({
    required this.listProducts,
    required this.isFromHome,
  });

  @override
  List<Object?> get props => [
        listProducts,
        isFromHome,
      ];
}

class GetProductsFromCartEvent extends CartEvent {}

class DeleteProductEvent extends CartEvent {
  final String id;
  DeleteProductEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
