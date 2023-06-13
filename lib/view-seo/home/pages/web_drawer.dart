import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-pages/src/views/page/seo_tabar_view.dart';
import 'package:web_flutter/view-pages/src/views/page/website_setup.dart';
import 'package:web_flutter/view-seo/home/blocs/web_drawer_bloc.dart';
import 'package:web_flutter/view-seo/home/components/i_navigation_drawer_destination.dart';

class WebDrawerPage extends StatelessWidget {
  const WebDrawerPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<WebDrawerBloc>(context);
    var width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (context, scope, child) {
        return Row(
          children: [
            Container(
              width: width * 0.28,
              margin: const EdgeInsets.all(5),
              constraints: const BoxConstraints(minWidth: 340),
              decoration: BoxDecoration(border: Border.all(width: 0.5)),
              child: INavigationDrawer(
                indicatorShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(
                    color: Colors.white,
                    style: BorderStyle.none,
                  ),
                ),
                indicatorColor: Colors.black12,
                onDestinationSelected: (selectedIndex) {
                  bloc.onDestinationSelected(selectedIndex);
                },
                selectedIndex: bloc.navDrawerIndex,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        border: const Border(bottom: BorderSide(width: 0.5))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const VariousStatelessButton(
                            title: '网站列表',
                            icon: Icon(CupertinoIcons.doc_plaintext),
                          ),
                          IExpensiveButtons(
                            onPressed: () {},
                            title: '网站列表',
                            icon: CupertinoIcons.add,
                          ),
                        ]),
                  ),
                  ColoredBox(
                    color: Theme.of(context).focusColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '域名列表（${bloc.listDrawer.length}）',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          ...bloc.listButton.map((e) {
                            return textButton(e.value, onPressed: e.onPressed);
                          }),
                          buildAddBtn(bloc),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ...bloc.listDrawer.map((destination) {
                    return INavigationDrawerDestination(
                      label: IDrawerDestination(
                        model: destination,
                        onPressed: () {},
                      ),
                    );
                  }),
                ],
              ),
            ),
            Flexible(
              child: typeValue(bloc.listDrawer[bloc.navDrawerIndex].type),
            ),
          ],
        );
      }),
    );
  }

  Widget buildAddBtn(WebDrawerBloc bloc) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return SizedBox(
          height: 20,
          width: 20,
          child: IconButton(
            iconSize: 16,
            padding: const EdgeInsets.all(0),
            onPressed: () => bloc.onPressed(controller),
            icon: const Icon(CupertinoIcons.slider_horizontal_3),
          ),
        );
      },
      menuChildren: [
        ...bloc.titleModel.map(
          (e) {
            return MenuItemButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(e),
              ),
              onPressed: () {},
            );
          },
        )
      ],
    );
  }

  Widget textButton(
    String value, {
    required VoidCallback onPressed,
  }) {
    return InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            value,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ));
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
