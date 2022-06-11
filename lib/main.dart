import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_gave/bloc/login/login_bloc.dart';
import 'package:we_gave/bloc/register/register_bloc.dart';
import 'package:we_gave/ui/pages/demande.dart';
import 'package:we_gave/ui/pages/home_page.dart';
import 'package:we_gave/ui/pages/login_page.dart';
import 'package:we_gave/ui/pages/register_page.dart';
import 'package:we_gave/ui/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (BuildContext context) => RegisterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/Home": (context) => HomePage(),
          "/Login": (context) => LoginPage(),
          "/Register": (context) => RegisterPage(),
          "/Demande": (context) => Demande()
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xFFEB3738),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:SplashScreen());
  }
}
