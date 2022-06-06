import 'package:flutter/material.dart';
import 'package:flutter_dashboard/layout/responsive_layout.dart';
import 'package:flutter_dashboard/page/drawer/drawer_page.dart';
import 'package:flutter_dashboard/page/panel_center_page.dart';
import 'package:flutter_dashboard/page/panel_left_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : Container(),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? Container()
            : currentIndex == 1
                ? Container()
                : Container(),
        tablet: Row(
          children: [
            Expanded(child: Container()),
            Expanded(
              child: Container(),
            )
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: Container()),
            Expanded(child: Container()),
            Expanded(
              child: Container(),
            )
          ],
        ),
        computer: Row(
          children: [
            const Expanded(child: DrawerPage()),
            const Expanded(child: PanelLeftPage()),
            const Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
      drawer: const DrawerPage(),
    );
  }
}
