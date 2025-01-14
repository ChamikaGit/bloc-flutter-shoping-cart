part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

sealed class CartActionEvent extends CartEvent{}

class CartInitialEvent extends CartEvent{}

class CartItemRemoveEvent extends CartActionEvent{
  final ProductDataModel clickedProduct;
  CartItemRemoveEvent({required this.clickedProduct});
}


