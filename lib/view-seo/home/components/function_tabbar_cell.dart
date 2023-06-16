import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/home/components/function_tabbar_model.dart';

class FunctionTabBarCell extends StatelessWidget {
  const FunctionTabBarCell({
    super.key,
    required this.functionList,
    this.onLogout,
    this.onPressed,
    this.isSelect = false,
  });
  final List<FunctionTabBarModel> functionList;
  final VoidCallback? onLogout;
  final VoidCallback? onPressed;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 5,
      width: MediaQuery.of(context).size.width * 0.84 - 5,
      child: Row(
        children: [
          ...functionList.map((e) {
            return Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IFunctionButton(
                isSelect: isSelect,
                title: e.title,
                icon: e.icon,
                onPressed: onPressed,
              ),
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
            onPressed: onLogout,
          ),
        ],
      ),
    );
  }
}
