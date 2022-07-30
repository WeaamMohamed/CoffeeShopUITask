import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class RoundedCoffeeCard extends StatelessWidget {
   BuildContext context;
   double rate;
   int reviews;
   String address;
  RoundedCoffeeCard({required this.context,required this.rate, required this.reviews, required this.address});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 30,
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildReviewsPart(address: address,
              rate: rate,
              reviews:reviews),
          Expanded(

            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  _buildCardItem(text: 'Coffe', icon: Icons.coffee_outlined),
                  _buildCardItem(text: 'Milk', icon: Icons.coffee_maker_rounded),
                ],
              ),
            ),
          ),


          buildDefaultButton(text: 'Order now'),

        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(45),
          topStart: Radius.circular(45),
        ),

      ),
    );
  }
}
Widget _buildCardItem({
  required String text,
  required IconData icon,
}) => Container(
  padding: EdgeInsets.symmetric(horizontal: 30),
  height: double.infinity,
  decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(15) ),
  child: Column(
    mainAxisSize: MainAxisSize.min
    ,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(icon, size: 40,
        color: Colors.brown[500],),
      Text(text, style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),),

    ],
  ),
);