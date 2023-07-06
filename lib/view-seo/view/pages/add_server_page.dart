import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-management/management.dart';
import 'package:web_flutter/view-seo/view/blocs/add_server_bloc.dart';

class AddServerPage extends StatelessWidget {
  const AddServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AddServerBloc>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VariousStatelessButton(
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
            title: "更换域名",
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
