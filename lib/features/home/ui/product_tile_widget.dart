import 'package:flutter/material.dart';
import 'package:flutter_bloc_sample_shoping_app/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_sample_shoping_app/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(productDataModel.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(6)),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productDataModel.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 22)),
                  const SizedBox(width: 10),
                  Text('${productDataModel.description}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14))
                ],
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${productDataModel.price.toString()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16)),
              Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    // Makes sure the material has no background
                    child: InkWell(
                      onTap: () {
                        homeBloc.add(HomeProductWishListButtonClickedEvent(
                            clickedProduct: productDataModel));
                      },
                      splashColor: Colors.blue.withOpacity(0.3),
                      // Ripple effect color
                      highlightColor: Colors.blue.withOpacity(0.1),
                      // Highlight color when tapped
                      borderRadius: BorderRadius.circular(80),
                      // Optional: Adds rounded corners
                      child: const Icon(
                        Icons.favorite_border,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Material(
                    color: Colors.transparent,
                    // Makes sure the material has no background
                    child: InkWell(
                      onTap: () {
                        homeBloc.add(HomeProductCartButtonClickedEvent(
                            clickedProduct: productDataModel));
                      },
                      splashColor: Colors.green.withOpacity(0.3),
                      // Ripple effect color
                      highlightColor: Colors.green.withOpacity(0.1),
                      // Highlight color when tapped
                      borderRadius: BorderRadius.circular(80),
                      // Optional: Adds rounded corners
                      child: const Icon(
                        Icons.add_shopping_cart_outlined,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
