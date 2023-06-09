import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/common/i_button/src/i_tooltip.dart';
import 'package:web_flutter/components/components.dart';
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
            child: Column(children: [
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
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("网站域名："),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15)
                        .copyWith(left: 0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    width: width * 0.20,
                    constraints: const BoxConstraints(minWidth: 300),
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
                  CheckboxMenuButton(
                    value: bloc.isChecked,
                    onChanged: (value) => bloc.onCheckbox(value),
                    child: Text(
                      "wwww",
                      style: TextStyle(
                          color: bloc.isChecked1 ? Colors.blue : Colors.black),
                    ),
                  ),
                  CheckboxMenuButton(
                    value: bloc.isChecked1,
                    onChanged: (value) => bloc.onCheck1box(value),
                    child: Text(
                      "@",
                      style: TextStyle(
                          color: bloc.isChecked1 ? Colors.blue : Colors.black),
                    ),
                  ),
                  CheckboxMenuButton(
                    value: bloc.isChecked2,
                    onChanged: (value) => bloc.onCheck2box(value),
                    child: Text(
                      "m",
                      style: TextStyle(
                          color: bloc.isChecked2 ? Colors.blue : Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: 150,
                      height: 35,
                      child: TextField(
                        controller: bloc.controllerOutlined,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(top: 10, left: 5),
                          suffixIcon: IconButton(
                            padding: const EdgeInsets.all(0),
                            icon: const Icon(Icons.clear),
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
                  )
                ],
              )
            ]),
          ),
        );
      }),
    );
  }
}
