import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdr_converter/configs/theme/colors.dart';
import 'package:sdr_converter/controllers/sdr_file_controller.dart';
import 'package:sdr_converter/models/sdr_file_model.dart';
import 'package:sdr_converter/utils/quick_alert_util.dart';
import 'package:xml/xml.dart' as xml;

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _sdrFileController = Get.put(SDRFileController());
  late SDRFile _sdrFile;

  @override
  void initState() {
    super.initState();
    _sdrFile = SDRFile(payments: _sdrFileController.payments);
  }

  String formatXml(String xmlString) {
    final document = xml.XmlDocument.parse(xmlString);
    final formattedXml = document.toXmlString(pretty: true, indent: '\t');
    return formattedXml.toString();
  }

  Future<void> saveToFile(String xmlString) async {
    try {
      var filePath = await FilePicker.platform.saveFile(
        dialogTitle: 'Save XML File',
        fileName: 'BIDC SDR.xml',
        type: FileType.custom,
        allowedExtensions: ['xml'],
      );

      if (filePath != null && filePath.isNotEmpty) {
        final file = File(filePath);
        await file.writeAsString(xmlString);
        log('File Saved: $filePath', name: 'SaveToFile');
        QuickAlert.showSuccess(
            title: "Success", text: "File saved successfully ! \n$filePath");
      } else {
        log('No file selected', name: 'SaveToFile');
      }
    } catch (e) {
      log('Error saving file: $e', error: e, name: 'SaveToFile');
      QuickAlert.showError(title: 'Oops', text: "Error saving file ...");
    }
  }

  @override
  void dispose() {
    _sdrFileController.payments.value = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bgColor = AppColor.backgroundGlobal;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text(
          'Review XML',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async =>
            await saveToFile(formatXml(_sdrFile.toXml().toString())),
        tooltip: 'Save',
        child: const Icon(Icons.save),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Total Records : ${_sdrFileController.payments.length}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(80),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SelectableText(
                            formatXml(_sdrFile.toXml().toString()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
