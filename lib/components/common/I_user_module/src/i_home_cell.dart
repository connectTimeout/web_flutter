import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';

class IHomeCell extends StatefulWidget {
  const IHomeCell({
    super.key,
    required this.child,
    required this.model,
    this.selectIndex,
  });

  final Widget child;

  final List<ITabBarModel> model;

  final int? selectIndex;

  @override
  State<IHomeCell> createState() => _IHomeCellState();
}

class _IHomeCellState extends State<IHomeCell> {
  int? selectIndex;
  int? indexs;
  String? namePath;
  int tabbarIndex = 0;
  @override
  void initState() {
    if (widget.selectIndex != null) {
      selectIndex = widget.selectIndex;
    } else {
      selectIndex = null;
    }
    super.initState();
  }

  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const Positioned.fill(
          child: ColoredBox(
            color: Colors.black,
          ),
        ),
        BorderCell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BorderCell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).highlightColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.amberAccent, width: 0.5)),
                        child: const Text("投诉工具",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              BorderCell(
                top: BorderSide.none,
                bottom: BorderSide.none,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: size.height - 84,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.model.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var model = widget.model[index];
                                      return ITextButton(
                                        padding: const EdgeInsets.all(5),
                                        title: model.title ?? "",
                                        icon: model.icon ?? Icons.home_sharp,
                                        isIcon: true,
                                        isSelect: index == tabbarIndex,
                                        onPressed: () {
                                          setState(() {
                                            tabbarIndex = index;
                                            namePath = model.namePath;
                                          });
                                          context.goNamed(
                                            model.namePath ??
                                                AppRouters.complaintNamed,
                                            queryParameters:
                                                model.queryParameters ??
                                                    {
                                                      "serverId": "$indexs",
                                                    },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: widget.child,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onss(int index, int id) async {
    var sp = await SpUtil.getInstance();
    await sp?.putInt("serverIndex", index);
    await sp?.putInt("domainId", id);
  }
}

class ITabBarModel {
  final IconData? icon;
  final String? title;
  final String? namePath;
  final Map<String, dynamic>? queryParameters;
  ITabBarModel(this.namePath, {this.icon, this.title, this.queryParameters});
}

///边框线
BorderSide borderSide = const BorderSide(color: Colors.yellow, width: 3.0);

class BorderCell extends StatelessWidget {
  const BorderCell({
    super.key,
    required this.child,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });
  final Widget child;
  final BorderSide? top;
  final BorderSide? right;
  final BorderSide? bottom;
  final BorderSide? left;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: top ?? borderSide,
          right: right ?? borderSide,
          bottom: bottom ?? borderSide,
          left: left ?? borderSide,
        ),
      ),
      child: child,
    );
  }
}
