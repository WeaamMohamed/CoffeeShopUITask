import 'package:coffe_shop_task/product_provider.dart';
import 'package:coffe_shop_task/screens/coffee_details_screen.dart';
import 'package:coffe_shop_task/screens/widgets/grid_product_item.dart';
import 'package:coffe_shop_task/screens/widgets/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeHomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context, listen: false);
    final productsList = productData.productItemsList;
    return Scaffold(
    body: SafeArea(
    child:  Padding(
    padding: EdgeInsets.symmetric(
    horizontal: 25,
    ),
    child: SingleChildScrollView(
    child: Column(

    children: [

    HomeHeader(),
    SizedBox(height: 15,),
    Container(
    padding: EdgeInsets.symmetric(vertical: 15),
    width: double.infinity,
    child: Text('Coffee products',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600
    ),),
    ),
    GridView.count(
    childAspectRatio: 1 / 1.7,
physics: NeverScrollableScrollPhysics(),
crossAxisCount: 2,
shrinkWrap: true,

// crossAxisSpacing: 4.0,
// mainAxisSpacing: 8.0,
children: List.generate(productsList.length, (index) {
return GestureDetector(
onTap: (){

Navigator.push(
context,
MaterialPageRoute(builder: (context) =>  CoffeeDetailsScreen(index:
index,)),
);
},
child: GridProductItem(

index: index
  //, productModel: productsList[index],
),
);
}
),),
],
),
),
),
)
);
  }
}
