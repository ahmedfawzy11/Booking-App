import 'dart:convert';
import 'dart:math';


import 'package:booking_app/authentication/Infomodel.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Auth {
  Future login(String email, String password) async {
    final api = Uri.parse('http://api.mahmoudtaha.com/api/auth/login');


    final data = {"email": email, "password": password};
    // final dio = Dio();
    http.Response response;
    response = await http.post(api, body: data);
    if (response.statusCode == 200) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      getprofile();


      await storage.setString('TOKEN', body['data']['api_token']);
      await storage.setString('NAME', body['data']['name']);
      await storage.setString('EMAIL', body['data']['email']);
      await storage.setString('Id', body['data']['id'].toString());



      return InfoModel(email: body['data']['email'], token: body['data']['api_token'], id: '', name: '', image: '');

    } else {
      print("error");
    }
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('TOKEN').toString();
  }

  Future getprofile() async {
    final api = Uri.parse('http://api.mahmoudtaha.com/api/auth/profile-info');



    String token = await getToken();
    final response = await http.get(api, headers: {
      'token': '$token',
    });
    if (response.statusCode == 200) {
      print('Token : ${token}');
      final body = json.decode(response.body);
      SharedPreferences storage = await SharedPreferences.getInstance();


      print(json.decode(response.body));
      return InfoModel(email: body['data']['email'], token: body['data']['api_token'], id: '', name: '', image: '');

      // Do the rest of job here
    }

  }




  Future signup(String name,String email, String password) async {
    final api = Uri.parse('http://api.mahmoudtaha.com/api/auth/register');


    final data = {"name":name,"email": email, "password": password,"password_confirmation": password};
    // final dio = Dio();
    http.Response response;
    response = await http.post(api, body: data);
    if (response.statusCode == 200) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      print(body.toString());

      await storage.setString('TOKEN', body['data']['api_token']);
      return InfoModel(email: email, token: body['data']['api_token'], id: '', name: name, image: '');


    } else {

    }
  }


  Future changeinfo(String name , String email) async {
    final api = Uri.parse('http://api.mahmoudtaha.com/api/auth/update-info');


    final data = {"name":name,"email": email};

    String token = await getToken();
    final response = await http.post(api, headers: {
      'token': '$token',
    },body: data);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      print(body.toString());


      return InfoModel(email: email,id: '', name: name, image: '', token: '');

    }

  }





}