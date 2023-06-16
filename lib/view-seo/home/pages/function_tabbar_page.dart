import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/home/blocs/function_tabber_bloc.dart';

class FunctionTabBarPage extends StatelessWidget {
  const FunctionTabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<FunctionTabBerBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          ...bloc.functionList.map((e) {
            int index = bloc.functionList.indexOf(e);
            return ChangeNotifierProvider<PagesScope>.value(
              value: bloc.pageScope,
              child: Consumer<PagesScope>(builder: (context, scope, child) {
                print(index == bloc.selectIndex);
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IFunctionButton(
                    isSelect: index == bloc.selectIndex,
                    title: e.title,
                    icon: e.icon,
                    onPressed: () {
                      bloc.selectIndex = index;
                      context.push(AppRouters.bbbPath);
                    },
                  ),
                );
              }),
            );
          }),
          const Expanded(child: SizedBox()),
          IElevatedButton(
            title: "返回主页",
            icon: Icons.home_sharp,
            onPressed: () {
              GoRouter.of(context).push(AppRouters.settingPath);
            },
          ),
          IElevatedButton(
            title: "退出登录",
            icon: Icons.power_settings_new,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
