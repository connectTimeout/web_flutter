import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/clone/src/blocs/configuration_bloc.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({
    super.key,
    required this.state,
    required this.child,
    required this.id,
  });

  final GoRouterState state;
  final Widget child;
  final int id;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ConfigurationBloc>(context);
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChangeNotifierProvider<PagesScope>.value(
            value: bloc.pageScope,
            child: Consumer<PagesScope>(builder: (_, scope, __) {
              return SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bloc.tabNameList.length,
                  itemBuilder: (context, index) {
                    return ITextTabBarCell(
                      title: bloc.tabNameList[index].title,
                      isSelect: index == bloc.selectIndex,
                      onPressed: () => bloc.onPressed(
                          context, index, bloc.tabNameList[index]),
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
