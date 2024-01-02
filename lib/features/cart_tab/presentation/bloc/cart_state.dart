part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartEmptyState extends CartState {}

class DeleteLoadingState extends CartState {}

class CartErrorState extends CartState {
  final String message;

  CartErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class CartSuccessState extends CartState {
  final List<CartModel> listItems;
  final String price;

  CartSuccessState({required this.listItems, required this.price});

  @override
  List<Object?> get props => [listItems, price];
}

class ProductsAddedState extends CartState {
  final List<CartModel> listItems;
  final String price;
  final bool isFromHome;

  ProductsAddedState({required this.listItems, required this.price,required this.isFromHome});

  @override
  List<Object?> get props => [listItems, price,isFromHome];
}
