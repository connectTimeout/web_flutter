import 'package:flutter/material.dart';

import '../../seo/src/components/i_navigation_drawer.dart';

class WebStatisticsPage extends StatelessWidget {
  const WebStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Theme.of(context).dialogBackgroundColor,
        child: const NavigationDrawerSection(),
      ),
    );
  }
}
