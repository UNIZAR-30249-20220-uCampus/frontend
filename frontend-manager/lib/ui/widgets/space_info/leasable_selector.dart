import 'package:flutter/material.dart';
class LeasableSelector extends StatefulWidget {
  final bool isLeasable;
  final Function onLeasableCange;

  LeasableSelector({
    @required this.isLeasable,
    @required this.onLeasableCange,
  });

  @override
  _LeasableSelectorState createState() => _LeasableSelectorState();
}

class _LeasableSelectorState extends State<LeasableSelector> {

  bool _leasable;

  @override
  void initState() {
    super.initState();
    _leasable = widget.isLeasable;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Alquilable',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor)),
                        Text(
                            'Selecciona si el espacio es o no alquilabe'),
                      ],
                    ),
                  ),
                  Switch(
                    value: this._leasable,
                    onChanged: (value) {
                      setState(() {
                        _leasable = value;
                      });
                      widget.onLeasableCange(_leasable);
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
