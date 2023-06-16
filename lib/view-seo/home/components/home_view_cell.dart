import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/utils/utils.dart';
import 'package:web_flutter/view-seo/home/blocs/function_tabber_bloc.dart';
import 'package:web_flutter/view-seo/home/blocs/select_server.dart';
import 'package:web_flutter/view-seo/home/components/border_cell.dart';
import 'package:web_flutter/view-seo/home/pages/drawer_page.dart';
import 'package:web_flutter/view-seo/home/pages/function_tabbar_page.dart';
import 'package:web_flutter/view-seo/home/pages/select_server_page.dart';
import 'package:web_flutter/view-seo/home/pages/web_tab_page.dart';

class HomeViewCell extends StatelessWidget {
  const HomeViewCell({
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
    return Scaffold(
      body: Body(
        child: Stack(
          children: [
            const Positioned.fill(
              child: INetworkImage(
                fit: BoxFit.cover,
                placeholder: ImgAsset.beijing,
              ),
            ),
            BorderCell(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const WebTabPage(),
                      BorderCell(
                        top: BorderSide.none,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Provider(
                              create: (_) => SelectServerBloc(),
                              child: const SelectServerPage(),
                            ),
                            SizedBox(
                              height: height - 5,
                              width: width * 0.84 - 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Provider(
                                    create: (_) => FunctionTabBerBloc(),
                                    child: const FunctionTabBarPage(),
                                  ),
                                  Expanded(
                                    child: TemplateDesktopPage(
                                      drawerChild: drawerChild,
                                      child: child,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
