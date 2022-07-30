import 'package:coffe_shop_task/models/coffee_product_model.dart';
import 'package:coffe_shop_task/screens/coffee_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../product_provider.dart';
import '../shared/components/components.dart';
import '../shared/styles/colors.dart';

class CoffeeFavoritesScreen extends StatelessWidget {
  const CoffeeFavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);

    return Container(
      child:  productData.productFavoritesList.length == 0?
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.6,

          child: SvgPicture.asset(
            'assets/images/wishlist.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
      )
            : ListView.separated(
        physics: BouncingScrollPhysics(),
    separatorBuilder: (context, index) => Divider(
    thickness: 1.2,
    height: 20,
    ),
    itemCount: productData.productFavoritesList.length,
    itemBuilder: (context, index) {
    return buildFavoritesItem(context: context,
        favoriteItem: productData.productFavoritesList[index], index: index,
      onTap: (){
      }
    );
    }),
    );
  }
  Widget buildFavoritesItem({required BuildContext context,
    required CoffeeProductModel favoriteItem,
  required index,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CoffeeDetailsScreen(index: index)),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 15),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/${favoriteItem.productImage}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: buildReviewsPart(
                    address: favoriteItem.address,
                    rate: favoriteItem.rate,
                    reviews: favoriteItem.reviews
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }

}


