import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/coffee_product_model.dart';
class ProductProvider with ChangeNotifier{

  List<CoffeeProductModel> _productsList = [
    CoffeeProductModel(rate: 4.3, reviews: 345, address: 'New cairo, Egypt', productImage: 'image4.png'),
    CoffeeProductModel(rate: 4.3, reviews: 345, address: 'New cairo, Egypt', productImage: 'image2.png'),
    CoffeeProductModel(rate: 4.3, reviews: 345, address: 'New cairo, Egypt', productImage: 'image3.png'),
    CoffeeProductModel(rate: 4.3, reviews: 345, address: 'New cairo, Egypt', productImage: 'image1.png'),
  ];
  List<CoffeeProductModel> get productItemsList{
     return [..._productsList];
  }
  List<CoffeeProductModel> _favoritesList = [];
  List<CoffeeProductModel> get productFavoritesList{
    return [..._favoritesList];
  }
  void toggleFavorite(CoffeeProductModel coffeeProductModel){
    if (coffeeProductModel.isLoved){
      _favoritesList.remove(coffeeProductModel);
      coffeeProductModel.isLoved = false;

    }
    else
      {
        _favoritesList.add(coffeeProductModel);
        coffeeProductModel.isLoved = true;
      }
     notifyListeners();

  }


}