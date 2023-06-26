import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/view-seo/clone/src/blocs/parameters_visible_bloc.dart';
import 'package:web_flutter/view-seo/clone/src/model/checkbox_cell.dart';

class ParametersVisiblePage extends StatelessWidget {
  const ParametersVisiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ParametersVisibleBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        spacing: 200, // 横向间距
        runSpacing: 10, //纵向间距
        children: [
          ...bloc.parametersList.map(
            (e) => CheckboxCell(
              isCheckbox: e.isChexkbox,
              title: e.title,
            ),
          )
        ],
      ),
    );
  }
}
