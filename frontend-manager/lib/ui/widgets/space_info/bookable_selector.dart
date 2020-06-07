import 'package:flutter/material.dart';
class BookableSelector extends StatefulWidget {
  final bool isBookable;
  final Function onBookableCange;

  BookableSelector({
    @required this.isBookable,
    @required this.onBookableCange,
  });

  @override
  _BookableSelectorState createState() => _BookableSelectorState();
}

class _BookableSelectorState extends State<BookableSelector> {

  bool _bookable;

  @override
  void initState() {
    super.initState();
    _bookable = widget.isBookable;
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
                        Text('Reservable',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor)),
                        Text(
                            'Selecciona si el espacio es o no reservable'),
                      ],
                    ),
                  ),
                  Switch(
                    value: this._bookable,
                    onChanged: (value) {
                      setState(() {
                        _bookable = value;
                      });
                      widget.onBookableCange(_bookable);
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
