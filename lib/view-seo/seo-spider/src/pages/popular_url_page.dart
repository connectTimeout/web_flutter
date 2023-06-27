import 'package:flutter/material.dart';

class PopularURLPage extends StatelessWidget {
  const PopularURLPage({super.key});

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
                ...fileFormatLists.map(
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

List<String> fileFormatLists = [
  "URl",
  "请求数",
  "流量",
];
