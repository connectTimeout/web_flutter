import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/view-seo/seo-home/seo_home.dart';
import 'package:web_flutter/view-seo/site-inclusion/src/blocs/inclusion_bloc.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

import '../../../../components/components.dart';

class InclusionPage extends StatelessWidget {
  const InclusionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<InclusionBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ITextListCell(
            title: "克隆网站",
            children: bloc.linkList
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IExpensiveButtons(
                          onPressed: () {},
                          title: e.title,
                          icon: CupertinoIcons.arrow_swap,
                        ),
                      ),
                    )
                    .toList() ??
                [],
          ),
          SizedBox(height: 20,),
          ColoredBox(
            color: Colors.grey,
            child: Row(
              children: [
                Expanded(
                  child: ColoredBox(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Center(child: Text("你好")),
                    ),
                  ),
                ),
                Expanded(
                  child: ColoredBox(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Center(child: Text("你好")),
                    ),
                  ),
                ),
                Expanded(
                  child: ColoredBox(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Center(child: Text("你好")),
                    ),
                  ),
                ),
                Expanded(
                  child: ColoredBox(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Center(child: Text("你好")),
                    ),
                  ),
                ),
                Expanded(
                  child: ColoredBox(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Center(child: Text("你好")),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: const Text("暂无数据"),
          )
        ],
      ),
    );
  }
}
