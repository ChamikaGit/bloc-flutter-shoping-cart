part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

sealed class HomeActionEvents extends HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductWishListButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeProductWishListButtonNavigateEvent extends HomeActionEvents {}

class HomeProductCartButtonNavigateEvent extends HomeActionEvents {}
