
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/common/body/body_mixin.dart';
import 'package:web_flutter/routers/routers.dart';

class HomeBloc with BodyMixin{
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
                GoRouter.of(context).push(AppRoutes.settingPath);
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