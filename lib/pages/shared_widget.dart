import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

Widget tab(context, title) {
  return Row(
    children: [
      InkWell(
        child: Column(
          children: [
            Text('함성 서비스 소개',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            SizedBox(height: 10,),
            Container(
              height: 4,
              width: 110,
              color: title == 'introduction' ? Color(0xffB0F072) : Colors.transparent
            )
          ],
        ),
        onTap: () {
          Routemaster.of(context).push('/');
        },
      ),
      SizedBox(width: 40,),
      InkWell(
        child: Column(
          children: [
            Text('함성 모금',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            SizedBox(height: 10,),
            Container(
                height: 4,
                width: 110,
                // color: Color(0xffB0F072)
                color: title == 'donate' ? Color(0xffB0F072) : Colors.transparent
            )
          ],
        ),
        onTap: () {
          Routemaster.of(context).push('/donate');
        },
      ),
      SizedBox(width: 20,),

    ],
  );
}



Widget drawer(context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Container(
    // width: screenWidth! * 0.5,
    width: screenWidth * 0.5,
    child: Drawer(
      child: ListView(
          children: [
            Container(height: screenHeight * 0.1),
            ListTile(
              title: Text('함성 서비스 소개', style: Theme.of(context).textTheme.button),
              onTap: () {
                Navigator.pop(context);
                Routemaster.of(context).replace('/',);
              },
            ),
            ListTile(
              title: Text('함성 모금', style: Theme.of(context).textTheme.button),
              onTap: () {
                Navigator.pop(context);
                Routemaster.of(context).replace('/donate',);
              },
            ),
          ]
      ),
    ),
  );
}