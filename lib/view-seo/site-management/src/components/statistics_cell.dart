import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';

class StatisticsCell extends StatelessWidget {
  const StatisticsCell({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("域名：any666.top 的代码："),
                    VariousStatelessButton(
                      onPressed: () {},
                      color: Colors.green,
                      textColor: Colors.white,
                      title: "保存修改",
                      icon: const Icon(
                        CupertinoIcons.checkmark_alt_circle,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  color: const Color.fromARGB(255, 7, 15, 24),
                  width: double.infinity,
                  height: 2000,
                )
              ],
            ),
          )),
    );
  }
}
