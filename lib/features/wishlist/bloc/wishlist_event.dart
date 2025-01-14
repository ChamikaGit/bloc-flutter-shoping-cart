part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

sealed class WishlistActionEvent extends WishlistEvent{}

class WishListInitialEvent extends WishlistEvent{}

class WishListItemRemoveEvent extends WishlistActionEvent{
  final ProductDataModel clickedProduct;
  WishListItemRemoveEvent({required this.clickedProduct});
}
