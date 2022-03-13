import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machine_test_dukan/login/data/LoginResponse.dart';
import 'package:machine_test_dukan/network/url.dart';

class Network{
  
  Future<dynamic> doLogin(String email,String password)async{
     var params =  <String,dynamic>{};
     try{
        params["email"] = email;
        params["password"] = password;
        
        var response = await http.post(Uri.parse(loginUrl),body:json.encode(params),headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'});
        if(response.statusCode == 200){
          return LoginResponse.fromJson(json.decode(response.body));
        }else{
          return response.body;
        }
     }catch(e){
       return e.toString();
     }
  }

}