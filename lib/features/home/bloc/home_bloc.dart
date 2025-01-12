import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sample_shoping_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

import '../../../data/grocery_data.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishListButtonNavigateEvent>(
        homeProductWishListButtonNavigateEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  //this call once user reach to the home screen(app open)
  FutureOr<void> homeInitialEvent(HomeInitialEvent event,
      Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    try {
      // Add delay to simulate loading
      await Future.delayed(const Duration(seconds: 3));

      // Map the product list to ProductDataModel objects
      var productList = GroceryData.groceryProducts.map((e) {
        return ProductDataModel(
          id: e['id'].toString(),
          name: e['name'],
          description: e['description'],
          price: e['price'],
          imageUrl: e['imageUrl'],
        );
      }).toList();

      // Emit success state with the product list
      emit(HomeLoadedSuccessState(products: productList));
    } catch (error, stackTrace) {
      // Log the error (optional)
      print("Error: $error");
      print("StackTrace: $stackTrace");

      // Emit error state with the error message
      emit(HomeErrorState(message: "Failed to load products. Please try again."));
    }
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print('WishList Clicked');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Clicked');
  }


  FutureOr<void> homeProductWishListButtonNavigateEvent(
      HomeProductWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('WishList navigate Clicked');
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart navigate Clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}
