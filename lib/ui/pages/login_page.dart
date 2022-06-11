import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftoast/ftoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_gave/bloc/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool valid1 = false;
  bool valid2 = false;
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child:
                      Image.asset("assets/weGave.png", height: 40, width: 40),
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: 0,
            right: 0,
            child: Container(
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 4,
                            blurRadius: 15)
                      ]),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Form(
                          key: _formKey,
                          child: StatefulBuilder(builder: (context, setState) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                    controller: email,
                                    validator: (value) {
                                      print("*******" + value.toString());
                                      return value != null && value.isEmpty
                                          ? "Pmease enter ur Name name"
                                          : "";
                                    },
                                    cursorColor: Theme.of(context).primaryColor,
                                    keyboardType: TextInputType.emailAddress,
                                    //initialValue: 'Input text',
                                    decoration: InputDecoration(
                                      //icon: Icon(Icons.account_circle_outlined,color: Theme.of(context).primaryColor,),
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                      helperText: 'Type your email',
                                      errorText: valid1 ? "Email is Empty" : "",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    )),
                                TextFormField(
                                    controller: password,
                                    obscureText: true,
                                    cursorColor: Theme.of(context).primaryColor,
                                    //initialValue: 'Input text',
                                    decoration: InputDecoration(
                                      //icon: Icon(Icons.account_circle_outlined,color: Theme.of(context).primaryColor,),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                      helperText: 'Type your password',
                                      errorText:
                                          valid2 ? "Password is Empty" : "",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (email.text.isEmpty)
                                        valid1 = true;
                                      else
                                        valid1 = false;
                                      if (password.text.isEmpty)
                                        valid2 = true;
                                      else
                                        valid2 = false;
                                    });
                                    if (!valid1 && !valid2) {
                                      BlocProvider.of<LoginBloc>(context).add(
                                          Login(
                                              userName: email.text,
                                              passwor: password.text));
                                    }
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      "SIGN IN",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                GestureDetector(
                                  onTap: ()=> Navigator.of(context).pushNamed("/Register"),
                                  child: Text("Dont have an account ?",style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600
                                  ),),
                                )
                              ],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSucces) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/Home", (r) => false);
                  //return CircularProgressIndicator(color: Theme.of(context).primaryColor,);
                }
                if (state is LoginError) {
                  FToast.toast(context,
                      msg: "Incorrect Email or Password", color: Colors.red);
                }
              },
              child: Container()),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                if (state is LoginStart) {
                  return CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  );
                }
                return Container();
              }),
            ),
          ),
        ],
      ),
    )));
  }

  String validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return "";
  }
}
