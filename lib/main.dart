// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/route_manager.dart';
// import 'package:haumsung_web/utils/app_theme.dart';
// import 'routes/app_pages.dart';
// import 'package:routemaster/routemaster.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(builder: () {
//       return GetMaterialApp(
//         title: '함성: 함께 성경 읽기 | 함성 v2.0 업데이트 이벤트 진행중!!',
//         debugShowCheckedModeBanner: false,
//         theme: AppTheme.regularTheme,
//         getPages: AppPages.routes,
//         initialRoute: Routes.home,
//       );
//     });
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haumsung_web/pages/donation_screen.dart';
import 'package:haumsung_web/pages/introduction_screen.dart';
import 'package:haumsung_web/widgets/no_animation_page_route.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());
// NoAnimationPage(child: ShopHome()),
final routes = RouteMap(
  routes: {
    '/': (_) => NoAnimationPage(child: IntroductionScreen()),
    //   '/home': (_) => MaterialPage(child: HomeScreen()),
      // '/home/profile/:id': (_) => MaterialPage(child: ProfilePage()),
      '/donate': (_) => NoAnimationPage(child: DonationScreen()),
  },
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () {
      return GetMaterialApp.router(

        title: '함성: 함께 성경 읽기 | 함성 v2.0 업데이트 이벤트 진행중!!',
        debugShowCheckedModeBanner: false,
          // initialRoute: '/home',
        routerDelegate: RoutemasterDelegate(routesBuilder: (_) => routes),
        routeInformationParser: RoutemasterParser(),
      );
    });
  }
}


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Settings page')));
  }
}