import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-home/src/blocs/seo_home_bloc.dart';

class SeoHomePage extends StatelessWidget {
  const SeoHomePage(
      {super.key, required this.state, required this.child, required this.id});

  final GoRouterState state;
  final Widget child;
  final int id;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SEOHomeBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Body(
        onInit: bloc.onInit,
        controller: bloc.controller,
        child: Stack(
          children: [
            const Positioned.fill(child: ColoredBox(color: Colors.black)),
            Builder(builder: (context) {
              return IHomeCell(
                selectIndex: bloc.selectIndex,
                model: bloc.model,
                child: child,
              );
            }),
          ],
        ),
      ),
    );
  }
}
