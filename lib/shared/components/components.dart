import 'package:coffe_shop_task/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
Widget buildDefaultButton({
  @required text,
}) =>  Container(

  width:double.infinity,
  decoration: BoxDecoration(
    color: cPrimaryColor,
    borderRadius: BorderRadius.circular(15),
  ),
  child: MaterialButton(


    onPressed: (){},
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
  ),
);

Widget buildReviewsPart({
  @required rate,
  @required reviews,
  @required address}) =>  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.min,
  children: [
    Text('coffee', style: TextStyle(
      fontSize: 24,
    ),),
    SizedBox(height: 5,),
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded,
          color: cPrimaryColor,),
        SizedBox(width: 5,),
        Text('${rate}',
          style: TextStyle(
              fontWeight: FontWeight.w400
          ),),
        SizedBox(width: 5,),
        Text('${reviews} reviews', style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600

        ),),

      ],

    ),
    SizedBox(height: 5,),
    Text(address,
      style: TextStyle(
        fontWeight: FontWeight.w600,
      ),)
  ],
);

Widget customBackButton({required BuildContext context}) => GestureDetector(
  onTap: (){
    Navigator.pop(context);
  },
  child: Container(
      margin: EdgeInsets.only(top: 30, left: 20),
      decoration: BoxDecoration(
        color: cPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child:  Icon(

          Icons.arrow_back_ios_new,
          size: 25,
        ),
      )
  ),
);


Widget favoriteAvatar({required Function onTap,required bool isLoved}) => GestureDetector(
  onTap: () => onTap,
  child: CircleAvatar(
    radius: 20,
    backgroundColor: Colors.white,
    child: CircleAvatar(
      backgroundColor: Colors.grey[300],
      child:  SvgPicture.asset('assets/icons/heart.svg',
        color: isLoved? cPrimaryColor: Colors.black,
      ),
      radius: 17,
    ),
  ),
);