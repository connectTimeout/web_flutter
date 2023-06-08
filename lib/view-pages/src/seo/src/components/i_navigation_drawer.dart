import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/utils/utils.dart';
import 'package:web_flutter/view-pages/src/views/page/2.dart';
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
    return Row(
      children: [
        Container(
          width: 400,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
                child: Text(
                  'Mail',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
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
                        const INetworkImage(
                          width: 40,
                          height: 27,
                          fit: BoxFit.cover,
                          borderRadius: 5,
                          placeholder: ImgAsset.profile,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          constraints: const BoxConstraints(maxWidth: 150),
                          decoration: BoxDecoration(
                            color: const Color(0xD5F1FFFF),
                            border: Border.all(
                                color: const Color(0xD5B7B7B7), width: 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            "test22.com",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(destination.label),
                        ),
                        const Tooltip(
                          textAlign: TextAlign.center,
                          message: "widget.tooltipMessage",
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Icon(Icons.info_outline, size: 16)),
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

  static Widget _pageAtIndex(int index) {
    if (index == 0) {
      return const one4();
    }

    if (index == 1) {
      return const one2();
    }

    return const Center(child: Text('Settings page'));
  }
}

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination('Inbox', Icon(Icons.inbox_outlined), Icon(Icons.inbox)),
  ExampleDestination('Outbox', Icon(Icons.send_outlined), Icon(Icons.send)),
  ExampleDestination(
      'Favorites', Icon(Icons.favorite_outline), Icon(Icons.favorite)),
  ExampleDestination('Trash', Icon(Icons.delete_outline), Icon(Icons.delete)),
];

const List<ExampleDestination> labelDestinations = <ExampleDestination>[
  ExampleDestination(
      'Family', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
  ExampleDestination(
      'School', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
  ExampleDestination('Work', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
];
