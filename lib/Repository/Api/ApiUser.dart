import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Model/UserModel.dart';
class ApiUser{

  Future LoginUser(String email,String password) async {
    http.Response response = await http.post(
      Uri.parse("http://192.168.1.25/index.php"),
      body: jsonEncode(<String, dynamic>{
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);
      return data;
    } else {
    print("error");
    }
  }


  Future RegistreUser(String nom,prenom,email,password, date ,telephone,image) async {
    http.Response response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/login_etudiant"),
      body: jsonEncode(<String, dynamic>{
        "nom": nom,
        "prenom": prenom,
        "email": email,
        "password": password,
        "date_de_naissance": date.toString(),
        "telephone": telephone,
        "image": image,
      }),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.body);

    } else {
  print("object");
    }
  }

  Future m(String email,String password) async {
    http.Response response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/login_etudiant"),
      body: jsonEncode(<String, dynamic>{
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.body);
    } else {

    }
  }
}