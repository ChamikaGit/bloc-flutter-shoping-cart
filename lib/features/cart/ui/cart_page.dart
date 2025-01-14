import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/models/home_product_data_model.dart';
import '../bloc/cart_bloc.dart';
import 'cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            "Cart",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocConsumer<CartBloc, CartState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            bloc: cartBloc,
            listenWhen: (previous, current) {
              return current is CartActionState;
            },
            buildWhen: (previous, current) {
              return current is! CartActionState;
            },
            builder: (context, state) {
              if (state is CartLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CartSuccessState) {
                final List<ProductDataModel> cartList = state.cartItems;

                if (cartList.isNotEmpty) {
                  return Column(children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                          itemCount: cartList.length,
                          itemBuilder: (context, index) {
                            return CartTileWidget(
                                cartBloc: cartBloc,
                                productDataModel: cartList[index]);
                          }),
                    ),
                  ]);
                } else {
                  return const Center(
                      child: Text(
                    "Product List is Empty",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ));
                }
              } else if (state is CartErrorState) {
                final errorMessage = state.errorMessage;
                return Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              } else {
                return Container();
              }
            }));
  }
}
