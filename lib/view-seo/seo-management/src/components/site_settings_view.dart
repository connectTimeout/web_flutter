import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-seo/seo-management/management.dart';

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
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return ITextListCell(
          title: "网站域名",
          children: [
            ITextField(
              controller: bloc.innerDescriptController,
              width: 250,
              height: 35,
              maxLines: 1,
              enabled: false,
              hintText: "test22.com",
            ),
            ICheckbox(
              value: bloc.isCheckedW,
              onChanged: bloc.onChangedWChanged,
              title: "wwww",
            ),
            ICheckbox(
              value: bloc.isChecked,
              maxWidth: 60,
              onChanged: bloc.onChangedChanged,
              title: "@",
            ),
            ICheckbox(
              value: bloc.isCheckedM,
              maxWidth: 55,
              onChanged: bloc.onChangedMChanged,
              title: "m",
            ),
            ITextField(
              controller: bloc.checkController,
              width: 200,
              height: 35,
              maxLines: 1,
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

class ITextRadioModel {
  final HttpOptions value;
  final String title;
  ITextRadioModel(this.value, this.title);
}

List<ITextRadioModel> rodioList = [
  ITextRadioModel(
    HttpOptions.option1,
    "单http",
  ),
  ITextRadioModel(
    HttpOptions.option2,
    "单https",
  ),
  ITextRadioModel(
    HttpOptions.option3,
    "混合模式",
  ),
];

///网站证书

class SiteCertificateView extends StatefulWidget {
  const SiteCertificateView({super.key});

  @override
  State<SiteCertificateView> createState() => _SiteCertificateViewState();
}

class _SiteCertificateViewState extends State<SiteCertificateView> {
  HttpOptions? groupValueOption = HttpOptions.option1;
  @override
  Widget build(BuildContext context) {
    return ITextListCell(
      title: "网站证书",
      children: [
        ...rodioList.map(
          (e) {
            return ITextRadio(
              value: e.value,
              title: e.title,
              groupValue: groupValueOption,
              onChanged: (value) {
                setState(() {
                  groupValueOption = value;
                });
              },
            );
          },
        ),
      ],
    );
  }
}

// class SiteCertificateView extends StatelessWidget {
//   const SiteCertificateView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ITextListCell(
//       title: "网站证书",
//       children: [
//         ...rodioList.map(
//           (e) {
//             return ITextRadio(
//               value: e.value,
//               title: e.title,
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

///网站配置
class SiteConfigurationView extends StatelessWidget {
  const SiteConfigurationView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return ITextListCell(
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
        return ITextListCell(title: "解析ip", children: [
          ITextField(
            width: 200,
            height: 35,
            controller: bloc.analysisController,
            maxLines: 1,
          ),
          ICheckbox(
            value: bloc.automaticParsing,
            maxWidth: 98,
            onChanged: (value) => bloc.onAutomaticParsing(value),
            title: "自动解析",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ExpensiveButtonCell(
              title: "重新解析",
              icon: CupertinoIcons.gobackward,
              onPressed: () => bloc.onReanalysis,
            ),
          ),
          ExpensiveButtonCell(
            title: "效验解析",
            icon: CupertinoIcons.checkmark_alt_circle,
            onPressed: () => bloc.onValidationAnalysis,
          ),
        ]);
      }),
    );
  }
}

FileFormatOptions fileFormatOptions = FileFormatOptions.option1;

///文件格式
class SiteFileFormatView extends StatelessWidget {
  const SiteFileFormatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return ITextListCell(
          title: "文件格式",
          children: fileFormatList
              .map(
                (e) => IRadioFileList(
                  value: e.type,
                  title: e.title,
                ),
              )
              .toList(),
        );
      }),
    );
  }
}

