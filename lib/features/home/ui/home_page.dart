import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample_shoping_app/features/cart/ui/cart.dart';
import 'package:flutter_bloc_sample_shoping_app/features/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_sample_shoping_app/features/wishlist/ui/wishlist.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) {
        return current is HomeActionState;
      },
      buildWhen: (previous, current) {
        return current
            is! HomeActionState; // Means this is definitely a HomeState.
      },
      listener: (context, state) {
        if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const WishListPage();
          }));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CartPage();
          }));
        }else if (state is HomeAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Item added to cart!"),
              duration: Duration(seconds: 2),
              action: SnackBarAction(
                label: "Undo",
                onPressed: () {
                  // Add logic to undo adding to cart if needed
                },
              ),
            ),
          );
        } else if (state is HomeAddedToWishListActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Item added to wishlist!"),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      bloc: homeBloc,
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                "Grocery Bloc App",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is HomeLoadedSuccessState) {
          final productList = state.products;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                "Grocery Bloc App",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishListButtonNavigateEvent());
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonNavigateEvent());
                  },
                  icon: const Icon(Icons.shopping_cart_checkout_outlined,
                      color: Colors.white),
                )
              ],
            ),
            body: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return ProductTileWidget(
                            homeBloc: homeBloc,
                            productDataModel: productList[index]);
                      }),
                ),
              ],
            ),
          );
        } else if (state is HomeErrorState) {
          final errorMessage = state.message;

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
        } else {
          return const Scaffold(
            body: Center(child: Text("Unknown state.")),
          );
        }
      },
    );
  }
}
