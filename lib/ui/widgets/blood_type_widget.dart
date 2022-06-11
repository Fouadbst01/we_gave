import 'package:flutter/material.dart';

class BloodType extends StatelessWidget {
  String type;

  BloodType({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              width: 100,
              height: 100,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                    child: Image(
                        image:
                        AssetImage('assets/' + type + '.png'))),
              )),
        ],
      ),
    );
  }
}