///克隆网站
class SiteClonedView extends StatelessWidget {
  const SiteClonedView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ITextListCell(title: "克隆网站", children: [
      ITextField(
        width: width * 0.15,
        height: 35,
        enabled: false,
        maxLines: 1,
        hintText: "test22.com",
        controller: bloc.analysisController,
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
          return ITextListCell(
            title: "企业名称",
            children: [
              ITextField(
                width: 300,
                height: 35,
                maxLines: 1,
                controller: bloc.controllerOutlined,
              ),
              ExpensiveButtonCell(
                icon: CupertinoIcons.gobackward,
                title: "自动企业名称",
                onPressed: () {},
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

///首页描述
class SiteHomeDescriptionView extends StatelessWidget {
  const SiteHomeDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ITextFieldCell(
          title: '首页标题',
          innerTitle: '内页标题',
        ),
        ITextFieldCell(
          title: '首页关键词',
          innerTitle: '内页关键词',
        ),
        ITextFieldCell(
          title: '首页描述',
          innerTitle: '内页描述',
        ),
      ],
    );
  }
}

///布局方式
class ITextListCell extends StatelessWidget {
  const ITextListCell({
    super.key,
    required this.title,
    required this.children,
    this.padding,
    this.width,
    this.alignment,
    this.titleColor,
    this.isfontWeight = false,
  });

  final String title;
  final Color? titleColor;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final AlignmentGeometry? alignment;
  final bool isfontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width ?? 100,
            padding: const EdgeInsets.only(top: 4, right: 10),
            alignment: alignment ?? Alignment.centerRight,
            child: Text(
              "$title：",
              style: isfontWeight
                  ? null
                  : const TextStyle(
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
}

///checkbox按钮
class ICheckbox extends StatelessWidget {
  const ICheckbox({
    super.key,
    this.value,
    this.onChanged,
    this.title,
    this.maxWidth,
  });

  final bool? value;
  final void Function(bool?)? onChanged;
  final String? title;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              title ?? '',
              style: TextStyle(color: value! ? Colors.blue : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

///橙色动态按钮
class ExpensiveButtonCell extends StatelessWidget {
  const ExpensiveButtonCell(
      {super.key, required this.title, this.icon, required this.onPressed});

  final String title;
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
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
}

class ITextRadio extends StatelessWidget {
  const ITextRadio({
    super.key,
    this.title,
    required this.value,
    this.onChanged,
    this.groupValue,
  });

  final String? title;
  final dynamic value;
  final ValueChanged<HttpOptions?>? onChanged;
  final HttpOptions? groupValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<HttpOptions>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(title ?? ''),
          ),
        ],
      ),
    );
  }
}

///
// class ITextRadio extends StatelessWidget {
//   const ITextRadio({
//     super.key,
//     this.title,
//     required this.value,
//   });

//   final String? title;
//   final dynamic value;

//   @override
//   Widget build(BuildContext context) {
//     var bloc = Provider.of<SiteSettingsBloc>(context);
//     return ChangeNotifierProvider<PagesScope>.value(
//       value: bloc.pageScope,
//       child: Consumer<PagesScope>(builder: (_, scope, __) {
//         return Padding(
//           padding: const EdgeInsets.only(right: 15),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Radio(
//                 value: value,
//                 groupValue: bloc.groupValueOption,
//                 onChanged: (value) => bloc.onChanged(value),
//               ),
//               Text(title ?? ''),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

class ITextFieldCell extends StatefulWidget {
  const ITextFieldCell({super.key, this.title, this.innerTitle});

  final String? title;
  final String? innerTitle;

  @override
  State<ITextFieldCell> createState() => _ITextFieldCellState();
}

class _ITextFieldCellState extends State<ITextFieldCell> {
  TextEditingController controller = TextEditingController();
  TextEditingController innerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Wrap(
        spacing: 4, // 横向间距
        runSpacing: 10, //纵向间距
        children: [
          IRowCell(
            title: widget.title,
            controller: controller,
          ),
          IInnerRowCell(
            innerTitle: widget.innerTitle,
            controller: innerController,
          ),
        ],
      ),
    );
  }
}

class IRowCell extends StatelessWidget {
  const IRowCell({
    super.key,
    this.title,
    this.controller,
  });

  final TextEditingController? controller;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          padding: const EdgeInsets.only(top: 2, right: 10),
          alignment: Alignment.centerRight,
          child: Text(
            "$title：",
            style: const TextStyle(
              color: Color.fromARGB(129, 4, 24, 14),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ITextField(
          controller: controller,
        ),
      ],
    );
  }
}

class IInnerRowCell extends StatelessWidget {
  const IInnerRowCell({
    super.key,
    this.innerTitle,
    this.controller,
  });

  final TextEditingController? controller;
  final String? innerTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerRight,
          width: 100,
          padding: const EdgeInsets.only(top: 2, right: 10),
          child: Column(
            children: [
              Text(
                "$innerTitle：",
                style: const TextStyle(
                  color: Color.fromARGB(129, 4, 24, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "随机取几个",
                  style: TextStyle(
                    color: Color.fromARGB(255, 100, 39, 141),
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
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
        ITextField(
          controller: controller,
        ),
      ],
    );
  }
}

class ITextField extends StatelessWidget {
  const ITextField(
      {super.key,
      this.controller,
      this.width,
      this.height,
      this.maxLines = 5,
      this.hintText = '自定义',
      this.enabled});

  final String? hintText;
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final int? maxLines;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width ?? widths * 0.4 * 0.5,
      height: height,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        enabled: enabled,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 8, left: 5),
          hintText: hintText,
          border: const OutlineInputBorder(
            gapPadding: 50,
          ),
        ),
      ),
    );
  }
}

class IRadioFileList extends StatelessWidget {
  const IRadioFileList({
    super.key,
    this.value,
    required this.title,
    this.isRadio = false,
    this.onChanged,
  });
  final dynamic value;
  final String title;
  final bool isRadio;
  final ValueChanged<dynamic>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: value,
            groupValue: fileFormatOptions,
            onChanged: isRadio ? onChanged : null,
          ),
          Text(title),
        ],
      ),
    );
  }
}

Widget radioFileList({
  required value,
  required String title,
  bool isRadio = false,
  final ValueChanged<dynamic>? onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 15),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: value,
          groupValue: fileFormatOptions,
          onChanged: isRadio ? onChanged : null,
        ),
        Text(title),
      ],
    ),
  );
}
