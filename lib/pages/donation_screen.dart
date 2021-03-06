import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haumsung_web/view_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haumsung_web/widgets/dotted_border.dart';
import 'package:haumsung_web/pages/shared_widget.dart';
import 'package:routemaster/routemaster.dart';

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
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
        title: Text('νμνκΈ°', style: TextStyle(color: Colors.black),),
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
        child: ViewWrapper(desktopView: desktopView(), mobileView: mobileView()),
      ),
    );
  }



  Widget desktopView() {
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
                print("λ‘κ³  ν΄λ¦­!!");
              },
            ),
            tab(context, 'donate'),
          ],
        ),
        Center(
          child: Text('λ°μ€ν¬νμ© λͺ¨κΈνμ΄μ§ μ€λΉμ€...')
        )
      ],
    );
  }

  Widget mobileView() {
    Color green = Color(0xff5FA551);
    return ListView(
      children: [
        SizedBox(height: 30.h,),
        Container(
          width: 90.w,
          height: 90.w,
          child: Image.asset(
            'assets/images/logo1.png',
          ),
        ),

        SizedBox(height: 25.h,),
        Center(child: Text('λͺ¨κΈν΄μ£Όμ  μμ€ν νμκΈμ', style: TextStyle(fontSize: 13.0.w, fontWeight: FontWeight.bold),)),
        SizedBox(height: 5.h,),
        Center(child: Text('ν¬λ¦¬μ€μ² μ²­λ μ¬μ­μ μν΄ μ¬μ©λ©λλ€.', style: TextStyle(fontSize: 13.0.w, fontWeight: FontWeight.bold),)),
        SizedBox(height: 30.h,),

        Padding(
          padding: EdgeInsets.all(20.w),
          child: DottedBorder(
              color: green,
              dashPattern: [5, 5],
              strokeWidth: 1,
              child: Container(
                // height: (isHome) ? 144.h : 244.h,
                height: 150.w,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('κΈ°μμν', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 11.w),),
                      SizedBox(height: 10.h,),
                      Text('158-124041-01-012', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 11.w),),
                      SizedBox(height: 20.h,),
                      GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(
                              text: '158-124041-01-012'));

                          final snackBar = SnackBar(content: Text('κ³μ’κ° λ³΅μ¬λμμ΅λλ€.'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // Get.snackbar('κ³μ’κ° λ³΅μ¬λμμ΅λλ€.', '158-124041-01-012', snackPosition: SnackPosition.BOTTOM);

                        },
                        child: Container(
                          height: 25.w,
                          width: 80.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: green),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                          ),
                          child: Center(child: Text('κ³μ’ λ³΅μ¬νκΈ°', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 11.w),)),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Text('μννΈμ¨μ΄ν©ν λ¦¬(μ£Ό)', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 11.w),),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }

}