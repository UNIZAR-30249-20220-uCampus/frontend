import 'package:flutter/material.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/ui/shared/enums_strings.dart';

class SpaceKindFilter extends StatefulWidget {
  final Function onFilterAdded;
  final Function onFilterRemoved;
  final Function(List<SpaceKind>) onFilterSelectionSet;
  final bool isEnabled;
  final List<SpaceKind> selectedSpaceKinds;

  SpaceKindFilter({
    @required this.onFilterAdded,
    @required this.onFilterRemoved,
    @required this.onFilterSelectionSet,
    @required this.isEnabled,
    @required this.selectedSpaceKinds,
  });

  @override
  _SpaceKindFilterState createState() => _SpaceKindFilterState();
}

class _SpaceKindFilterState extends State<SpaceKindFilter> {
  List<SpaceKind> _selectedKinds;

  @override
  void initState() {
    super.initState();
    _selectedKinds = widget.selectedSpaceKinds;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Tipo de espacio',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: this.widget.isEnabled
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                        ),
                        Text(
                            'Selecciona los tipos de espacio que quieres incluir en tu búsqueda'),
                      ],
                    ),
                  ),
                  Switch(
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
                ],
              ),
              Container(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Wrap(
                      children: List.generate(
                        SpaceKind.values.length,
                        (index) => _buildChip(context, SpaceKind.values[index]),
                      ),
                    ),
                  )),
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

  Widget _buildChip(BuildContext context, SpaceKind kind) {
    Color color = Colors.grey[300];
    TextStyle style = TextStyle(color: Colors.black);
    if (this.widget.isEnabled) {
      if (_selectedKinds.contains(kind)) {
        color = Theme.of(context).primaryColor;
        style = TextStyle(color: Colors.white);
      } else {
        color = Colors.white;
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        child: Chip(
          backgroundColor: color,
          label: Text(EnumsStrings.spaceKind[kind]),
          labelStyle: style,
        ),
        onTap: () {
          if (this.widget.isEnabled) {
            List<SpaceKind> spaceKinds = this.widget.selectedSpaceKinds;
            if (this.widget.selectedSpaceKinds.contains(kind)) {
              spaceKinds.remove(kind);
            } else {
              spaceKinds.add(kind);
            }
            setState(() => _selectedKinds = spaceKinds);
            this.widget.onFilterSelectionSet(spaceKinds);
          }
        },
      ),
    );
  }
}
