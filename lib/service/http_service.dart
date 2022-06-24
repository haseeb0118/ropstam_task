

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rosptam_task/constant/constant.dart';
import 'package:rosptam_task/service/app_url.dart';

import '../model/GetModel.dart';
import '../screen/home_screen.dart';

class HttpService {

  static void login(String email,String password,String device_token,
      BuildContext context) async {
    String url = AppUrl.login;

    try {
      final response = await http.post(Uri.parse(url),
        body: {
          "email" : email,
          "password" : password,
          "device_token": device_token,
        },
      );
       if(response.statusCode == 404){
        Constants.toastMessage('Account Not Found');
      } else if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['device_token']);
        Constants.toastMessage('Login Successful');
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomeScreen()
        ));
      }
    } catch (e){
      print(e);
    }
  }
  static Future<List<GetModel>> getApi() async {
    String url = AppUrl.getData;
    List<GetModel> getModelList = [];
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      getModelList.clear();
      for(Map i in data){
        getModelList.add(GetModel.fromJson(i));
      }
      return getModelList;
    }
    else {
      return getModelList;
    }
}


}