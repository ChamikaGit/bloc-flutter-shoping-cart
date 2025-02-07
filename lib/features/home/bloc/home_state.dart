part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

//home states
final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState{}

final class HomeLoadedSuccessState extends HomeState{
  //we need to pass the list of products once user in the success state
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});

}

final class HomeErrorState extends HomeState{
  final String message;
  HomeErrorState({required this.message});
}


//ActionState for buttonClick Navigation
final class HomeNavigateToWishListPageActionState extends HomeActionState{}

final class HomeNavigateToCartPageActionState extends HomeActionState{}

final class HomeAddedToWishListActionState extends HomeActionState{
  //if we want pass some message from bloc side we can define a message on here as well
}
final class HomeAddedToCartActionState extends HomeActionState{
  //if we want pass some message from bloc side we can define a message on here as well
}

/**
 * UI----->Event---->Bloc---->Emit--->State--->UI
 */
