import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';
import '../../home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartItemRemoveEvent>(cartItemRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(CartSuccessState(cartItems: cartList));

    } catch (error, stackTrace) {
      print("Message :$error stackTrace :$stackTrace");
    }

  }

  FutureOr<void> cartItemRemoveEvent(CartItemRemoveEvent event, Emitter<CartState> emit) {
    try {
      final clickedProduct = event.clickedProduct;
      cartList.removeWhere((product) => product.id == clickedProduct.id);
      // Emit the updated state with the new cart list
      emit(CartSuccessState(cartItems: cartList));
    }catch(error,stackTrace){
      print("Message :$error stackTrace :$stackTrace");
    }

  }
}
