import 'package:docoradi/Models/badrequest.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:docoradi/Models/Auth/LoginResponse.dart';

class AuthHttpService {
  static const BASE_URL = "https://docoradi-app-phrl5joxbq-uc.a.run.app";
//static const BASE_URL = "http://localhost:8080/";
  static const userloginUrl = BASE_URL + '/service/user/login';
  static const userRegisterUrl = BASE_URL + '/service/user/userRegister';
  Future<dynamic> login(Map<String, dynamic> resquestData) async {
    print(resquestData);
    var res = await post(Uri.parse(userloginUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(resquestData));
        print("jfjdfjdfjfdjf hello yeah");
    print(res.body);
    switch (res.statusCode) {
      case 200:
        dynamic body = jsonDecode(res.body);
        LoginResponseObject LoggedInuser = LoginResponseObject.fromJson(body);
        return LoggedInuser;
      default:
        return false;
    }
  }

  Future<dynamic> register(Map<String, dynamic> resquestData) async {
    var res = await post(Uri.parse(userRegisterUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(resquestData));

    // var body = jsonDecode(res.body);
    // LoginResponseObject user = LoginResponseObject.fromJson(body);
    switch (res.statusCode) {
      case 201:
        return true;
      default:
        return false;
    }
  }
}
