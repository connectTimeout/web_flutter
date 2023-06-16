import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/view-seo/home/blocs/web_drawer_bloc.dart';
import 'package:web_flutter/view-seo/home/pages/web_drawer.dart';

class WebStatisticsPage extends StatelessWidget {
  const WebStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.84,
      child: ColoredBox(
        color: Theme.of(context).dialogBackgroundColor,
        child: Provider(
          create: (_) => WebDrawerBloc(),
          child: const WebDrawerPage(),
        ),
      ),
    );
  }
}
