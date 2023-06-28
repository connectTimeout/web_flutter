import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo-home/src/blocs/seo_domain_bloc.dart';
import 'package:web_flutter/view-seo/seo-home/src/models/i_tab_list_cell.dart';
import 'package:web_flutter/view-seo/seo-home/src/models/seo_servers_model.dart';

class SEODomainPage extends StatelessWidget {
  const SEODomainPage({
    super.key,
    required this.state,
    required this.child,
    required this.id,
    this.isView,
    this.routerNamed,
  });

  final GoRouterState state;
  final Widget child;
  final int id;
  final bool? isView;
  final String? routerNamed;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SEODomainBloc>(context);
    List<DomainNameModel>? domainList = bloc.domainMap[id];
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return Row(
          children: [
            Container(
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                margin: const EdgeInsets.only(right: 5),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 209, 209, 209),
                          border: Border(bottom: BorderSide(width: 0.5))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const IExpensiveButtons(
                              title: '网站列表',
                              icon: CupertinoIcons.doc_plaintext,
                            ),
                            IExpensiveButtons(
                              onPressed: () {},
                              title: '网站列表',
                              icon: CupertinoIcons.add,
                            ),
                          ]),
                    ),
                    ColoredBox(
                      color: const Color.fromARGB(255, 209, 209, 209),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '域名列表（${domainList?.length ?? 0}）',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            ...bloc.listButton.map((e) {
                              return textButton(
                                e.value,
                                onPressed: e.onPressed,
                              );
                            }),
                            bloc.onRefreshDomain(context),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: domainList?.length ?? 0,
                        itemBuilder: (context, ind) {
                          int index = ind;
                          return ITabListCell(
                              isView: isView ?? false,
                              domainModel: domainList![ind],
                              isSelect: index == bloc.selectIndex,
                              onTap: () {
                                bloc.selectIndex = index;
                                context.goNamed(
                                    routerNamed ?? AppRouters.siteSettingsNamed,
                                    extra: domainList[index],
                                    queryParameters: {
                                      "serverId": "$id",
                                      "domainId": "$ind"
                                    });
                              });
                        },
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: child,
                ),
              ),
            ),
          ],
        );
      }),
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
      ),
    );
  }
}
