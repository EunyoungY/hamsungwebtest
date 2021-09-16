import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
// import 'dart:html' as html;
// import 'package:get/get.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({required this.controller, required this.tabs});

  final TabController controller;
  final List<Widget> tabs;
  var tabBarIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Theme(
        data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent),
        child: TabBar(
          onTap: (index) {
            if(index == 0) {
              Routemaster.of(context).push('/home');
              // Get.toNamed('/home');
              // html.window.history.pushState(null, 'home', '#/home');
            }
            else if(index == 1) {
              Routemaster.of(context).push('/donate');
              // Get.toNamed('/donate');
              // html.window.history.pushState(null, 'home', '#/home/donation');
            }
          },
          indicatorSize: TabBarIndicatorSize.label,
          controller: controller,
          indicatorColor: Color(0xffB0F072),
          tabs: tabs,
          indicatorWeight: 4.0,
        ),
      ),
    );
  }
}
