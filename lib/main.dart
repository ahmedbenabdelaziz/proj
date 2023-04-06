import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Repository/Api/ApiUser.dart';
import 'Views/LoginUser/BlocUser/Login/login_bloc.dart';
import 'Views/LoginUser/BlocUser/Registre/registre_bloc.dart';
import 'Views/LoginUser/LoginUser.dart';
import 'Views/LoginUser/Registre.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>RegistreBloc(ApiUser()),),
        BlocProvider(create: (context)=>LoginBloc(ApiUser()),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Registre(),
      ),
    );
  }
}

