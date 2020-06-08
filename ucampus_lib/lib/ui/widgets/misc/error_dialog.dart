import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

void showUserExceptionDialog(
  BuildContext context,
  UserException userException,
) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text(
        'Algo ha fallado',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(userException.msg.replaceAll("Unhandled Failure ", "")),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "ACEPTAR",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.of(context).pushReplacementNamed("/"),
        ),
      ],
    ),
  );
}
