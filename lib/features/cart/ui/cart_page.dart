import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample_shoping_app/features/home/bloc/home_bloc.dart';

import '../../home/models/home_product_data_model.dart';
import '../../home/ui/product_tile_widget.dart';
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
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous,current){
        return current is CartActionState;
      },
      buildWhen: (previous,current){
        return current is !CartActionState;
      },
      listener: (context, state) {
        if(state is CartItemRemovedState){
          // need to show a snack bar
        }
      },
      builder: (context, state) {
        if(state is CartLoadingState){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                "Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }else if(state is CartSuccessState){
           final List<ProductDataModel> cartList = state.cartItems;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                "Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Column(
                children: [
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
                ]          ),
          );
        }else if(state is CartErrorState){
          final errorMessage = state.errorMessage;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                "Grocery Bloc App",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Center(
              child: Text(
                errorMessage,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        }else{
          return Container();
        }
      },
    );
  }
}
