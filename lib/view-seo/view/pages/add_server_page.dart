import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo.dart';

class AddServerPage extends StatelessWidget {
  const AddServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AddServerBloc>(context);
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
            title: "服务器名称",
            children: [
              ITextField(
                controller: bloc.iNameController,
                width: 400,
                height: 35,
                maxLines: 1,
                hintText: "请输入",
              ),
            ],
          ),
          ITextListCell(
            title: "位置",
            children: [
              ITextField(
                controller: bloc.locationController,
                width: 400,
                maxLines: 1,
                height: 35,
                hintText: "请输入",
              ),
            ],
          ),
          ITextListCell(
            title: "类型",
            children: [
              ITextField(
                controller: bloc.ispController,
                width: 400,
                height: 35,
                maxLines: 1,
                hintText: "请输入",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
