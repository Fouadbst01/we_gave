import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_gave/static_values/static_values.dart';

import '../global/global_varialble.dart';
import '../models/user_model.dart';
class AuthRepository{
  String baseUrl=StaticValue.apiUrl;
  Future<bool> login(String email,String password) async {
    String url =baseUrl+"/auth/login";
    final prefs = await SharedPreferences.getInstance();
    var data = jsonEncode({
      "email": email,
      "password": password
    });
    try{
      var respond = await Dio().post(url,data: data);
      prefs.setString("access_token", respond.data["access_token"]);
      prefs.setString("user", jsonEncode(respond.data["user"]));
      Global.user=User.fromJson(respond.data["user"]);
      return true;
    }catch (e){
      return false;
    }
  }

  Future<bool> Register(User user,String email,String password) async{
    String url =baseUrl+"/users/";
    final prefs = await SharedPreferences.getInstance();
    var data = jsonEncode({
      "first_name": user.firstName,
      "last_name": user.lastName,
      "cin": user.cin,
      "date_of_birth": "",
      "type_song": user.typeSong,
      "phoneNumber": user.phoneNumber,
      "email": email,
      "password": password
    });
    try{
      var respond = await Dio().post(url,data: data);
      print(respond.data);
      prefs.setString("access_token", respond.data["access_token"]);
      prefs.setString("user", jsonEncode(respond.data["user"]));
      Global.user=User.fromJson(respond.data["user"]);
      return true;
    }catch (e){
      return false;
    }
  }
}