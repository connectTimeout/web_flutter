import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-pages/user/user.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage(
      {super.key, required this.state, required this.child, required this.id});

  final GoRouterState state;
  final Widget child;
  final int id;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserHomeBloc>(context);
    return Scaffold(
      body: Body(
        onInit: bloc.onInit,
        controller: bloc.controller,
        child: Stack(
          children: [
            const Positioned.fill(child: ColoredBox(color: Colors.black)),
            Builder(builder: (context) {
              return IHomeCell(
                apiName: AppRouters.userMessageCenterNamed,
                serverList: bloc.serverList,
                userName: "dfdf",
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
