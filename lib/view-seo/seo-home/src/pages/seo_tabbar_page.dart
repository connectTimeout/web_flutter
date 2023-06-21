import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-seo/seo-home/src/blocs/seo_tabbar_bloc.dart';
import 'package:web_flutter/view-seo/seo-home/src/models/seo_servers_model.dart';

List<SEOTabBarModel>? onItemList;

class SEOTabBarPage extends StatelessWidget {
  const SEOTabBarPage({
    super.key,
    required this.state,
    required this.child,
    required this.id,
    required this.model,
  });

  final GoRouterState state;
  final Widget child;
  final int id;
  final DomainNameModel model;
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SEOTabBarBloc>(context);
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ).copyWith(bottom: 1),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 209, 209, 209),
        border: Border.all(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: [
          ChangeNotifierProvider<PagesScope>.value(
            value: bloc.pageScope,
            child: Consumer<PagesScope>(builder: (_, scope, __) {
              if (model.type == NavigationDrawerType.http ||
                  model.type == NavigationDrawerType.closeHttps) {
                onItemList = bloc.tabNameList;
              } else {
                onItemList = bloc.tabFailureList;
              }
              return SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: onItemList?.length ?? 0,
                  itemBuilder: (context, index) {
                    var tabModel = onItemList?[index];
                    return ITextTabBarCell(
                      title: tabModel?.title ?? "",
                      isSelect: index == bloc.selectIndex,
                      onPressed: () =>
                          bloc.onPressed(context, index, id, tabModel, model),
                    );
                  },
                ),
              );
            }),
          ),
          Expanded(
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
