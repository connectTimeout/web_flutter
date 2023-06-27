import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-management/management.dart';

class AdvertisementSettingPage extends StatelessWidget {
  const AdvertisementSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AdvertisementSettingBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
        value: bloc.pageScope,
        child: Consumer<PagesScope>(builder: (context, scope, child) {
          return StatisticsCell(
            siteChild: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  ITextField(
                    controller: bloc.textController,
                    width: 400,
                    height: 35,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  VariousStatelessButton(
                    onPressed: () {},
                    color: Colors.green,
                    textColor: Colors.white,
                    title: "显示页面内容",
                    icon: const Icon(
                      CupertinoIcons.add,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
