import 'package:coffe_shop_task/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../models/coffee_product_model.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class GridProductItem extends StatelessWidget {
   int index;
   GridProductItem({
     required this.index});
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    CoffeeProductModel productModel = productData.productItemsList[index];
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size.width * 0.43,
          height: size.height * 0.3,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,

                child: Container(
                    width: size.width * 0.43 - 8,
                    height: size.height * 0.3 - 15,
                    child: ClipRRect(
                      child: Image(image:  AssetImage(
                          'assets/images/${productModel.productImage}'
                      ),
                        fit: BoxFit.fill,),
                    )
                ),
              ),
              Positioned(
                child: GestureDetector(
                onTap: (){
                  //TODO:
                  productData.toggleFavorite(productModel);

                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child:  SvgPicture.asset('assets/icons/heart.svg',
                      color: productModel.isLoved? cPrimaryColor: Colors.black,
                    ),
                    radius: 17,
                  ),
                ),
              ),
                top: 0, right: 0,),
            ],
          ),
        ),
        SizedBox(height: 10,),
        buildReviewsPart(rate: productModel.rate, reviews: productModel.reviews, address: productModel.address),


      ],
    );
  }
}
