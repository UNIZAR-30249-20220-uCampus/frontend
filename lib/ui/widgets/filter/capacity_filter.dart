import 'package:flutter/material.dart';

class CapacityFilter extends StatefulWidget {
  final Function onFilterAdded;
  final Function onFilterRemoved;
  final Function(int) onFilterValueSet;
  final bool isEnabled;
  final int currentCapacity;

  CapacityFilter({
    @required this.onFilterAdded,
    @required this.onFilterRemoved,
    @required this.onFilterValueSet,
    @required this.isEnabled,
    @required this.currentCapacity,
  });

  @override
  _CapacityFilterState createState() => _CapacityFilterState();
}

class _CapacityFilterState extends State<CapacityFilter> {
  static const MIN_CAPACITY = 5;
  static const MAX_CAPACITY = 300;
  
  int _capacity;

  @override
  void initState() {
    super.initState();
    _capacity = widget.currentCapacity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Aforo',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor),
              ),
              Text(
                  'Selecciona el número mínimo de personas que deseas que quepan en el espacio que buscas'),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: this.widget.isEnabled,
                    onChanged: (value) {
                      if (value) {
                        this.widget.onFilterAdded();
                      } else {
                        this.widget.onFilterRemoved();
                      }
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                  Expanded(
                    child: Slider(
                      inactiveColor: Colors.grey,
                      onChanged: this.widget.isEnabled
                          ? (value) => setState(() => _capacity = value.round())
                          : null,
                      onChangeEnd: (double value) =>
                          this.widget.onFilterValueSet(value.round()),
                      value: _capacity.toDouble(),
                      min: MIN_CAPACITY.toDouble(),
                      max: MAX_CAPACITY.toDouble(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _capacity.toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                ],
              ),
              Divider(),
              Container(height: 10)
            ],
          ),
        ),
      ],
    );
  }
}
