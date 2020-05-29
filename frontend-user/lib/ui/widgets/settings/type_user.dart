import 'package:flutter/material.dart';
import 'package:ucampus_lib/ui/shared/colors.dart';

class TypeUser extends StatefulWidget {
  final bool externalUser;
  final Function(bool) onTypeUserChanged;

  TypeUser({@required this.externalUser, this.onTypeUserChanged});

  @override
  _TypeUserState createState() => _TypeUserState();
}

class _TypeUserState extends State<TypeUser> {
  bool _externalUser;

  @override
  void initState() {
    super.initState();
    _externalUser = widget.externalUser;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0.0),
        child: SwitchListTile(
          title: const Text('Usuario externo'),
          subtitle: const Text('Permite el alquiler de espacios'),
          activeColor: CustomColors.uCampusBlue,
          value: _externalUser,
          onChanged: (bool value) {
            setState(() => _externalUser = value);
            widget.onTypeUserChanged(value);
          },
          secondary: const Icon(Icons.person),
        ));
  }
}
