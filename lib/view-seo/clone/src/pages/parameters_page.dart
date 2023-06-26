import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/common/common/formatters/number_input_formatter.dart';
import 'package:web_flutter/components/common/i_number_input.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/clone/src/blocs/parameters_bloc.dart';
import 'package:web_flutter/view-seo/clone/src/model/parameters_mdoel.dart';
import 'package:web_flutter/view-seo/clone/src/model/text_switch_cell.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

import '../../../site-management/src/components/model.dart';

class ParametersPage extends StatelessWidget {
  const ParametersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ParametersBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowFlex(bloc.parameters0List),
          rowFlex(bloc.parameters1List),
          ChangeNotifierProvider<PagesScope>.value(
              value: bloc.pagesScope,
              child: Consumer<PagesScope>(builder: (_, scope, __) {
                return Column(children: [
                  ITextListCell(
                    title: "填词密度",
                    alignment: Alignment.centerLeft,
                    titleColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    isfontWeight: true,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 32,
                        child: Slider(
                          divisions: 100,
                          max: 100,
                          value: bloc.sliderValue0,
                          onChanged: (value) => bloc.onSlider(value),
                        ),
                      ),
                      NumberInputWidget(
                        controller: bloc.countController,
                        defaultVal: bloc.sliderValue0,
                        addValueChanged: (value) => bloc.onSlider(value),
                        subtractValueChanged: (value) => bloc.onSlider(value),
                        inputFormatters: [
                          NumberInputFormatter(isAllowDecimal: false)
                        ],
                      ),
                      ICheckbox(
                        value: bloc.isCheckbox,
                        onChanged: bloc.onCheckbox,
                        title: "替换A标签文本",
                      ),
                    ],
                  ),
                  ITextListCell(
                      title: "文件格式",
                      alignment: Alignment.centerLeft,
                      titleColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      isfontWeight: true,
                      children: [
                        ...fileFormatList
                            .map(
                              (e) => IRadioFileList(
                                value: e.type,
                                title: e.title,
                                onChanged: (value) =>
                                    bloc.onRadio(value, e.type),
                                isRadio: true,
                              ),
                            )
                            .toList(),
                        const ITooltip(
                          message: "克隆的文件后缀",
                          size: 18,
                        ),
                      ]),
                  ITextListCell(
                      title: "克隆深度",
                      alignment: Alignment.centerLeft,
                      titleColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      isfontWeight: true,
                      children: [
                        SizedBox(
                          width: 500,
                          height: 32,
                          child: Slider(
                            divisions: 10,
                            max: 10,
                            value: bloc.sliderValue1,
                            label: bloc.sliderValue1.round().toString(),
                            onChanged: (value) => bloc.onSlider1(value),
                          ),
                        ),
                        const ITooltip(
                          message: "克隆的文件后缀",
                          size: 18,
                        ),
                      ]),
                ]);
              })),
          rowFlex(bloc.parameters2List),
          ITextListCell(
              title: "模板限制",
              alignment: Alignment.centerLeft,
              titleColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 15),
              isfontWeight: true,
              children: [
                const ITooltip(
                  message: "克隆的文件后缀",
                  size: 18,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text("模板类型："),
                ),
                ...filePCList
                    .map(
                      (e) => IRadioFileList(
                        value: e.type,
                        title: e.title,
                        onChanged: (value) => bloc.onRadio(value, e.type),
                        isRadio: true,
                      ),
                    )
                    .toList(),
                const ITooltip(
                  message: "克隆的文件后缀",
                  size: 18,
                ),
              ]),
          rowFlex(bloc.parameters3List),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15).copyWith(bottom: 0),
            child: VariousStatelessButton(
              onPressed: () {},
              color: Colors.green,
              textColor: Colors.white,
              title: "禁用站点",
            ),
          ),
        ],
      ),
    );
  }

  Widget rowFlex(List<ParametersModel> parametersList) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: [
          ...parametersList.map(
            (e) => TextSwitchCell(
              value: e.isSwitch,
              title: e.title,
              message: e.message,
            ),
          ),
        ],
      ),
    );
  }
}
