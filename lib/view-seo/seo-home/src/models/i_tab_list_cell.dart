import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/utils/utils.dart';

import 'seo_servers_model.dart';

class ITabListCell extends StatelessWidget {
  const ITabListCell(
      {super.key,
      this.onTap,
      this.isSelect = false,
      required this.domainModel,
      this.onPressed,
      this.isView = false});

  final VoidCallback? onTap;
  final bool isSelect;
  final DomainNameModel domainModel;
  final VoidCallback? onPressed;
  final bool isView;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isSelect ? Colors.greenAccent : Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5).copyWith(bottom: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const INetworkImage(
              width: 40,
              height: 27,
              fit: BoxFit.cover,
              borderRadius: 5,
              placeholder: ImgAsset.baidu,
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xD5F1FFFF),
                  border:
                      Border.all(color: const Color(0xD5B7B7B7), width: 0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  domainModel.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
            if (isView) ...[
              const Expanded(child: SizedBox()),
              typeValue(domainModel.type),
              domainModel.type == NavigationDrawerType.failure
                  ? ITooltip(
                      message: domainModel.message ?? '',
                      icon: Icons.alarm,
                      color: Colors.amber,
                    )
                  : ITooltip(
                      message: domainModel.message ?? '',
                    ),
              SizedBox(
                height: 27,
                child: VariousStatelessButton(
                  onPressed: onPressed,
                  color: Colors.red,
                  textColor: Colors.white,
                  title: "删除",
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget typeValue(
    NavigationDrawerType type,
  ) {
    switch (type) {
      case NavigationDrawerType.http:
        return httpCell();
      case NavigationDrawerType.failure:
        return failureCell();
      case NavigationDrawerType.waiting:
        return waitingCell();
      case NavigationDrawerType.closeHttps:
        return closeHttpsCell();
    }
  }

  Widget typeButtonCell(
    String title, {
    double? height,
    Color? color,
    Color? textColor,
    double? size,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: height == null
          ? const EdgeInsets.symmetric(horizontal: 5, vertical: 3)
          : const EdgeInsets.symmetric(horizontal: 5).copyWith(top: 8),
      height: height,
      decoration: BoxDecoration(
        color: color ?? const Color.fromARGB(255, 253, 234, 234),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        title,
        style: TextStyle(color: textColor, fontSize: size),
      ),
    );
  }

  Widget httpCell() {
    return typeButtonCell(
      "HTTP",
      height: 25,
      size: 10,
    );
  }

  Widget failureCell() {
    return typeButtonCell(
      "建站失败",
      size: 14,
      textColor: const Color.fromARGB(255, 233, 89, 78),
    );
  }

  Widget waitingCell() {
    return typeButtonCell(
      "建站失败",
      size: 14,
      color: const Color.fromARGB(255, 221, 228, 248),
      textColor: const Color.fromARGB(255, 7, 106, 255),
    );
  }

  Widget closeHttpsCell() {
    return const Padding(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Icon(
            Icons.lock,
            color: Color.fromARGB(188, 133, 253, 122),
            size: 15,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              "HTTPS",
              style: TextStyle(
                  color: Color.fromARGB(255, 243, 105, 105), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
