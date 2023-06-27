import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-spider/src/blocs/overview_bloc.dart';

class SiteSummaryPage extends StatelessWidget {
  const SiteSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<OverviewBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pagesScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ...List.generate(
                    bloc.list.length,
                    (index) {
                      var isOver = index == bloc.selectIndex;
                      return InkWell(
                        onTap: () => bloc.onOverView(index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: isOver ? Colors.green : Colors.white,
                            border: Border.all(width: 0.3, color: Colors.grey),
                          ),
                          child: Text(
                            bloc.list[index],
                            style: TextStyle(
                              color: isOver ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.3,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.face_outlined,
                            size: 18,
                          ),
                          Text("2023年06月01日  至  2023年06月22日"),
                        ],
                      ))
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: Colors.grey),
                ),
                child: Row(
                  children: [
                    columnCell(),
                    columnCell(),
                    columnCell(),
                    columnCell(),
                    columnCell(),
                    columnCell(),
                    columnCell(),
                    columnCell(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 202, 215, 223),
                  border: Border.all(width: 0.3, color: Colors.grey),
                ),
                child: Row(
                  children: [
                    ...bloc.fileFormatList.map(
                      (e) => Expanded(
                        child: Center(child: Text(e.title)),
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text("暂无数据"),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget columnCell() {
    return const Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text("番客量"),
          SizedBox(
            height: 20,
          ),
          Text("0", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300))
        ],
      ),
    );
  }
}
