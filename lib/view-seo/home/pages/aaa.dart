import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/home/blocs/web_drawer_bloc.dart';
import 'package:web_flutter/view-seo/home/components/drawer_model.dart';
import 'package:web_flutter/view-seo/home/components/i_navigation_drawer_destination.dart';

class LiftPage extends StatelessWidget {
  const LiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<WebDrawerBloc>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
          ChangeNotifierProvider<PagesScope>.value(
              value: bloc.pageScope,
              child: Consumer<PagesScope>(builder: (contexts, scope, child) {
                return Column(
                  children: bloc.listDrawer.map((e) {
                    int index = bloc.listDrawer.indexOf(e);
                    return PageLeftItem(
                      isSelect: index == bloc.navDrawerIndex,
                      onTap: () {
                        bloc.selectIndex = index;
                        context.goNamed(AppRouters.bbbNamed, extra: e);
                      },
                      model: e,
                    );
                  }).toList(),
                );
              })),
        ],
      ),
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
}

class PageLeftItem extends StatelessWidget {
  final bool isSelect;
  final VoidCallback? onTap;
  final DrawerModel model;

  const PageLeftItem({
    Key? key,
    this.isSelect = false,
    this.onTap,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final itemWith = constraints.maxWidth - 20;
      bool showIcon = itemWith < 150 + 10;
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: IDrawerDestination(
          model: model,
          isSelect: isSelect,
          showIcon: showIcon,
        ),
      );
    });
  }
}
