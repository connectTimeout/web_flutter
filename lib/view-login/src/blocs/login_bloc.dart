import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';

class LoginBloc with BodyMixin<dynamic> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController wordController = TextEditingController();
  final FocusNode namefocusNode = FocusNode();
  final FocusNode wordfocusNode = FocusNode();

  // void login(BuildContext contexts) => request(() async {
  //       LoginParams params = LoginParams();
  //       params.username = '18311724370';
  //       params.password = '123456';
  //       await HomeRequest.postLogin(params: params);
  //       wordfocusNode.dispose;

  //       if (contexts.mounted) {

  //       }
  //     });

  void login(String location) async {
    try {
      debugPrint('login:$location');

      Constant.login = true;
      context.go(location);

      GoRouter.of(context).dispose();
    } catch (e) {
      UX.toast(e.toString());
      UX.hidden();
    }
  }
}
