import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/clone/src/blocs/parameters_bloc.dart';
import 'package:web_flutter/view-seo/clone/src/model/text_switch_cell.dart';

class ParametersPage extends StatelessWidget {
  const ParametersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ParametersBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ...bloc.parameters0List.map((e) => TextSwitchCell(
                value: e.isSwitch,
                title: e.title,
                message: e.message,
              ))
        ],
      ),
    );
  }
}

class TextRowCell extends StatelessWidget {
  const TextRowCell({
    super.key,
    required this.value,
    required this.onChanged,
    this.title,
    this.message,
  });
  final String? title;
  final String? message;
  final bool value;
  final ValueChanged<bool>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$title："),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Switch(value: value, onChanged: onChanged),
        ),
        ITooltip(
          message: message ?? "",
          size: 18,
        ),
      ],
    );
  }
}
