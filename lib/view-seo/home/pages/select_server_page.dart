import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/view-seo/home/blocs/select_server.dart';
import 'package:web_flutter/view-seo/home/components/border_cell.dart';

class SelectServerPage extends StatelessWidget {
  const SelectServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SelectServerBloc>(context);
    var width = MediaQuery.of(context).size.width;
    return BorderCell(
      top: BorderSide.none,
      bottom: BorderSide.none,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: width * 0.16,
        child: ExpansionTile(
          initiallyExpanded: true,
          leading: const Icon(
            Icons.lan,
            color: Colors.white,
          ),
          title: Text(
            "服务器选择（共${bloc.list.length}台）",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          children: bloc.list.map((e) => _generateWidget(e)).toList(),
        ),
      ),
    );
  }

  /// 生成 ExpansionTile 下的 ListView 的单个组件
  Widget _generateWidget(name) {
    /// 使用该组件可以使宽度撑满
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(bottom: 5, right: 10),
        padding: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
