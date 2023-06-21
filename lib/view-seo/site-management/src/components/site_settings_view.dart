import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

///布局方式
Widget rowTextList({required String title, required List<Widget> children}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          padding: const EdgeInsets.only(top: 4, right: 10),
          alignment: Alignment.centerRight,
          child: Text(
            "$title：",
            style: const TextStyle(
              color: Color.fromARGB(129, 4, 24, 14),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 9,
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

///checkbox按钮
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

///橙色动态按钮
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

/// 按钮"开启反审查" : "关闭反审查""禁用站点",
class SiteButtonView extends StatelessWidget {
  const SiteButtonView({super.key});
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return Row(
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
                    onPressed: () => bloc.onDisablePressed,
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
              onPressed: () => bloc.onSavePressed,
              color: Colors.green,
              textColor: Colors.white,
              title: "保存修改",
              icon: const Icon(
                CupertinoIcons.checkmark_alt_circle,
                size: 15,
                color: Colors.white,
              ),
            ),
          ],
        );
      }),
    );
  }
}

///网站域名
class SiteDomainView extends StatelessWidget {
  const SiteDomainView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return rowTextList(
          title: "网站域名",
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 15).copyWith(left: 0),
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
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
              value: bloc.isCheckedW,
              onChanged: bloc.onChangedWChanged,
              title: "wwww",
            ),
            iCheckbox(
              value: bloc.isChecked,
              maxWidth: 55,
              onChanged: bloc.onChangedChanged,
              title: "@",
            ),
            iCheckbox(
              value: bloc.isCheckedM,
              maxWidth: 55,
              onChanged: bloc.onChangedMChanged,
              title: "m",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: 200,
                height: 35,
                child: TextField(
                  controller: bloc.checkController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 8, left: 5),
                    suffixIcon: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.clear,
                        size: 15,
                      ),
                      onPressed: () => bloc.checkController.clear(),
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
        );
      }),
    );
  }
}

///网站证书
class SiteCertificateView extends StatelessWidget {
  const SiteCertificateView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return rowTextList(
          title: "网站证书",
          children: [
            ITextRadio(
              value: HttpOptions.option1,
              title: "单http",
              bloc: bloc,
            ),
            ITextRadio(
              value: HttpOptions.option2,
              title: "单https",
              bloc: bloc,
            ),
            ITextRadio(
              value: HttpOptions.option3,
              title: "混合模式",
              bloc: bloc,
            ),
          ],
        );
      }),
    );
  }
}

///网站配置
class SiteConfigurationView extends StatelessWidget {
  const SiteConfigurationView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return rowTextList(
            title: "网站配置",
            children: bloc.configureList
                .map(
                  (e) => checkboxCell(
                    value: e.value,
                    title: e.title,
                  ),
                )
                .toList());
      }),
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
}

///解析ip
class SiteAnalysisIpView extends StatelessWidget {
  const SiteAnalysisIpView({super.key});
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return rowTextList(title: "解析ip", children: [
          SizedBox(
            width: 200,
            height: 35,
            child: TextField(
              controller: bloc.analysisController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 8, left: 5),
                hintText: '自定义',
                border: OutlineInputBorder(
                  gapPadding: 50,
                ),
              ),
            ),
          ),
          iCheckbox(
            value: bloc.automaticParsing,
            maxWidth: 98,
            onChanged: (value) => bloc.onAutomaticParsing(value),
            title: "自动解析",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: expensiveButton(
              "重新解析",
              CupertinoIcons.gobackward,
              () => bloc.onReanalysis,
            ),
          ),
          expensiveButton(
            "效验解析",
            CupertinoIcons.checkmark_alt_circle,
            () => bloc.onValidationAnalysis,
          ),
        ]);
      }),
    );
  }
}

///文件格式
class SiteFileFormatView extends StatelessWidget {
  const SiteFileFormatView({super.key});
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return rowTextList(
          title: "文件格式",
          children: bloc.fileFormatList
              .map(
                (e) => radioFileList(
                  bloc,
                  value: e.type,
                  title: e.title,
                ),
              )
              .toList(),
        );
      }),
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
          ),
          Text(title),
        ],
      ),
    );
  }
}

///克隆网站
class SiteClonedView extends StatelessWidget {
  const SiteClonedView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return rowTextList(title: "克隆网站", children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(left: 0),
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
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
        margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(left: 0),
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
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
    ]);
  }
}

///企业名称
class SiteCompanyView extends StatelessWidget {
  const SiteCompanyView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(
        builder: (_, scope, __) {
          return rowTextList(
            title: "企业名称",
            children: [
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
            ],
          );
        },
      ),
    );
  }
}

///首页标题
class SiteHomeTitleView extends StatelessWidget {
  const SiteHomeTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return SiteTextField(
      title: '首页标题',
      innerTitle: '内页标题',
      controller: bloc.titlecontroller,
      controllerInner: bloc.innerTitleController,
    );
  }
}

///首页关键词
class SiteHomeKeywordView extends StatelessWidget {
  const SiteHomeKeywordView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return SiteTextField(
      title: '首页关键词',
      innerTitle: '内页关键词',
      controller: bloc.keyworController,
      controllerInner: bloc.innerKeywordController,
    );
  }
}

///首页描述
class SiteHomeDescriptionView extends StatelessWidget {
  const SiteHomeDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return SiteTextField(
      title: '首页描述',
      innerTitle: '内页描述',
      controller: bloc.descriptController,
      controllerInner: bloc.innerDescriptController,
    );
  }
}

///
class ITextRadio extends StatelessWidget {
  const ITextRadio(
      {super.key, this.title, required this.value, required this.bloc});

  final SiteSettingsBloc bloc;
  final String? title;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: value,
            groupValue: bloc.groupValueOption,
            onChanged: (value) => bloc.onChanged(value),
          ),
          Text(title ?? ''),
        ],
      ),
    );
  }
}

///
class SiteTextField extends StatelessWidget {
  const SiteTextField(
      {super.key,
      required this.title,
      this.controller,
      required this.innerTitle,
      this.controllerInner});
  final String title;
  final String innerTitle;
  final TextEditingController? controller;
  final TextEditingController? controllerInner;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return rowTextList(title: title, children: [
      SizedBox(
        width: width * 0.35 * 0.56,
        child: TextField(
          controller: controller,
          maxLines: 5,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(top: 8, left: 5),
            hintText: '自定义',
            border: OutlineInputBorder(
              gapPadding: 50,
            ),
          ),
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 15),
            child: Column(
              children: [
                Text(
                  "$innerTitle:",
                  style: const TextStyle(
                    color: Color.fromARGB(129, 4, 24, 14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "随机取几个",
                  style: TextStyle(
                    color: Color.fromARGB(255, 100, 39, 141),
                    fontSize: 13,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(31, 189, 189, 189),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 0.5,
                      color: const Color.fromARGB(31, 54, 54, 54),
                    ),
                  ),
                  child: const Text("6"),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.35 * 0.56,
            child: TextField(
              controller: controllerInner,
              maxLines: 5,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 8, left: 5),
                hintText: '自定义',
                border: OutlineInputBorder(
                  gapPadding: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
