import 'package:flutter/material.dart';
import 'package:web_flutter/consts/consts.dart';

var sortIndex = 0;
var sortAsc = true;

class CustomPaginatedTable extends StatelessWidget {
  const CustomPaginatedTable({
    super.key,
    this.titleList,
    required this.source,
    this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage,
    this.onRowsPerPageChanged,
    this.horizontal,
    this.horizontalMargin = 31,
    this.dataRowMaxHeight,
  });

  final List<String>? titleList;
  final DataTableSource? source;
  final int rowsPerPage;
  final ValueChanged<int?>? onRowsPerPageChanged;
  final ScrollController? horizontal;
  final double horizontalMargin;
  final double? dataRowMaxHeight;
  List<DataColumn>? get columns => List.generate(
        titleList?.length ?? 0,
        (index) => DataColumn(
          label: Text(titleList?[index] ?? ""),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: PaginatedDataTable(
            dataRowMaxHeight: dataRowMaxHeight,
            source: source ?? _DataTableChildren(),
            showFirstLastButtons: true,
            columns: columns ?? [const DataColumn(label: Text("1"))],
            onRowsPerPageChanged: onRowsPerPageChanged,
            columnSpacing: 74,
            horizontalMargin: horizontalMargin,
            rowsPerPage: rowsPerPage,
            sortAscending: sortAsc,
            sortColumnIndex: sortIndex,
          ),
        ),
      ),
    );
  }
}

class _DataTableChildren extends DataTableSource {
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => 1;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
      color: Globals.statesColor,
      cells: const [
        DataCell(
          Text("没有数据"),
        ),
      ],
    );
  }
}
