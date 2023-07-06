import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/model/src/user_model_entity.dart';
import 'package:web_flutter/view-seo/seo-management/management.dart';

class SiteSettingsPage extends StatelessWidget {
  const SiteSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SiteSettingsBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
      value: bloc.pageScope,
      child: Consumer<PagesScope>(builder: (_, scope, __) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Body<List<UserModelEntity>>(
            onInit: bloc.onInit,
            controller: bloc.controller,
            builder: (context, data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPaginatedTable(
                    titleList: bloc.titleList,
                    source: _DataTableChildren(
                      data: bloc.listModel,
                    ),
                    onRowsPerPageChanged:
                        bloc.listModel.length < bloc.rowsPerPage
                            ? null
                            : (value) => bloc.onPerPage(value),
                    rowsPerPage: bloc.listModel.length < bloc.rowsPerPage
                        ? bloc.listModel.length
                        : bloc.rowsPerPage,
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}

class EmployeTableModel {
  ///用户名
  final String username;

  ///昵称
  final String nickname;

  ///账号类型
  final String accountType;

  ///账号状态
  final String accountStatus;

  ///登录IP
  final String loginIP;

  ///登录时间
  final String loginTime;

  ///开户时间
  final String creationTime;

  ///用户名[username]昵称[nickname]账号类型[accountType]账号状态[accountStatus]登录IP[loginIP]登录时间[loginTime]开户时间[creationTime]
  EmployeTableModel(
    this.username,
    this.nickname,
    this.accountType,
    this.accountStatus,
    this.loginIP,
    this.loginTime,
    this.creationTime,
  );
}

class _DataTableChildren extends DataTableSource {
  _DataTableChildren({
    required this.data,
  });

  final List<UserModelEntity> data;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
      color: Globals.statesColor,
      cells: [
        DataCell(
          Text(data[index].id),
        ),
        DataCell(
          Text(data[index].domain ?? ''),
        ),
        DataCell(
          Text(data[0].domain ?? ''),
        ),
        DataCell(_typeCell(0)),
        DataCell(_statusCell(0)),
        DataCell(
          Text(
            data[0].totalReport ?? '',
          ),
        ),
        DataCell(
          Text(data[0].reportNum ?? ''),
        ),
        DataCell(
          Text(data[0].reportReason ?? ''),
        ),
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.scale(
                scale: 0.7,
                child: IExpensiveButtons(
                  onPressed: () {},
                  title: '编辑',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<DataCell> cellsMessage(int index) {
    print(data[index].reportNum);
    return [
      DataCell(
        Text(data[index].id),
      ),
      DataCell(
        Text(data[index].domain ?? ''),
      ),
      DataCell(
        Text(data[index].domain ?? ''),
      ),
      DataCell(_typeCell(index)),
      DataCell(_statusCell(index)),
      DataCell(
        Text(
          data[index].totalReport ?? '',
        ),
      ),
      DataCell(
        Text(data[index].reportNum ?? ''),
      ),
      DataCell(
        Text(data[index].reportReason ?? ''),
      ),
      DataCell(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.scale(
              scale: 0.7,
              child: IExpensiveButtons(
                onPressed: () {},
                title: '编辑',
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _typeCell(index) {
    int type = int.parse(data[index].bdIndex ?? '');
    switch (type) {
      case 0:
        return _adminCell();
      case 1:
        return _userCell();
    }
    return const SizedBox();
  }

  Widget _statusCell(index) {
    int type = int.parse(data[index].bdIndex ?? '');
    switch (type) {
      case 0:
        return _normalCell();
      case 1:
        return _abnormalCell();
    }
    return const SizedBox();
  }

  Widget _adminCell() {
    return typeButtonCell(
      title: "管理员",
      icon: const SizedBox(),
      backgColor: Globals.blueBackgColor,
      borderColor: Globals.blueBorderColor,
      textColor: Globals.blueTextColor,
    );
  }

  Widget _userCell() {
    return typeButtonCell(
      title: "普通用户",
      icon: const SizedBox(),
      backgColor: Globals.greyBackgColor,
      borderColor: Globals.greyBorderColor,
      textColor: Globals.greyTextColor,
    );
  }

  Widget _normalCell() {
    return typeButtonCell(
      title: "正常",
      icon: const SizedBox(),
      backgColor: Globals.greenBackgColor,
      borderColor: Globals.greenBorderColor,
      textColor: Globals.greenTextColor,
    );
  }

  Widget _abnormalCell() {
    return typeButtonCell(
      title: "异常",
      icon: const SizedBox(),
      backgColor: Globals.redBackgColor,
      borderColor: Globals.redBorderColor,
      textColor: Globals.redTextColor,
    );
  }
}

Widget typeButtonCell({
  String? title,
  Color? backgColor,
  Color? borderColor,
  Color? textColor,
  Widget? icon,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5).copyWith(
      bottom: 4,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: backgColor ?? Globals.greenBackgColor,
      border: Border.all(
        width: 0.5,
        color: borderColor ?? Globals.greenBorderColor,
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon ??
            Icon(
              Icons.games,
              size: 13,
              color: Globals.greenTextColor,
            ),
        Text(
          title ?? "是",
          style: TextStyle(
            fontSize: 12,
            color: textColor ?? Globals.greenTextColor,
          ),
        ),
      ],
    ),
  );
}
