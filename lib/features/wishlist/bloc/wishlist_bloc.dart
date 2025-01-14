import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/wishlist_items.dart';
import '../../home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListItemRemoveEvent>(wishListItemRemoveEvent);
  }


  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 3));
      final wishListedItems = wishList;
      emit(WishlistSuccessState(wishListItems: wishListedItems));
  }catch(error, stackTrace){
      const String errorMessage  = "Something Went Wrong";
      emit(WishlistErrorState(errorMessage: errorMessage));
      print("error :$error -- stackTrace :$stackTrace");
    }

  }

  FutureOr<void> wishListItemRemoveEvent(WishListItemRemoveEvent event, Emitter<WishlistState> emit) {
    // try {
    //   final wishListedItems = wishList;
    //   emit(WishlistSuccessState(wishListItems: wishListedItems));
    // }catch(error, stackTrace){
    //   const String errorMessage  = "Something Went Wrong";
    //   emit(WishlistErrorState(errorMessage: errorMessage));
    //   print("error :$error -- stackTrace :$stackTrace");
    // }
  }
}
