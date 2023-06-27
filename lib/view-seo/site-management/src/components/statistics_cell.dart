import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';

import 'site_settings_view.dart';

class StatisticsCell extends StatelessWidget {
  const StatisticsCell({
    super.key,
    this.siteName,
    this.isSiteName = true,
    this.isChild = false,
    this.siteChild,
    this.child,
  });

  final String? siteName;
  final bool isSiteName;
  final List<Widget>? child;
  final bool isChild;
  final Widget? siteChild;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                isChild
                    ? Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 3),
                            child: Text("友情链接："),
                          ),
                          ...child ?? [],
                          const Expanded(child: SizedBox()),
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
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isSiteName
                          ? Text(siteName ?? "域名：any666.top 的代码：")
                          : const SizedBox(),
                      isChild
                          ? const SizedBox()
                          : VariousStatelessButton(
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
                ),
                siteChild ?? const SizedBox(),
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

  Widget iRadioList() {
    return const ITextListCell(
      title: "友链展示",
      children: [
        ITextRadio(
          value: HttpOptions.option1,
          title: "不显示",
        ),
        ITextRadio(
          value: HttpOptions.option2,
          title: "首页",
        ),
        ITextRadio(
          value: HttpOptions.option3,
          title: "首页和内页全站",
        ),
      ],
    );
  }
}
