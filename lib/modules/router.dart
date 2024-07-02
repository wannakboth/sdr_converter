import 'package:flutter/material.dart';
import 'package:sdr_converter/modules/home/home_screen.dart';
import 'package:sdr_converter/modules/review/bank_info_screen.dart';
import 'package:sdr_converter/modules/review/review_screen.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/': (context) => const HomeScreen(),
  '/review': (context) => const ReviewScreen(),
  '/bank-info': (context) => BankInfoScreen(),
};
