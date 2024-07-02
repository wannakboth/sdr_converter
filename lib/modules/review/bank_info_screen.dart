import 'package:flutter/material.dart';
import 'package:sdr_converter/configs/theme/colors.dart';
import 'package:sdr_converter/models/bank_model.dart';
import 'package:sdr_converter/widgets/data_table.dart';

class BankInfoScreen extends StatelessWidget {
  BankInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = AppColor.backgroundGlobal;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text(
          'Bank Information',
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              hoverColor: Colors.transparent,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () => Navigator.pop(context),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              DataTableTemplate(
                headers: _tableHeaders,
                data: _tableData,
                title: '',
              )
            ],
          ),
        ),
      ),
    );
  }

  final List<String> _tableHeaders = [
    'Code',
    'Digit',
    'Name',
  ];

  final List<List<String>> _tableData = bankList.map((bankInfo) {
    return [bankInfo.code, bankInfo.digit.toString(), bankInfo.name];
  }).toList();
}
