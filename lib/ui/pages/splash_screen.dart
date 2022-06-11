import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global/global_varialble.dart';
import '../../models/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void NaviagateToHome() async {
    final prefs = await SharedPreferences.getInstance();
    String? key = prefs.getString("access_token");
    if (key == null)
      Timer(Duration(seconds: 2), () {
        Navigator.of(this.context).popAndPushNamed("/Login");
      });
    else{
      String? user = await prefs.getString("user");
      if(user==null)
        Navigator.of(this.context).popAndPushNamed("/Login");
      else
        Global.user=User.fromJson(jsonDecode(user));
      Timer(Duration(seconds: 2), () {
        Navigator.of(this.context).popAndPushNamed("/Home");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    NaviagateToHome();
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Padding(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/weGave.png",
                    width: 150,
                    height: 150,
                  ),
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                )
              ],
            )),
      ),
    );
  }

  @override
  void initState() {
    //NaviagateToHome();
  }
}
