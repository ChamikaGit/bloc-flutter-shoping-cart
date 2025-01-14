import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample_shoping_app/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc_sample_shoping_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_sample_shoping_app/features/wishlist/ui/wishlist_tile_widget.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    super.initState();
    wishlistBloc.add(WishListInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Wishlist",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (current, previous) {
          return current is WishlistActionState;
        },
        buildWhen: (current, previous) {
          return current is! WishlistActionState;
        },
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is WishlistLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishlistSuccessState) {
            final List<ProductDataModel> wishlist = state.wishListItems;

            return Column(children: [
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: wishlist.length,
                    itemBuilder: (context, index) {
                      return WishlistTileWidget(
                          wishlistBloc: wishlistBloc,
                          productDataModel: wishlist[index]);
                    }),
              ),
            ]);
          } else if (state is WishlistErrorState) {
            final error = state.errorMessage;
            return Center(
                child: Text(error,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
