import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo.dart';

class AddReasonPage extends StatelessWidget {
  const AddReasonPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AddReasonBloc>(context);
    return SingleChildScrollView(
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
            title: "添加投诉理由",
            width: 120,
            children: [
              ITextField(
                controller: bloc.reasonController,
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
