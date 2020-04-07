import 'package:flutter/material.dart';
import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/ui/shared/enums_strings.dart';

class MiniFilterDisplay extends StatelessWidget {
  final List<CriteriaKind> activeCriteria;
  final Function(CriteriaKind) onCriteriaRemoved;

  MiniFilterDisplay(
      {@required this.activeCriteria, @required this.onCriteriaRemoved});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 1000,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          activeCriteria.length,
          (index) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Chip(
              deleteIcon: Icon(Icons.cancel),
              deleteIconColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              onDeleted: () => onCriteriaRemoved(activeCriteria[index]),
              label: Text(
                EnumsStrings.criteriaKind[activeCriteria[index]],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
