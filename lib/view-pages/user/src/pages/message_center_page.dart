import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-pages/user/user.dart';
import 'package:web_flutter/view-seo/seo-management/management.dart';

class MessageCenterPage extends StatelessWidget {
  const MessageCenterPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<MessageCenterBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              const Text("按域名"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ITextField(
                  controller: bloc.textController,
                  width: 200,
                  height: 35,
                  maxLines: 1,
                ),
              ),
              const Text("按域名"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ITextField(
                  controller: bloc.textController,
                  width: 200,
                  height: 35,
                  maxLines: 1,
                ),
              ),
              VariousStatelessButton(
                onPressed: () {},
                color: Colors.green,
                textColor: Colors.white,
                title: "显示页面内容",
                icon: const Icon(
                  CupertinoIcons.add,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 218, 218, 218),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      VariousStatelessButton(
                        color: Colors.blue,
                        onPressed: () {},
                        title: "删除",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IExpensiveButtons(
                          onPressed: () {},
                          title: '标记已读',
                        ),
                      ),
                      IExpensiveButtons(
                        onPressed: () {},
                        title: '全部已读',
                      ),
                    ],
                  ),
                ),
                VariousStatelessButton(
                  color: Colors.blue,
                  onPressed: () {},
                  title: "推送设置",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
