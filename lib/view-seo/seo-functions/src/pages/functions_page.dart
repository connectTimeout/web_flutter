import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-functions/functions.dart';
import 'package:web_flutter/view-seo/seo-home/seo_home.dart';

class Functionspage extends StatelessWidget {
  const Functionspage({
    super.key,
    required this.state,
    required this.child,
    required this.id,
    this.routerNamed,
  });

  final GoRouterState state;
  final Widget child;
  final int id;
  final String? routerNamed;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<FunctionsBloc>(context);
    List<DomainNameModel>? domainList = bloc.domainMap[id];
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
                    children: [
                      const IExpensiveButtons(
                        title: '网站列表',
                        icon: CupertinoIcons.doc_plaintext,
                      ),
                      Offstage(
                        offstage: bloc.tabIndex != 0,
                        child: IExpensiveButtons(
                          onPressed: () {},
                          title: '手动输入',
                          icon: CupertinoIcons.add,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: ParentChildCheckbox(
                    children: domainList,
                  ),
                ),
              ],
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 3),
            child: Container(
              height: MediaQuery.of(context).size.height - 85,
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
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bloc.tabNameList.length,
                      itemBuilder: (context, index) {
                        var tabModel = bloc.tabNameList[index];
                        return ITextTabBarCell(
                          title: tabModel.title,
                          isSelect: index == bloc.tabIndex,
                          onPressed: () => bloc.onPressed(
                            context,
                            index,
                            id,
                            tabModel,
                          ),
                        );
                      },
                    ),
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
            ),
          ),
        ),
      ],
    );
  }
}
