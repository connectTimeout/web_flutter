import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';

class TabModel {
  final IconData? icon;
  final String? title;
  TabModel({this.icon, this.title});
}

class HomeBloc with BodyMixin {
  PageController pageController = PageController();
  final appBarScope = UpdateScope();

  List<TabModel> get homeList {
    return [
      TabModel(icon: Icons.personal_video, title: "网站统计"),
      TabModel(icon: Icons.upload_file, title: "网站收录"),
      TabModel(icon: Icons.assessment, title: "蜘蛛统计"),
      TabModel(icon: Icons.settings, title: "功能大全"),
      TabModel(icon: Icons.content_copy, title: "克隆配置"),
    ];
  }

  Future<bool?> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("退出登录提示"),
          content: const Text("您确定要退出当前登录吗?"),
          actions: <Widget>[
            TextButton(
              child: const Text("确定"),
              onPressed: () async {
                // var sp = await SpUtil.getInstance();
                // sp?.remove(userInfo);
                // ... 执行删除操作
                GoRouter.of(context).push(AppRouters.login);
                //关闭对话框
              },
            ),
            TextButton(
              child: const Text(
                "取消",
                style: TextStyle(color: Color.fromARGB(255, 255, 177, 177)),
              ),
              onPressed: () => GoRouter.of(context).pop(), //关闭对话框
            ),
          ],
        );
      },
    );
  }
}
