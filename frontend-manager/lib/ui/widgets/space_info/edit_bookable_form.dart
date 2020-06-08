import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_manager/ui/widgets/space_info/bookable_selector.dart';
import 'package:ucampus_manager/ui/widgets/space_info/leasable_selector.dart';

class EditBookableForm extends StatefulWidget {
  final Space space;
  final Function(String, bool, bool) onBookableLeasable;

  const EditBookableForm({Key key, this.space, this.onBookableLeasable})
      : super(key: key);
  @override
  _EditBookableFormState createState() => _EditBookableFormState();
}

class _EditBookableFormState extends State<EditBookableForm> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  bool _bookable;
  bool _leasable;

  @override
  void initState() {
    super.initState();
    _bookable = widget.space.isBookable;
    _leasable = widget.space.isLeasable;
  }

  void onBookableChange(bool bookable) {
    setState(() => _bookable = bookable);
  }

  void onLeasableChange(bool leasable) {
    setState(() => _leasable = leasable);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 10,
            right: 10,
            left: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    title: Padding(
                        padding:
                            EdgeInsets.only(top: 20, bottom: 10, left: 10),
                        child: Text('Opciones de ' + widget.space.uuid.replaceAll("\"", ""),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              color: Theme.of(context).primaryColor,
                            ))),
                    subtitle: Padding(
                      padding: EdgeInsets.only(bottom: 20, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            child: BookableSelector(
                                isBookable: _bookable,
                                onBookableCange: this.onBookableChange),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                              ),
                              child: LeasableSelector(
                                  isLeasable: _leasable,
                                  onLeasableCange: this.onLeasableChange)),
                        ],
                      ),
                    )),
              ],
            )),
        Positioned(
            bottom: 30,
            right: 10,
            left: 10,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 250,
                  child: RoundedLoadingButton(
                      color: Theme.of(context).primaryColor,
                      controller: _btnController,
                      child: Text(
                        'Guardar',
                        style: TextStyle(
                            fontSize: 15, color: Theme.of(context).accentColor),
                      ),
                      onPressed: () async {
                        widget.onBookableLeasable(
                            widget.space.uuid, _bookable, _leasable);
                        _btnController.success();
                        Navigator.of(context).pushReplacementNamed("/");
                      }),
                ))),
      ],
    );
  }
}
