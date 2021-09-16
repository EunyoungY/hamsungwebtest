import 'package:get/route_manager.dart';
import 'package:haumsung_web/pages/donation_screen.dart';
import 'package:haumsung_web/pages/introduction_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.home;

  static final routes = [
    GetPage(name: Routes.home, page: () => IntroductionScreen()),
    GetPage(name: Routes.donate, page: () => DonationScreen()),
  ];
}
