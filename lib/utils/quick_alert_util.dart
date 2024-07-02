import 'package:flutter/material.dart';
import 'package:sdr_converter/utils/navigation_util.dart';

/// @author linhtn

class QuickAlert {
  static showSuccess({String? title, String? text}) {
    showDialog<void>(
      context: NavigationUtils.currentContext,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: title ?? "Success",
          text: text,
          icon: Icons.check_circle_outline,
          color: Colors.green,
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showError({String? title, String? text}) {
    showDialog<void>(
      context: NavigationUtils.currentContext,
      builder: (BuildContext context) {
        var color = Colors.red;

        return CustomAlertDialog(
          title: title ?? "Error...",
          text: text,
          icon: Icons.error_outline,
          color: color,
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: color,
                backgroundColor: color,
                elevation: 5,
                shadowColor: Colors.transparent.withOpacity(0.1),
                side: BorderSide(
                  width: 2,
                  color: color,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("YES", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  static showConfirm(
      {String? title, String? text, required Function() onConfirm}) {
    showDialog<void>(
      context: NavigationUtils.currentContext,
      builder: (BuildContext context) {
        var color = Colors.teal;

        return CustomAlertDialog(
          title: title ?? "Are you sure ?",
          text: text,
          icon: Icons.lightbulb_circle_outlined,
          color: color,
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text('CANCEL', style: TextStyle(color: color)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: color,
                backgroundColor: color,
                elevation: 5,
                shadowColor: Colors.transparent.withOpacity(0.1),
                side: BorderSide(
                  width: 2,
                  color: color,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("YES", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  static showWarning({String? title, String? text, List<Widget>? actions}) {}

  static showInfo({String? title, String? text, List<Widget>? actions}) {
    showDialog<void>(
      context: NavigationUtils.currentContext,
      builder: (BuildContext context) {
        var color = Colors.blue;

        return CustomAlertDialog(
          title: title ?? "Error",
          text: text,
          icon: Icons.error_outline,
          color: color,
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: color,
                backgroundColor: color,
                elevation: 5,
                shadowColor: Colors.transparent.withOpacity(0.1),
                side: BorderSide(
                  width: 2,
                  color: color,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("YES", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  static showLoading({String? title, String? text, List<Widget>? actions}) {}
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    this.title,
    this.text,
    required this.icon,
    required this.color,
    this.actions,
  });

  final String? title;
  final String? text;
  final IconData? icon;
  final Color? color;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Container(
        color: color ?? Colors.red,
        height: 100,
        child: Center(
          child:
              Icon(icon ?? Icons.error_outline, size: 45, color: Colors.white),
        ),
      ),
      iconPadding:
          const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 10.0),
      titlePadding:
          const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 10.0),
      contentPadding:
          const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 10.0),
      actionsPadding:
          const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 10.0),
      title: title == null ? null : Text(title ?? ""),
      content: title == null
          ? null
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(text ?? "", textAlign: TextAlign.center)],
            ),
      actionsAlignment: MainAxisAlignment.center,
      actions: actions,
    );
  }
}
