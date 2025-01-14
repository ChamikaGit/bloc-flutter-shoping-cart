part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

sealed class WishlistActionState extends WishlistState{}

final class WishlistInitial extends WishlistState {}

final class WishlistLoadingState extends WishlistState{}

final class WishlistSuccessState extends WishlistState{
  final List<ProductDataModel> wishListItems;
  WishlistSuccessState({required this.wishListItems});

}

final class WishlistErrorState extends WishlistState{
  final String errorMessage;
  WishlistErrorState({required this.errorMessage});
}

final class WishlistItemRemovedState extends WishlistActionState{
  final String message;
  WishlistItemRemovedState({required this.message});
}







// final class CartInitialState extends CartState {}
//
// final class CartLoadingState extends CartState{}
//
// final class CartSuccessState extends CartState{
//   final List<ProductDataModel> cartItems ;
//   CartSuccessState({required this.cartItems});
// }
//
// final class CartErrorState extends CartState{
//   final String errorMessage;
//   CartErrorState({required this.errorMessage});
// }
//
// final class CartItemRemovedState extends CartActionState{
//   final String message;
//   CartItemRemovedState({required this.message});
// }