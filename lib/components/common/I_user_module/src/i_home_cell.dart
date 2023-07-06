import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/utils/utils.dart';
import 'package:web_flutter/view-seo/seo-home/src/models/seo_servers_model.dart';

class IHomeCell extends StatefulWidget {
  const IHomeCell({
    super.key,
    required this.child,
    this.serverName,
    this.userName,
    this.onMessage,
    this.serverList,
    this.apiName,
    required this.model,
    this.selectIndex,
  });

  final Widget child;

  ///选择的服务器
  final String? serverName;

  ///用户名称
  final String? userName;

  ///消息通知
  final VoidCallback? onMessage;

  ///服务器数据
  final List<ServersModel>? serverList;

  ///路由地址
  final String? apiName;

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
          child: INetworkImage(
            fit: BoxFit.cover,
            placeholder: ImgAsset.beijing,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "狂侠站群系统",
                        style: TextStyle(color: Theme.of(context).cardColor),
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).highlightColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.amberAccent, width: 0.5)),
                        child: Text(
                            widget.serverList![selectIndex ?? 0].serverName,
                            style: const TextStyle(color: Colors.white)),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.face_outlined,
                            size: 25,
                            color: Colors.red,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 5),
                            child: Text(
                              widget.userName ?? "nihao",
                              style:
                                  TextStyle(color: Theme.of(context).cardColor),
                            ),
                          ),
                          IconButton(
                            onPressed: widget.onMessage,
                            icon: const Icon(
                              Icons.circle_notifications,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ],
                      )
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
                                                AppRouters.siteSettingsPath,
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
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(width: 10),
                                    IElevatedButton(
                                      onPressed: () {
                                        context.go(AppRouters.homePath);
                                      },
                                      icon: Icons.home_sharp,
                                      title: "返回主页",
                                    ),
                                    IElevatedButton(
                                      title: "退出登录",
                                      icon: Icons.power_settings_new,
                                      onPressed: () {
                                        context.go(AppRouters.siteSettingsPath);
                                      },
                                    ),
                                  ],
                                )
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

  Widget _generateExpansionTileWidget(
    List<ServersModel>? serverList,
    String? apiName,
  ) {
    int index = serverList?.length ?? 0;
    return ExpansionTile(
      initiallyExpanded: true,
      tilePadding: const EdgeInsets.all(0),
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          "$index台",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
      collapsedIconColor: Colors.white,
      children: List.generate(
        serverList?.length ?? 0,
        (index) {
          int inde = index;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            child: _generateWidget(
              serverList?[index].serverName ?? '',
              inde == selectIndex,
              onPressed: () {
                setState(
                  () {
                    selectIndex = index;
                    onss(index, serverList?[index].id ?? 0);
                    indexs = index;
                  },
                );
                context.goNamed(
                  apiName ?? AppRouters.siteSettingsNamed,
                  queryParameters: {"serverId": "${serverList?[index].id}"},
                );
                print({"serverId": "${serverList?[index].id}"});
              },
            ),
          );
        },
      ),
    );
  }

  /// 生成 ExpansionTile 下的 ListView 的单个组件
  Widget _generateWidget(String title, bool isSelect,
      {VoidCallback? onPressed}) {
    /// 使用该组件可以使宽度撑满
    return Tooltip(
      margin: const EdgeInsets.only(left: 70),
      textAlign: TextAlign.center,
      message: title,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: ITextButton(
          title: title,
          onPressed: onPressed,
          isSelect: isSelect,
          padding: const EdgeInsets.symmetric(horizontal: 5),
        ),
      ),
    );
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
