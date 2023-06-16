import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/utils/utils.dart';

import '../components/border_cell.dart';

class WebTabPage extends StatelessWidget {
  const WebTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "狂侠站群系统",
              style: TextStyle(color: Theme.of(context).cardColor),
            ),
            Expanded(
                child: Align(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.amberAccent, width: 0.5)),
                child: const Text("电商-01 - 156.233.143.202",
                    style: TextStyle(color: Colors.white)),
              ),
            )),
            const INetworkImage(
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              borderRadius: 10,
              placeholder: ImgAsset.profile,
            ),
            const SizedBox(width: 15),
            Text(
              "nihao",
              style: TextStyle(color: Theme.of(context).cardColor),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.circle_notifications,
                color: Colors.white,
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
