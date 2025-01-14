part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState extends CartState {}

final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState{}

final class CartSuccessState extends CartState{
  final List<ProductDataModel> cartItems ;
  CartSuccessState({required this.cartItems});
}

final class CartErrorState extends CartState{
  final String errorMessage;
  CartErrorState({required this.errorMessage});
}

final class CartItemRemovedState extends CartActionState{
  final String message;
  CartItemRemovedState({required this.message});
}
