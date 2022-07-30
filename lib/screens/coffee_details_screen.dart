import 'package:coffe_shop_task/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee_product_model.dart';
import 'package:coffe_shop_task/screens/widgets/rounded_coffe_card.dart';

import '../product_provider.dart';
import '../shared/components/components.dart';
class CoffeeDetailsScreen extends StatelessWidget {

  int index;
  CoffeeDetailsScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final product = productData.productItemsList[index];
    return Scaffold(
      body: SafeArea(
          child: Container(
            height: double.infinity,
            child: Stack(
              children: [
                Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Image( image: AssetImage('assets/images/${product.productImage}',),
                        fit: BoxFit.cover,
                      ),
                    )
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: customBackButton(context: context),
                ),
                Align(
                    child: RoundedCoffeeCard(context: context,  reviews: product.reviews,
                        rate: product.rate,
                        address: product.address),
                    alignment: AlignmentDirectional.bottomCenter),
              ],
            ),
          )
      ),
    );
  }
}


