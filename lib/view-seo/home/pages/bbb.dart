import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-seo/home/blocs/bbb.dart';
import 'package:web_flutter/view-seo/home/blocs/web_drawer_bloc.dart';
import 'package:web_flutter/view-seo/home/components/drawer_model.dart';
import 'package:web_flutter/view-seo/home/components/home_view_cell.dart';
import 'package:web_flutter/view-seo/home/pages/aaa.dart';

import 'seo_tabar_view.dart';
import 'website_setup.dart';

class BBB extends StatelessWidget {
  const BBB({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<BBBBloc>(context);
    return HomeViewCell(
      drawerChild: Provider(
        create: (_) => WebDrawerBloc(),
        child: const LiftPage(),
      ),
      child: typeValue(bloc.model.type),
    );
  }

  Widget typeValue(
    NavigationDrawerType type,
  ) {
    switch (type) {
      case NavigationDrawerType.http:
        return const SeoTabarView();

      case NavigationDrawerType.failure:
        return const WebsiteSetup();

      case NavigationDrawerType.waiting:
        return const WebsiteSetup();

      case NavigationDrawerType.closeHttps:
        return const SeoTabarView();
    }
  }
}
