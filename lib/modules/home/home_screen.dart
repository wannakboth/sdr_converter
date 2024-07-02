import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sdr_converter/configs/theme/colors.dart';
import 'package:sdr_converter/controllers/sdr_file_controller.dart';
import 'package:sdr_converter/models/bank_model.dart';
import 'package:sdr_converter/models/sdr_file_model.dart';
import 'package:sdr_converter/utils/currency_util.dart';
import 'package:sdr_converter/utils/navigation_util.dart';
import 'package:sdr_converter/utils/quick_alert_util.dart';
import 'package:sdr_converter/widgets/bidc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _sdrFileController = Get.put(SDRFileController());
  bool _isProcessing = false;
  String _currency = 'USD';

  Future<void> _pickAndReadFile() async {
    var pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
      allowMultiple: false,
    );

    if (pickedFile != null) {
      final file = File(pickedFile.files.first.path!);
      try {
        setState(() => _isProcessing = true);

        if (file.path.endsWith('.csv')) {
          var payments = await _readCsvFile(file);
          if (payments.isNotEmpty) {
            _sdrFileController.payments.value = payments;
            NavigationUtils.pushNamed("/review");
          }
        } else {
          QuickAlert.showError(
              title: "Invalid File", text: "Please choose a CSV file.");
        }
      } catch (e) {
        QuickAlert.showError(
            title: "Oops", text: "Error reading file... \n $e");
        log("Error reading file: $e");
      } finally {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<List<Payment>> _readCsvFile(File file) async {
    DateTime now = DateTime.now();
    String timeFormatted = DateFormat('ddMMyyyy').format(now);
    List<Payment> payments = [];

    final stream = file.openRead();
    int recordNumber = 1;
    await stream
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .skip(1)
        .forEach((line) {
      List<dynamic> row = const CsvToListConverter(shouldParseNumbers: false)
          .convert(line)
          .first;

      if (row.any((value) => value.toString().trim().isNotEmpty)) {
        for (int i = 1; i < 9; i++) {
          if (i == 1) continue;
          if (row[i] == null || row[i].toString().trim() == "") {
            throw 'Please check data Record [$recordNumber]';
          }
        }
        try {
          var payeeBank = bankList.firstWhere((bank) =>
              bank.name.toUpperCase() ==
              row[8].toString().trim().toUpperCase());

          payments.add(Payment(
            paymentTypeCode: _currency == 'USD' ? '602000' : '601000',
            serialNo: row[1] == null || row[1].toString().trim() == ""
                ? 'NA'
                : row[1].toString().trim(),
            paymentDate: timeFormatted,
            payerBank: '068001',
            payerCheckDigit: '7',
            payerAccountNo: row[3].toString().trim(),
            amount: formatCurrency(row[4].toString().trim(), _currency),
            currencyCode: _currency,
            securityCode: '',
            payerName: row[2].toString().trim(),
            payeeBank: payeeBank.code.toString().trim(),
            payeeCheckDigit: payeeBank.digit.toString().trim(),
            payeeAccountNo: row[6].toString().trim(),
            payeeName: row[5].toString().trim(),
            payeeRef: row[7].toString().trim(),
            returnCode: '',
            inputDate: '',
            processingDate: timeFormatted,
            inputBatchNo: '',
            outputBatchNo: '',
          ));
          recordNumber++;
        } catch (e) {
          throw 'Please check data Record [$recordNumber]';
        }
      }
    });

    return payments;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bgColor = AppColor.backgroundGlobal;
    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigationUtils.pushNamed('/bank-info'),
        tooltip: 'Bank Info',
        child: const Icon(Icons.list),
      ),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                BIDCTextLogo(
                  color: Colors.white,
                  fornSize: 40,
                  isCenter: false,
                ),
                Text(
                  "SDR CONVERTER",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
          ),
          _isProcessing
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 45,
                          width: 160,
                          child: DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              labelText: "Currency",
                              hintText: "Select Currency",
                            ),
                            value: _currency,
                            items: ['USD', 'KHR'].map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            validator: (value) {
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _currency = value!;
                              });
                            },
                            onSaved: (value) {},
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 0),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black54,
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              padding: const EdgeInsets.all(0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () => _pickAndReadFile(),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: bgColor,
                            backgroundColor: Colors.white,
                            elevation: 5,
                            shadowColor: Colors.transparent.withOpacity(0.1),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.blue,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("IMPORT FILE"),
                        ),
                      ),
                      const Text(
                        "File: *.csv",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
