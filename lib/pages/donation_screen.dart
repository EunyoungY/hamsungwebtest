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
        title: Text('후원하기', style: TextStyle(color: Colors.black),),
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
                print("로고 클릭!!");
              },
            ),
            tab(context, 'donate'),
          ],
        ),
        Center(
          child: Text('데스크탑용 모금페이지 준비중...')
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
        Center(child: Text('모금해주신 소중한 후원금은', style: TextStyle(fontSize: 13.0.w, fontWeight: FontWeight.bold),)),
        SizedBox(height: 5.h,),
        Center(child: Text('크리스천 청년 사역을 위해 사용됩니다.', style: TextStyle(fontSize: 13.0.w, fontWeight: FontWeight.bold),)),
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
                      Text('기업은행', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 11.w),),
                      SizedBox(height: 10.h,),
                      Text('158-124041-01-012', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 11.w),),
                      SizedBox(height: 20.h,),
                      GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(
                              text: '158-124041-01-012'));

                          final snackBar = SnackBar(content: Text('계좌가 복사되었습니다.'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // Get.snackbar('계좌가 복사되었습니다.', '158-124041-01-012', snackPosition: SnackPosition.BOTTOM);

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
                          child: Center(child: Text('계좌 복사하기', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 11.w),)),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Text('소프트웨어팩토리(주)', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 11.w),),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }

}