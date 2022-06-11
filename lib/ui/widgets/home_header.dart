import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global/global_varialble.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({required this.height});

  double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery
          .of(context)
          .viewPadding
          .top + 10, left: 20, right: 20),
      height: height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 25,
                ),
                onTap: () async{
                  var preps = await SharedPreferences.getInstance();
                  preps.clear();
                  Navigator.of(context).pushNamedAndRemoveUntil("/Login",(r)=>false);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Global.user.firstName!+" "+Global.user.lastName!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/avatar.png"))),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Text(
            "Blood Demande", style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600
          ),
          ),
          GestureDetector(
            onTap: ()=>Navigator.of(context).pushNamed("/Demande"),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 15),
                child: Icon(Icons.add,color: Colors.white,size: 25,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Colors.white,
                      width: 2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
