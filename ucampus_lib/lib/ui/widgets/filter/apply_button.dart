import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ApplyButton extends StatelessWidget {
  final Function onApplied;

  ApplyButton({@required this.onApplied});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedLoadingButton(
          color: Theme.of(context).primaryColor,
          child: Text('Ver resultados', style: TextStyle(color: Colors.white)),
          onPressed: () async {
            await this.onApplied();
            Navigator.of(context).pop();
          }),
    );
  }
}
