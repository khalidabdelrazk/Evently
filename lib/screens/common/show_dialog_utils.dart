import 'package:flutter/material.dart';

class ShowDialogUtils {
  static void showLoading({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Loading'),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String title,
    required String message,
    String? posActionName,
    Function? posActionFunc,
    String? negActionName,
    Function? negActionFunc,
  }) {
    List<Widget>? actions = [];
    if(posActionName != null){
      actions.add(
        ElevatedButton(onPressed: () {
          Navigator.pop(context);
          posActionFunc?.call();
        }, child: Text(posActionName))
      );
    }
    if(negActionName != null){
      actions.add(
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            negActionFunc?.call();
          }, child: Text(negActionName))
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: actions,
        );
      },
    );
  }
}
