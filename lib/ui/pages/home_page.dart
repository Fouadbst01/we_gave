import 'package:flutter/material.dart';

import '../widgets/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            HomeHeader(height: height * 0.3),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: height * 0.7,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35))),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 9,
                                spreadRadius: 2)
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/A-.png",
                              height: 90,
                              width: 90,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "demanded_by",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Casablance",
                                    style: TextStyle(fontSize: 18)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("10 " + "Sachet")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 30,
                        top: 10,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Theme.of(context).primaryColor,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  );
                },
                physics: BouncingScrollPhysics(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
