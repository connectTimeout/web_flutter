import 'package:flutter/material.dart';

class HighRequencyPage extends StatelessWidget {
  const HighRequencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 202, 215, 223),
              border: Border.all(width: 0.3, color: Colors.grey),
            ),
            child: Row(
              children: [
                ...fileFormatList.map(
                  (e) => Expanded(
                    child: Center(child: Text(e)),
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Text("暂无数据"),
          )
        ],
      ),
    );
  }
}

List<String> fileFormatList = [
  "IP",
  "归属地",
  "请求数据",
  "流量",
];
