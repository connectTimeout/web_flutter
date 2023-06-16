import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'drawer_page.dart';

class TemplatePage extends StatelessWidget {
  final Widget child;
  const TemplatePage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      // tablet: (BuildContext context) => TemplateTabletPage(
      //   child: child,
      // ),
      desktop: (BuildContext context) => TemplateDesktopPage(
        child: child,
      ),
    );
  }
}
