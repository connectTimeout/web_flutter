import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/view-seo/site-inclusion/src/blocs/inclusion_bloc.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

import '../../../../components/components.dart';

class InclusionPage extends StatelessWidget {
  const InclusionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<InclusionBloc>(context);
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ).copyWith(bottom: 1),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 209, 209, 209),
        border: Border.all(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
            child: ITextTabBarCell(
              isSelect: true,
              title: "网站收录",
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Colors.white,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ITextListCell(
                      title: "克隆网站",
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
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
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    ColoredBox(
                      color: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(
                            child: ColoredBox(
                              color: Colors.grey.shade200,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Center(child: Text("你好")),
                              ),
                            ),
                          ),
                          const SizedBox(width: 0.3),
                          Expanded(
                            child: ColoredBox(
                              color: Colors.grey.shade200,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Center(child: Text("你好")),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ColoredBox(
                              color: Colors.grey.shade200,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Center(child: Text("你好")),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ColoredBox(
                              color: Colors.grey.shade200,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Center(child: Text("你好")),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ColoredBox(
                              color: Colors.grey.shade200,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Center(child: Text("你好")),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Text("暂无数据"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
