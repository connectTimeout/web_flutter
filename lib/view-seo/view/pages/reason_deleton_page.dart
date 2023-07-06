import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-management/management.dart';
import 'package:web_flutter/view-seo/view/blocs/reason_deleton_bloc.dart';

class ReasonDeletonPage extends StatelessWidget {
  const ReasonDeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ReasonDeletonBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: VariousStatelessButton(
              onPressed: () => bloc.onSubmit(),
              color: Colors.blue,
              textColor: Colors.white,
              title: "提交",
            ),
          ),
          ChangeNotifierProvider<PagesScope>.value(
            value: bloc.pageScope,
            child: Consumer<PagesScope>(builder: (_, scope, __) {
              return ITextListCell(
                title: "删除类型",
                children: [
                  ...tableFormatList
                      .map(
                        (e) => IRadioFileList(
                          value: e.type,
                          title: e.title,
                          groupValue: bloc.fileFormatOptions,
                          onChanged: (value) => bloc.onRadio(value, e.value),
                          isRadio: true,
                        ),
                      )
                      .toList(),
                ],
              );
            }),
          ),
          ITextListCell(
            title: "删除ID",
            children: [
              ITextField(
                controller: bloc.iDController,
                width: 400,
                maxLines: 5,
                hintText: "删除ID",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
