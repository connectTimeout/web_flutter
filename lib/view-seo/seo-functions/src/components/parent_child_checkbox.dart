import 'package:flutter/material.dart';
import 'package:web_flutter/view-seo/seo-home/seo_home.dart';

class ParentChildCheckbox extends StatefulWidget {
  const ParentChildCheckbox({
    super.key,
    required this.children,
    this.onCheckedChild,
  });

  final List<DomainNameModel>? children;

  final void Function(int index)? onCheckedChild;

  @override
  State<ParentChildCheckbox> createState() => _ParentChildCheckboxState();
}

class _ParentChildCheckboxState extends State<ParentChildCheckbox> {
  bool? _parentValue = false;

  ///描述复选框是否被点击的childrenValue的列表
  List<bool?> _childrenValue = [];

  @override
  void initState() {
    super.initState();
    _childrenValue = List.filled(widget.children?.length ?? 0, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: const Color.fromARGB(255, 221, 221, 221),
          child: CustomLabeledCheckbox(
            value: _parentValue,
            label: "nihao",
            onChanged: (value) => _parentCheckBoxClick(),
            tristate: true,
            children: [
              const Expanded(
                  child: Text(
                '域名',
                textAlign: TextAlign.left,
              )),
              InkWell(
                onTap: () {},
                child: const Text(
                  "刷新",
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          itemCount: widget.children?.length ?? 0,
          itemBuilder: (context, index) => CustomLabeledCheckbox(
            label: widget.children![index].name,
            value: _childrenValue[index],
            onChanged: (value) => _childCheckBoxClick(index),
          ),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0.5,
              thickness: 0.5,
            );
          },
        ),
      ],
    );
  }

  ///[children]的i的子项被点击时的onClick方法
  void _childCheckBoxClick(int i) {
    final ValueChanged<int>? onCheckedChild = widget.onCheckedChild;
    if (onCheckedChild != null) {
      onCheckedChild(i);
    }
    setState(() {
      _childrenValue[i] = !_childrenValue[i]!;
      _parentCheckboxUpdate();
    });
  }

  ///当特定父体被点击时的onClick方法
  void _parentCheckBoxClick() {
    setState(() {
      if (_parentValue != null) {
        _parentValue = !_parentValue!;
        for (int i = 0; i < widget.children!.length; i++) {
          _childrenValue[i] = _parentValue;
        }
      } else {
        _parentValue = false;
        for (int i = 0; i < widget.children!.length; i++) {
          _childrenValue[i] = false;
        }
      }
    });
  }

  ///根据子复选框的状态来更新父复选框的方法。
  void _parentCheckboxUpdate() {
    setState(() {
      if (_childrenValue.contains(false) && _childrenValue.contains(true)) {
        _parentValue = null;
      } else {
        _parentValue = _childrenValue.first;
      }
    });
  }
}

class CustomLabeledCheckbox extends StatelessWidget {
  const CustomLabeledCheckbox({
    super.key,
    this.label,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.children,
  });

  final String? label;
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Checkbox(
                  value: value,
                  tristate: tristate,
                  onChanged: onChanged,
                  activeColor: Colors.green,
                ),
              ),
              ...children ??
                  [
                    Text(
                      label ?? "-",
                    )
                  ],
            ],
          ),
        ),
      ),
    );
  }
}
