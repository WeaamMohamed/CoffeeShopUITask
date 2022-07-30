import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/styles/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeadlinePart(),
        SizedBox(height: 15,),
        _buildSearchPart(),
      ],
    );
  }
}

Widget _buildSearchPart() => Container(
  height: 55,
  child:  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Expanded(
        child: Container(
          decoration: BoxDecoration(

            color:  Colors.grey[300],
            borderRadius: BorderRadius.circular(20)
            ,        ),

          child: TextField(
            onSubmitted: (String productName) async {
              print(productName);
            },

            cursorColor: Colors.black,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(width: 1, color: Colors.white70),

              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),

      ),
      SizedBox(width: 15,),
      Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: cPrimaryColor,
          borderRadius: BorderRadius.circular(20)
          ,        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            fit: BoxFit.fill,


          ),
        ),
      ),
    ],
  ),
);


Widget _buildHeadlinePart() => Padding(
  padding: EdgeInsets.only(top: 30,),
  child:   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Coffee first.\nSchemes later. ',
        style: TextStyle(fontSize: 24,
            fontFamily: 'Playfair',
            fontWeight: FontWeight.w700),
      ),
      Spacer(),
      CircleAvatar(
        radius: 25.0,

        backgroundImage: AssetImage(
          'assets/images/user.png',
        ),
      ),
      SizedBox(
        height: 8,
      ),
    ],
  ),
);