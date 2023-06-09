import 'package:flutter/material.dart';
import 'package:web_flutter/components/common/i_button/src/various_stateless_button.dart';

class one3 extends StatelessWidget {
  const one3({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              VariousStatelessButton(
                onPressed: () {},
                color: Colors.red,
                textColor: Colors.white,
                title: "开始反审查",
              ),
              ElevatedButton(onPressed: () {}, child: Text("开始反审查")),
            ],
          )
        ]),
      ),
    );
  }
}
