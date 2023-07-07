import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/model/src/server_model_entity.dart';
import 'package:web_flutter/view-seo/seo.dart';

class AddAccountPage extends StatelessWidget {
  const AddAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AddAccountBloc>(context);
    return Body<List<ServerModelEntity>?>(
      onInit: bloc.onInit,
      controller: bloc.controller,
      builder: (context, data) {
        return SingleChildScrollView(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ITextListCell(
                title: "账号",
                width: 140,
                children: [
                  ITextField(
                    controller: bloc.accountController,
                    width: 400,
                    maxLines: 3,
                    hintText: "账号",
                  ),
                  const ITooltip(message: "英文||分隔多个账号")
                ],
              ),
              ITextListCell(
                title: "每日最大投诉次数",
                width: 140,
                children: [
                  NumberInputWidget(
                    controller: bloc.maxCountController,
                    defaultVal: bloc.sliderValue,
                    subtractValueChanged: (value) => bloc.onSlider(value),
                    inputFormatters: [
                      NumberInputFormatter(isAllowDecimal: false)
                    ],
                  ),
                ],
              ),
              ChangeNotifierProvider<PagesScope>.value(
                value: bloc.pageScope,
                child: Consumer<PagesScope>(builder: (_, scope, __) {
                  return ITextListCell(
                    title: "分配的服务器ID",
                    width: 140,
                    children: [
                      Container(
                        width: 400,
                        height: 35,
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(bloc.servers ?? "请选"),
                            onRefreshDomain(bloc),
                          ],
                        ),
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: VariousStatelessButton(
                  onPressed: () => bloc.onSubmit(),
                  color: Colors.blue,
                  textColor: Colors.white,
                  title: "提交",
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget onRefreshDomain(
    AddAccountBloc bloc,
  ) {
    return MenuAnchor(
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
            icon: const Icon(CupertinoIcons.slider_horizontal_3),
          ),
        );
      },
      menuChildren: [
        ...bloc.listModel?.map(
              (e) {
                return MenuItemButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.id),
                  ),
                  onPressed: () => bloc.onMenu(e.id),
                );
              },
            ).toList() ??
            [],
      ],
    );
  }
}

List<String> titleModel = [
  "全部状态",
  "禁用站点",
  "等待建站",
  "建站中",
  "建站完成",
  "建站失败",
];
