import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/view-seo/home/blocs/web_drawer_bloc.dart';
import 'package:web_flutter/view-seo/home/pages/aaa.dart';
import 'seo_tabar_view.dart';

class TemplateDesktopPage extends StatelessWidget {
  const TemplateDesktopPage({
    Key? key,
    this.child,
    this.drawerChild,
  }) : super(key: key);
  final Widget? child;
  final Widget? drawerChild;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return ColoredBox(
      color: Theme.of(context).cardColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.28,
            height: height,
            margin: const EdgeInsets.all(5),
            constraints: const BoxConstraints(minWidth: 340),
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            child: drawerChild ??
                Provider(
                  create: (_) => WebDrawerBloc(),
                  child: const LiftPage(),
                ),
          ),
          Expanded(child: child ?? const SeoTabarView()),
        ],
      ),
    );
  }
}
