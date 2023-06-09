import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/utils/utils.dart';
import 'package:web_flutter/view-login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.location, this.text});

  final String? location;
  final String? text;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<LoginBloc>(context);
    // double stops = (MediaQuery.of(context).size.height) * 1.6 / 10;
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: INetworkImage(
              fit: BoxFit.cover,
              placeholder: ImgAsset.beijing,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const INetworkImage(
                  borderRadius: 6,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                  placeholder: ImgAsset.rap,
                ),
                const SizedBox(height: 10),
                const Text(
                  "唱跳rap篮球",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                const SizedBox(height: 30),
                SearchFrom(
                  context,
                  bloc.nameController,
                  bloc.namefocusNode,
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                SearchFrom(
                  context,
                  bloc.wordController,
                  bloc.wordfocusNode,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: 400,
                  child: CupertinoButton(
                    color: Globals.deepGreen,
                    onPressed: () {
                      Constant.login = true;
                      context.go("$location");
                    },
                    borderRadius: BorderRadius.circular(30),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text(
                      "登  录",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
