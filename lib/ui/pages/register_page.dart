import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:we_gave/bloc/register/register_bloc.dart';
import 'package:we_gave/models/user_model.dart';

import '../../global/global_varialble.dart';
import '../widgets/blood_type_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  int _focusedIndex = 0;
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController cin = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: ()=>Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                ),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset("assets/weGave.png",
                        height: 100, width: 100),
                  ),
                )),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 4, blurRadius: 15)
                  ]),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "New Acount",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                            cursorColor: Theme.of(context).primaryColor,
                            //initialValue: 'Input text',
                            controller: firstName,
                            decoration: InputDecoration(
                              //icon: Icon(Icons.account_circle_outlined,color: Theme.of(context).primaryColor,),
                              labelText: 'First Name',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                              helperText: 'Type your first name',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                            )),
                        TextFormField(
                            cursorColor: Theme.of(context).primaryColor,
                            //initialValue: 'Input text',
                            controller: lastName,
                            decoration: InputDecoration(
                              //icon: Icon(Icons.account_circle_outlined,color: Theme.of(context).primaryColor,),
                              labelText: 'Last Name',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                              helperText: 'Type your last name',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                            )),
                        TextFormField(
                            cursorColor: Theme.of(context).primaryColor,
                            //initialValue: 'Input text',
                            controller: cin,
                            decoration: InputDecoration(
                              //icon: Icon(Icons.account_circle_outlined,color: Theme.of(context).primaryColor,),
                              labelText: 'Cin',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                              helperText: 'Type your cin',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                            )),
                        TextFormField(
                            cursorColor: Theme.of(context).primaryColor,
                            //initialValue: 'Input text',
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            decoration: InputDecoration(
                              //icon: Icon(Icons.account_circle_outlined,color: Theme.of(context).primaryColor,),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                              helperText: 'Type your email',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "blood Type",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          height: 100,
                          child: StatefulBuilder(
                            builder: (context, setState) => ScrollSnapList(
                                itemCount: 8,
                                itemSize: 100,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                dynamicItemSize: true,
                                onItemFocus: (int index) => setState(() {
                                      _focusedIndex = index;
                                    }),
                                itemBuilder: (context, index) => BloodType(
                                      type: Global.typeS[index],
                                    )),
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          cursorColor: Theme.of(context).primaryColor,
                          //initialValue: 'Input text',
                          controller: pass,
                          decoration: InputDecoration(
                            //icon: Icon(Icons.account_circle_outlined,color: Theme.of(context).primaryColor,),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                            helperText: 'Type your password',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () => BlocProvider.of<RegisterBloc>(context)
                              .add(Register(
                                  user: User(
                                      firstName: firstName.text,
                                      cin: cin.text,
                                      phoneNumber: "066666",
                                      lastName: lastName.text,
                                      typeSong: Global.typeS[_focusedIndex]),
                                  mail: email.text,
                                  password: pass.text)),
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            width: 200,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "CREATE ACCOUNT",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BlocListener<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSucces) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/Login", (route) => false);
                        }
                      },
                      child: BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                        if (state is RegisterStart) {
                          return CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          );
                        }
                        return Container();
                      }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
