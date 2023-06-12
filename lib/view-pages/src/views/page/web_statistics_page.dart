import 'package:flutter/material.dart';

import '../../../../view-seo/home/components/i_navigation_drawer.dart';

class WebStatisticsPage extends StatelessWidget {
  const WebStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: width * 0.84,
        child: ColoredBox(
          color: Theme.of(context).dialogBackgroundColor,
          child: const NavigationDrawerSection(),
        ),
      ),
    );
  }
}
