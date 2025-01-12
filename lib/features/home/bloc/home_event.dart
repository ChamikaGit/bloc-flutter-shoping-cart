part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

sealed class HomeActionEvents extends HomeEvent{}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishListButtonClickedEvent extends HomeEvent{}

class HomeProductCartButtonClickedEvent extends HomeEvent{}

class HomeProductWishListButtonNavigateEvent extends HomeActionEvents{}

class HomeProductCartButtonNavigateEvent extends HomeActionEvents{}
