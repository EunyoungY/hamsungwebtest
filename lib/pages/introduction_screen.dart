import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haumsung_web/utils/color.dart';
import 'package:haumsung_web/utils/text_style.dart';
import 'package:haumsung_web/view_wrapper.dart';
import 'package:haumsung_web/pages/shared_widget.dart';
import 'package:routemaster/routemaster.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  double? screenHeight;
  double? screenWidth;
  double? topPadding;
  double? bottomPadding;
  double? sidePadding;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight! * 0.05;
    bottomPadding = screenHeight! * 0.03;
    sidePadding = screenWidth! * 0.05;
    print('Width: $screenWidth');
    print('Height: $screenHeight');

    return Scaffold(
      appBar :  screenWidth! >=950 && screenHeight! >550? PreferredSize(preferredSize: Size.fromHeight(0), child: Container(),) :
      AppBar(
        title: Text('', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData (color: screenWidth! <=950 && screenHeight! >550? Colors.black : Colors.white),
        actions: [
          IconButton(icon: Icon(Icons.menu), onPressed: () {
            scaffoldKey.currentState!.openEndDrawer();
          },)
        ],
      ),
      backgroundColor: Color(0xffFFFFFF),
      key: scaffoldKey,
      endDrawer: drawer(context),
      body: Padding(
        padding: EdgeInsets.only(
          top: 30,
        ),
        child: ViewWrapper(desktopView: desktopVew(), mobileView: mobileView()),
      ),
    );
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';


  Widget desktopVew() {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: Container(
                width: 40,
                margin: EdgeInsets.only(left: 40.w),
                child: Image.asset(
                  'assets/images/logo1.png',
                  scale: 1,
                ),
              ),
              onTap: () {
                print("로고 클릭!!");
              },
            ),
            tab(context, 'introduction'),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: Container(
                  width: 150.w,
                  child: Image.asset(
                    'assets/images/main1.png',
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24.w,
                        child: Image.asset(
                          'assets/images/logo1.png',
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      SelectableText(
                        '함께 성경을 읽는\n'
                            '새로운 방법, 함성',
                        style: headline1.copyWith(
                            fontSize: 10.0.w,
                            fontWeight: FontWeight.bold,
                            height: 1.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SelectableText(
                      '하나님을 향한 작은 목소리들이 모여 큰 \'함성\'이 됩니다.\n'
                          '가족과, 친구와, 신앙공동체와 \'함께\' 말씀을 읽고 교제함으로써\n'
                          '그분이 들으시기에 크고 기쁜 함성을 올려드립시다.',
                      style: body1.copyWith(fontSize: 6.0.w, height: 1.7)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _launchURL(
                                'https://play.google.com/store/apps/details?id=com.swfact.church&hl=ko&gl=KR');
                          },
                          style: ElevatedButton.styleFrom().copyWith(
                              backgroundColor:
                              MaterialStateProperty.all(Color(0xFF327927))),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: 250, minWidth: 190, maxHeight: 56),
                            child: Container(
                              width: 50.w,
                              padding: EdgeInsets.fromLTRB(8.w, 12.h, 8.w, 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/playstore.png',
                                    width: 32,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Google Play',
                                    style: button.copyWith(color: onSurface[50]),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 5.w,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _launchURL(
                                'https://apps.apple.com/kr/app/%ED%95%A8%EC%84%B1-%ED%95%A8%EA%BB%98-%EC%84%B1%EA%B2%BD-%EC%9D%BD%EA%B8%B0/id1552812826');
                          },
                          style: ElevatedButton.styleFrom().copyWith(
                              backgroundColor:
                              MaterialStateProperty.all(Color(0xFF327927))),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: 250, minWidth: 190, minHeight: 54),
                            child: Container(
                              width: 50.w,
                              padding: EdgeInsets.fromLTRB(8.w, 12.h, 10.w, 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/apple_logo.png',
                                    width: 25,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'App Store',
                                    style: button.copyWith(color: onSurface[50]),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                   SizedBox(
                        height: 10.h,
                      ),


                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget mobileView() {
    var screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 44.w,
                  child: Image.asset(
                    'assets/images/logo1.png',
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: SelectableText(
                    '함께 성경을 읽는\n'
                        '새로운 방법, 함성',
                    style: TextStyle(fontSize: 20.0.w, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Container(
                width: 200.w,
                child: Image.asset(
                  'assets/images/main1.png',
                ),
              ),
            ),
            SelectableText(
              '하나님을 향한 작은 목소리들이 모여 큰 \'함성\'이 됩니다.\n'
                  '가족과, 친구와, 신앙공동체와 \'함께\' 말씀을 읽고 교제함으로써\n'
                  '그분이 들으시기에 크고 기쁜 함성을 올려드립시다.',
              style: TextStyle(
                  fontSize: 12.0.w, fontWeight: FontWeight.bold, height: 1.7),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            ElevatedButton(
                onPressed: () {
                  _launchURL(
                      'https://play.google.com/store/apps/details?id=com.swfact.church&hl=ko&gl=KR');
                },
                style: ElevatedButton.styleFrom().copyWith(
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xFF327927))),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 250, minWidth: 170),
                  child: Container(
                    width: 30.w,
                    padding: EdgeInsets.fromLTRB(8.w, 12.h, 8.w, 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/playstore.png',
                          width: 32,
                          color: Colors.white,
                        ),
                        Text('Google Play'),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 18.h,
            ),
            ElevatedButton(
                onPressed: () {
                  _launchURL(
                      'https://apps.apple.com/kr/app/%ED%95%A8%EC%84%B1-%ED%95%A8%EA%BB%98-%EC%84%B1%EA%B2%BD-%EC%9D%BD%EA%B8%B0/id1552812826');
                },
                style: ElevatedButton.styleFrom().copyWith(
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xFF327927))),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 250, minWidth: 170),
                  child: Container(
                    width: 50.w,
                    padding: EdgeInsets.fromLTRB(8.w, 12.h, 10.w, 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/apple_logo.png',
                          width: 25,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text('App Store'),
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
