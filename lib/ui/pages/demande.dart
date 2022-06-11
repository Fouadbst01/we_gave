import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../widgets/blood_type_widget.dart';

class Demande extends StatefulWidget {
  @override
  _DemandeState createState() => _DemandeState();
}

class _DemandeState extends State<Demande> {
  int _focusedIndex = 0;
  List<String> typeS = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5F5),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
            child: Center(
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              Text(
                "Demande du sang",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF707070)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              Text(
                "Type sanguin",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7272)),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                child: Column(children: [
                  Expanded(
                    child: ScrollSnapList(
                        itemCount: 8,
                        itemSize: 100,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        dynamicItemSize: true,
                        onItemFocus: (int index) => setState(() {
                              _focusedIndex = index;
                            }),
                        itemBuilder: (context, index) => BloodType(
                              type: typeS[index],
                            )),
                  )
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.number,

                  //initialValue: 'Input text',
                  decoration: InputDecoration(
                    //icon: Icon(Icons.account_circle_outlined,color: Theme.of(context).primaryColor,),
                    labelText: 'Nb sachet',
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    helperText: 'Type nb sachet',
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => {print(typeS[_focusedIndex])},
                  child: Text(
                    "Envoyer",
                    style: TextStyle(color: Color(0xFFFF7272)),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFFFFF),
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    side: BorderSide(color: Color(0xFFFF7272), width: 2),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
