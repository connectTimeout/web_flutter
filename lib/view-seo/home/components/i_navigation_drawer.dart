import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_flutter/components/common/i_button/src/i_tooltip.dart';
import 'package:web_flutter/components/common/i_button/src/various_stateless_button.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/utils/utils.dart';
import 'package:web_flutter/view-pages/src/views/page/website_setup.dart';
import 'package:web_flutter/view-pages/src/views/page/4.dart';

class NavigationDrawerSection extends StatefulWidget {
  const NavigationDrawerSection({super.key});

  @override
  State<NavigationDrawerSection> createState() =>
      _NavigationDrawerSectionState();
}

class _NavigationDrawerSectionState extends State<NavigationDrawerSection> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: width * 0.28,
          margin: const EdgeInsets.all(5),
          constraints: const BoxConstraints(minWidth: 340),
          decoration: BoxDecoration(border: Border.all(width: 0.5)),
          child: INavigationDrawer(
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: Colors.white,
                style: BorderStyle.none,
              ),
            ),
            indicatorColor: Colors.black12,
            onDestinationSelected: (selectedIndex) {
              setState(() {
                navDrawerIndex = selectedIndex;
              });
            },
            selectedIndex: navDrawerIndex,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    border: const Border(bottom: BorderSide(width: 0.5))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const VariousStatelessButton(
                        title: '网站列表',
                        icon: Icon(CupertinoIcons.doc_plaintext),
                      ),
                      ExpensiveButtons(
                        onPressed: () {},
                        title: '网站列表',
                        icon: CupertinoIcons.add,
                      ),
                    ]),
              ),
              ColoredBox(
                color: Theme.of(context).focusColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '域名列表（${labelDestinations.length}）',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      ...listButton.map((e) {
                        return textButton(e.value, onPressed: e.onPressed);
                      }),
                      textButton(
                        "权重倒序",
                        onPressed: () {},
                      ),
                      MenuAnchor(
                        builder: (context, controller, child) {
                          return SizedBox(
                            height: 20,
                            width: 20,
                            child: IconButton(
                              iconSize: 16,
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                if (controller.isOpen) {
                                  controller.close();
                                } else {
                                  controller.open();
                                }
                              },
                              icon: const Icon(
                                  CupertinoIcons.slider_horizontal_3),
                            ),
                          );
                        },
                        menuChildren: [
                          MenuItemButton(
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Menu 1'),
                            ),
                            onPressed: () {},
                          ),
                          MenuItemButton(
                            child: const Text('Menu 2'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ...labelDestinations.map((destination) {
                return INavigationDrawerDestination(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const INetworkImage(
                                width: 40,
                                height: 27,
                                fit: BoxFit.cover,
                                borderRadius: 5,
                                placeholder: ImgAsset.profile,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                constraints:
                                    const BoxConstraints(maxWidth: 150),
                                decoration: BoxDecoration(
                                  color: const Color(0xD5F1FFFF),
                                  border: Border.all(
                                      color: const Color(0xD5B7B7B7),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text(
                                  "test22.com",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(destination.label),
                        ),
                        const ITooltip(
                          message: "widget.tooltipMessage",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(50, 34)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          child: const Text("删除"),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
        Expanded(
          child: _pageAtIndex(navDrawerIndex),
        ),
      ],
    );
  }

  Widget textButton(
    String value, {
    required VoidCallback onPressed,
  }) {
    return InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            value,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ));
  }

  static Widget _pageAtIndex(int index) {
    if (index == 0) {
      return const one4();
    }

    if (index == 1) {
      return const WebsiteSetup();
    }

    return const Center(child: Text('Settings page'));
  }
}

class ExpensiveButtons extends StatefulWidget {
  const ExpensiveButtons({
    super.key,
    this.title,
    this.icon,
    this.onPressed,
  });
  final String? title;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  State<ExpensiveButtons> createState() => _ExpensiveButtonsState();
}

class _ExpensiveButtonsState extends State<ExpensiveButtons> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onHover: (e) {
        setState(() {
          onHover = !onHover;
        });
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 240, 240, 240)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      onPressed: widget.onPressed,
      label: Text(
        widget.title ?? '',
        style: TextStyle(color: onHover ? Colors.blue : Colors.black),
      ),
      icon: Icon(widget.icon, color: onHover ? Colors.blue : Colors.black),
    );
  }
}

class CheapButtons extends StatelessWidget {
  const CheapButtons({
    super.key,
    this.title,
    this.icon,
    this.onPressed,
  });
  final String? title;
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 240, 240, 240)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: icon == null ? 0 : 5),
            child: icon ?? const SizedBox(),
          ),
          Text(
            title ?? '',
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class TextButtonModel {
  const TextButtonModel(this.value, {required this.onPressed});
  final String value;
  final VoidCallback onPressed;
}

List<TextButtonModel> listButton = <TextButtonModel>[
  TextButtonModel("刷新", onPressed: () {}),
  TextButtonModel("广告", onPressed: () {}),
  TextButtonModel("友链", onPressed: () {}),
];

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> labelDestinations = <ExampleDestination>[
  ExampleDestination(
      'Family', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
  ExampleDestination(
      'School', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
  ExampleDestination('Work', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
];
