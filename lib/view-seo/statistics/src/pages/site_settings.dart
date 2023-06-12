import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/common/i_button/src/i_tooltip.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-seo/statistics/src/blocs/site_settings_bloc.dart';

class SiteSettingsPage extends StatelessWidget {
  const SiteSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    var width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (context, scope, child) {
        return ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      VariousStatelessButton(
                        onPressed: () => bloc.onCensorEvent(),
                        color: bloc.onCensorOffstage
                            ? const Color.fromARGB(255, 255, 193, 59)
                            : const Color.fromARGB(255, 177, 176, 176),
                        textColor: Colors.white,
                        title: bloc.onCensorOffstage ? "开启反审查" : "关闭反审查",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: VariousStatelessButton(
                          onPressed: () {},
                          color: Colors.red,
                          textColor: Colors.white,
                          title: "禁用站点",
                        ),
                      ),
                      const ITooltip(
                        message: "123456",
                        size: 18,
                      ),
                    ],
                  ),
                  VariousStatelessButton(
                    onPressed: () {},
                    color: Colors.green,
                    textColor: Colors.white,
                    title: "保存修改",
                    icon: const Icon(
                      CupertinoIcons.checkmark_alt_circle,
                      size: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              rowTextList(
                title: "网站域名",
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15)
                        .copyWith(left: 0),
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                    width: width * 0.15,
                    constraints: const BoxConstraints(minWidth: 200),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(31, 189, 189, 189),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 0.5,
                        color: const Color.fromARGB(31, 54, 54, 54),
                      ),
                    ),
                    child: const Text("test22.com"),
                  ),
                  iCheckbox(
                    value: bloc.isChecked,
                    onChanged: (value) => bloc.onCheckbox(value),
                    title: "wwww",
                  ),
                  iCheckbox(
                    value: bloc.isChecked1,
                    maxWidth: 55,
                    onChanged: (value) => bloc.onCheck1box(value),
                    title: "@",
                  ),
                  iCheckbox(
                    value: bloc.isChecked2,
                    maxWidth: 55,
                    onChanged: (value) => bloc.onCheck2box(value),
                    title: "m",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: 200,
                      height: 35,
                      child: TextField(
                        controller: bloc.controllerOutlined,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(top: 8, left: 5),
                          suffixIcon: IconButton(
                            padding: const EdgeInsets.all(0),
                            icon: const Icon(
                              Icons.clear,
                              size: 15,
                            ),
                            onPressed: () => bloc.controllerOutlined.clear(),
                          ),
                          hintText: '自定义',
                          border: const OutlineInputBorder(
                            gapPadding: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  VariousStatelessButton(
                    onPressed: () {},
                    color: Colors.blue,
                    textColor: Colors.white,
                    title: "更换域名",
                  ),
                ],
              ),
              rowTextList(
                title: "网站证书",
                children: [
                  radioList(bloc, value: HttpOptions.option1, title: "单http"),
                  radioList(bloc, value: HttpOptions.option2, title: "单https"),
                  radioList(bloc, value: HttpOptions.option3, title: "混合模式"),
                ],
              ),
              rowTextList(
                  title: "网站配置",
                  children: bloc.configureList
                      .map(
                        (e) => checkboxCell(
                          value: e.value,
                          title: e.title,
                        ),
                      )
                      .toList()),
              rowTextList(title: "解析ip", children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    width: 200,
                    height: 35,
                    child: TextField(
                      controller: bloc.controllerOutlined,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 8, left: 5),
                        hintText: '自定义',
                        border: OutlineInputBorder(
                          gapPadding: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                iCheckbox(
                  value: bloc.isChecked1,
                  maxWidth: 98,
                  onChanged: (value) => bloc.onCheck1box(value),
                  title: "自动解析",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: expensiveButton(
                    "重新解析",
                    CupertinoIcons.gobackward,
                    () {},
                  ),
                ),
                expensiveButton(
                  "效验解析",
                  CupertinoIcons.checkmark_alt_circle,
                  () {},
                ),
              ]),
              rowTextList(title: "文件格式", children: [
                radioFileList(
                  bloc,
                  value: FileFormatOptions.option1,
                  title: "html",
                ),
                radioFileList(
                  bloc,
                  value: FileFormatOptions.option2,
                  title: "php",
                ),
                radioFileList(
                  bloc,
                  value: FileFormatOptions.option3,
                  title: "jsp",
                ),
                radioFileList(
                  bloc,
                  value: FileFormatOptions.option4,
                  title: "asp",
                ),
                radioFileList(
                  bloc,
                  value: FileFormatOptions.option5,
                  title: "aspx",
                ),
                radioFileList(
                  bloc,
                  value: FileFormatOptions.option6,
                  title: "shtml",
                ),
              ]),
              rowTextList(title: "克隆网站", children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15)
                      .copyWith(left: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                  width: width * 0.15,
                  constraints: const BoxConstraints(minWidth: 200),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(31, 189, 189, 189),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 0.5,
                      color: const Color.fromARGB(31, 54, 54, 54),
                    ),
                  ),
                  child: const Text("test22.com"),
                ),
                const ITooltip(
                  message: "123456",
                  size: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15)
                      .copyWith(left: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(31, 189, 189, 189),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 0.5,
                      color: const Color.fromARGB(31, 54, 54, 54),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("6"),
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        Icons.hourglass_bottom,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ]),
              rowTextList(title: "企业名称", children: [
                SizedBox(
                  width: 300,
                  height: 35,
                  child: TextField(
                    controller: bloc.controllerOutlined,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 8, left: 5),
                      hintText: '自定义',
                      border: OutlineInputBorder(
                        gapPadding: 50,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: iCheckbox(
                    value: bloc.isChecked1,
                    maxWidth: 98,
                    onChanged: (value) => bloc.onCheck1box(value),
                    title: "自动解析",
                  ),
                ),
                expensiveButton(
                  "自动企业名称",
                  CupertinoIcons.gobackward,
                  () {},
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 6, left: 10),
                  child: Text("蜘蛛视角："),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2, right: 10),
                  child: Switch(
                      value: bloc.iSwitch, onChanged: (e) => bloc.onSwitch(e)),
                ),
                const ITooltip(
                  message: "123456",
                  size: 18,
                ),
              ]),
              rowTextList(title: "首页标题", children: [
                TextField(
                  controller: bloc.controllerOutlined,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 8, left: 5),
                    hintText: '自定义',
                    border: OutlineInputBorder(
                      gapPadding: 50,
                    ),
                  ),
                ),
              ]),
              rowTextList(title: "首页关键词", children: [
                TextField(
                  controller: bloc.controllerOutlined,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 8, left: 5),
                    hintText: '自定义',
                    border: OutlineInputBorder(
                      gapPadding: 50,
                    ),
                  ),
                ),
              ]),
              rowTextList(title: "首页描述", children: [
                TextField(
                  controller: bloc.controllerOutlined,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 8, left: 5),
                    hintText: '自定义',
                    border: OutlineInputBorder(
                      gapPadding: 50,
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        );
      }),
    );
  }

  Widget expensiveButton(
    String title,
    IconData? icon,
    void Function()? onPressed,
  ) {
    return IExpensiveButtons(
      icon: icon,
      title: title,
      onPressed: onPressed,
      selectBackgroundColor: const Color.fromARGB(183, 255, 148, 9),
      selectIconColor: Colors.white,
      selectLabelColor: Colors.white,
      uncheckBackgroundColor: const Color.fromARGB(255, 253, 242, 228),
      uncheckIconColor: const Color.fromARGB(183, 255, 148, 9),
      uncheckLabelColor: const Color.fromARGB(183, 255, 148, 9),
      iconSize: 15,
    );
  }

  Widget iCheckbox({
    required bool? value,
    required void Function(bool?)? onChanged,
    required String? title,
    double? maxWidth,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth ?? 85, maxHeight: 34),
      child: CheckboxMenuButton(
        value: value,
        onChanged: onChanged,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            title ?? '',
            style: TextStyle(color: value! ? Colors.blue : Colors.black),
          ),
        ),
      ),
    );
  }

  Widget checkboxCell({
    String? title,
    required bool value,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 243, 243),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              width: 0.5,
              color: value
                  ? const Color.fromARGB(255, 54, 202, 59)
                  : Colors.grey)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            value ? CupertinoIcons.checkmark_square_fill : CupertinoIcons.app,
            color: const Color.fromARGB(255, 221, 221, 221),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title ?? '',
            style: TextStyle(
                color: value
                    ? const Color.fromARGB(255, 54, 202, 59)
                    : Colors.grey),
          )
        ],
      ),
    );
  }

  Widget radioList(SiteSettingsBloc bloc,
      {required value, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: value,
            groupValue: bloc.selectedOption,
            onChanged: (value) => bloc.onChanged(value),
          ),
          Text(title),
        ],
      ),
    );
  }

  Widget radioFileList(SiteSettingsBloc bloc,
      {required value, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: value,
            groupValue: bloc.fileFormatOptions,
            onChanged: null,
            // (value) => bloc.onFileChanged(value),
          ),
          Text(title),
        ],
      ),
    );
  }

  Widget rowTextList({required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              "$title：",
              style: const TextStyle(
                  color: Color.fromARGB(129, 4, 24, 14),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Wrap(
              spacing: 4, // 横向间距
              runSpacing: 10, //纵向间距
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
