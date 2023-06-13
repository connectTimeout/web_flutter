// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:web_flutter/components/components.dart';
// import 'package:web_flutter/consts/consts.dart';
// import 'package:web_flutter/view-pages/src/views/page/website_setup.dart';
// import 'package:web_flutter/view-pages/src/views/page/seo_tabar_view.dart';

// import 'drawer_model.dart';
// import 'i_navigation_drawer_destination.dart';

// class NavigationDrawerSection extends StatefulWidget {
//   const NavigationDrawerSection({super.key});

//   @override
//   State<NavigationDrawerSection> createState() =>
//       _NavigationDrawerSectionState();
// }

// class _NavigationDrawerSectionState extends State<NavigationDrawerSection> {
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return Row(
//       children: [
//         Container(
//           width: width * 0.28,
//           margin: const EdgeInsets.all(5),
//           constraints: const BoxConstraints(minWidth: 340),
//           decoration: BoxDecoration(border: Border.all(width: 0.5)),
//           child: INavigationDrawer(
//             indicatorShape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(5),
//               side: const BorderSide(
//                 color: Colors.white,
//                 style: BorderStyle.none,
//               ),
//             ),
//             indicatorColor: Colors.black12,
//             onDestinationSelected: (selectedIndex) {
//               setState(() {
//                 navDrawerIndex = selectedIndex;
//               });
//             },
//             selectedIndex: navDrawerIndex,
//             children: <Widget>[
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).focusColor,
//                     border: const Border(bottom: BorderSide(width: 0.5))),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const VariousStatelessButton(
//                         title: '网站列表',
//                         icon: Icon(CupertinoIcons.doc_plaintext),
//                       ),
//                       IExpensiveButtons(
//                         onPressed: () {},
//                         title: '网站列表',
//                         icon: CupertinoIcons.add,
//                       ),
//                     ]),
//               ),
//               ColoredBox(
//                 color: Theme.of(context).focusColor,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           '域名列表（${listDrawer.length}）',
//                           style: Theme.of(context).textTheme.titleSmall,
//                         ),
//                       ),
//                       ...listButton.map((e) {
//                         return textButton(e.value, onPressed: e.onPressed);
//                       }),
//                       textButton(
//                         "权重倒序",
//                         onPressed: () {},
//                       ),
//                       MenuAnchor(
//                         builder: (context, controller, child) {
//                           return SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: IconButton(
//                               iconSize: 16,
//                               padding: const EdgeInsets.all(0),
//                               onPressed: () {
//                                 if (controller.isOpen) {
//                                   controller.close();
//                                 } else {
//                                   controller.open();
//                                 }
//                               },
//                               icon: const Icon(
//                                   CupertinoIcons.slider_horizontal_3),
//                             ),
//                           );
//                         },
//                         menuChildren: [
//                           MenuItemButton(
//                             child: const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text('Menu 1'),
//                             ),
//                             onPressed: () {},
//                           ),
//                           MenuItemButton(
//                             child: const Text('Menu 2'),
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               ...listDrawer.map((destination) {
//                 return INavigationDrawerDestination(
//                     label: IDrawerDestination(
//                   model: destination,
//                   onPressed: () {},
//                 )

//                     // Padding(
//                     //   padding: const EdgeInsets.symmetric(
//                     //     vertical: 5,
//                     //     horizontal: 10,
//                     //   ),
//                     //   child: Row(
//                     //     children: [
//                     //       Expanded(
//                     //         child: Row(
//                     //           children: [
//                     //             const INetworkImage(
//                     //               width: 40,
//                     //               height: 27,
//                     //               fit: BoxFit.cover,
//                     //               borderRadius: 5,
//                     //               placeholder: ImgAsset.profile,
//                     //             ),
//                     //             Container(
//                     //               margin: const EdgeInsets.only(left: 10),
//                     //               padding: const EdgeInsets.symmetric(
//                     //                   horizontal: 10, vertical: 5),
//                     //               constraints:
//                     //                   const BoxConstraints(maxWidth: 150),
//                     //               decoration: BoxDecoration(
//                     //                 color: const Color(0xD5F1FFFF),
//                     //                 border: Border.all(
//                     //                     color: const Color(0xD5B7B7B7),
//                     //                     width: 0.5),
//                     //                 borderRadius: BorderRadius.circular(5),
//                     //               ),
//                     //               child: const Text(
//                     //                 "test22.com",
//                     //                 overflow: TextOverflow.ellipsis,
//                     //                 style: TextStyle(color: Colors.blue),
//                     //               ),
//                     //             ),
//                     //           ],
//                     //         ),
//                     //       ),
//                     //       TextButton(
//                     //         onPressed: () {},
//                     //         child: Text(destination.label),
//                     //       ),
//                     //       const ITooltip(
//                     //         message: "widget.tooltipMessage",
//                     //         padding: EdgeInsets.all(0),
//                     //       ),
//                     //       const SizedBox(
//                     //         width: 10,
//                     //       ),
//                     //       SizedBox(
//                     //         height: 27,
//                     //         child: VariousStatelessButton(
//                     //           onPressed: () {},
//                     //           color: Colors.red,
//                     //           textColor: Colors.white,
//                     //           fontSize: 12,
//                     //           title: "删除",
//                     //         ),
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),

//                     );
//               }),
//             ],
//           ),
//         ),
//         Flexible(
//           child: _pageAtIndex(navDrawerIndex),
//         ),
//       ],
//     );
//   }

//   Widget textButton(
//     String value, {
//     required VoidCallback onPressed,
//   }) {
//     return InkWell(
//         onTap: onPressed,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: Text(
//             value,
//             style: const TextStyle(color: Colors.black, fontSize: 14),
//           ),
//         ));
//   }

//   static Widget _pageAtIndex(int index) {
//     if (index == 0) {
//       return const SeoTabarView();
//     }

//     if (index == 1) {
//       return const WebsiteSetup();
//     }

//     return const Center(child: Text('Settings page'));
//   }
// }
