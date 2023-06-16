import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/utils/utils.dart';
import 'package:web_flutter/view-seo/home/components/drawer_model.dart';

class IDrawerDestination extends StatelessWidget {
  const IDrawerDestination({
    super.key,
    required this.model,
    this.onPressed,
    this.isSelect = false,
    this.showIcon = false,
  });
  final DrawerModel model;
  final VoidCallback? onPressed;
  final bool isSelect;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: isSelect ? Theme.of(context).focusColor : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: showIcon
            ? Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xD5F1FFFF),
                      border: Border.all(
                          color: const Color(0xD5B7B7B7), width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      model.value,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                typeValue(model.type),
              ])
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  INetworkImage(
                    width: 40,
                    height: 27,
                    fit: BoxFit.cover,
                    borderRadius: 5,
                    image: Utils.imgUrl(
                      image: model.image,
                    ),
                    placeholder: ImgAsset.profile,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xD5F1FFFF),
                        border: Border.all(
                            color: const Color(0xD5B7B7B7), width: 0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        model.value,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  typeValue(model.type),
                  model.type == NavigationDrawerType.failure
                      ? ITooltip(
                          message: model.message ?? '',
                          icon: Icons.alarm,
                          color: Colors.amber,
                        )
                      : ITooltip(
                          message: model.message ?? '',
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

  Widget httpCell() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(top: 8),
      height: 26,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 234, 234),
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Text(
        "HTTP",
        style: TextStyle(color: Colors.black, fontSize: 10),
      ),
    );
  }

  Widget failureCell() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 234, 234),
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Text(
        "建站失败",
        style: TextStyle(
          color: Color.fromARGB(255, 233, 89, 78),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget waitingCell() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 221, 228, 248),
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Text(
        "等待建站",
        style: TextStyle(
          color: Color.fromARGB(255, 7, 106, 255),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget closeHttpsCell() {
    return const Row(
      children: [
        Icon(
          Icons.lock,
          color: Color.fromARGB(188, 133, 253, 122),
          size: 15,
        ),
        Text(
          "HTTPS",
          style: TextStyle(
              color: Color.fromARGB(255, 243, 105, 105), fontSize: 12),
        ),
      ],
    );
  }
}
