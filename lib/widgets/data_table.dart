import 'package:flutter/material.dart';

class DataTableTemplate extends StatelessWidget {
  final List<String> headers;
  final List<List<String>> data;
  final String title;

  const DataTableTemplate({
    super.key,
    required this.headers,
    required this.data,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DataTable(
                columns: _buildColumns(),
                rows: _buildRows(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<DataColumn> _buildColumns() {
    return headers.map((header) => DataColumn(label: Text(header))).toList();
  }

  List<DataRow> _buildRows() {
    return data.map((row) {
      return DataRow(
        cells: row.map((cellData) => DataCell(Text(cellData))).toList(),
      );
    }).toList();
  }
}
