import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ComplaintBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VariousStatelessButton(
            onPressed: () => bloc.onSubmit(),
            color: Colors.blue,
            textColor: Colors.white,
            title: "提交",
          ),
          ITextListCell(
            title: "域名",
            children: [
              ITextField(
                controller: bloc.domainNameController,
                width: 400,
                maxLines: 5,
                hintText: "域名",
              ),
              const ITooltip(message: "英文逗号分隔多个域名")
            ],
          ),
          ITextListCell(
            title: "投诉次数",
            children: [
              NumberInputWidget(
                controller: bloc.countController,
                defaultVal: bloc.sliderValue,
                subtractValueChanged: (value) => bloc.onSlider(value),
                inputFormatters: [NumberInputFormatter(isAllowDecimal: false)],
              ),
            ],
          ),
          ChangeNotifierProvider<PagesScope>.value(
            value: bloc.pageScope,
            child: Consumer<PagesScope>(builder: (_, scope, __) {
              return ITextListCell(
                title: "投诉类型",
                children: [
                  ...fileFormatList
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
            title: "投诉理由",
            children: [
              ITextField(
                controller: bloc.complaintController,
                width: 400,
                maxLines: 5,
                hintText: "投诉理由",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
