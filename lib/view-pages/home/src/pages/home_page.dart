import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/utils/utils.dart';
import 'package:web_flutter/view-pages/home/src/blocs/home_bloc.dart';

import '../../../../../components/components.dart';
import '../../../../../routers/src/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<HomeBloc>(context);
    return Scaffold(
      body: Body(
        onInit: bloc.onInit,
        controller: bloc.controller,
        child: Stack(
          children: [
            const Positioned.fill(
              child: INetworkImage(
                fit: BoxFit.cover,
                placeholder: ImgAsset.beijing,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                  value: "SEO工作台",
                  onTap: () {
                    context.goNamed(
                      AppRouters.siteSettingsNamed,
                      queryParameters: bloc.queryParameters,
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                AnimatedButton(
                  value: "管理员",
                  onTap: () {
                    context.go(AppRouters.userMessageCenterPath);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int? selectIndex;
  Map<String, dynamic>? queryParameters;
  @override
  void initState() {
    onNit();
    super.initState();
  }

  void onNit() async {
    var sp = await SpUtil.getInstance();
    var selectInde = sp?.getInt("serverIndex");
    selectIndex = selectInde;
    queryParameters = {"serverId": "$selectInde"};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            const Positioned.fill(
              child: INetworkImage(
                fit: BoxFit.cover,
                placeholder: ImgAsset.beijing,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                  value: "SEO工作台",
                  onTap: () {
                    context.goNamed(
                      AppRouters.siteSettingsNamed,
                      queryParameters: queryParameters ?? {"serverId": "-1"},
                    );
                    print(selectIndex);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                AnimatedButton(
                  value: "管理员",
                  onTap: () {
                    context.go(AppRouters.userMessageCenterPath);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
