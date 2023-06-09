import 'package:flutter/material.dart';

class ITextTabBar extends StatelessWidget {
  const ITextTabBar(
      {super.key, required this.tabsList, required this.children});
  final List<Widget> children;
  final List<Tab> tabsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(5).copyWith(left: 0),
        padding: const EdgeInsets.all(5).copyWith(bottom: 0),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5),
          color: Theme.of(context).highlightColor,
        ),
        child: Column(children: [
          DefaultTabController(
            length: tabsList.length,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    labelPadding: const EdgeInsets.all(2).copyWith(bottom: 0),
                    padding:
                        const EdgeInsets.all(5).copyWith(bottom: 0, left: 0),
                    isScrollable: true,
                    labelColor: Colors.blue,
                    dividerColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                    mouseCursor: MouseCursor.defer,
                    unselectedLabelColor: Colors.black,
                    indicator: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                    ),
                    tabs: [...tabsList],
                  ),
                  Flexible(
                    child: TabBarView(
                      children: children,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
