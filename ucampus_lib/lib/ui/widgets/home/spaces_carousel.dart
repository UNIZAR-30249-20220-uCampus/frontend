import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';

class SpacesCarousel extends StatelessWidget {
  final List<Space> spaces;
  final bool isUser;

  SpacesCarousel({@required this.spaces, @required this.isUser});

  @override
  Widget build(BuildContext context) {
    return spaces.length == 0
        ? Container()
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 205.0,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.85),
                  itemCount: spaces.length,
                  itemBuilder: (BuildContext context, int itemIndex) {
                    var espacio = spaces[itemIndex];
                    return _buildSpaceCarouselItem(context, espacio);
                  },
                ),
              )
            ],
          );
  }

  Widget _buildSpaceCarouselItem(BuildContext context, Space space) {
    return Padding(
      padding: EdgeInsets.only(bottom: 17, top: 10),
      child: Card(
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.pushNamed(context, "space_info", arguments: space);
            },
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 5, left: 10),
                        child: Text(space.uuid,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ))),
                    subtitle: Padding(
                      padding: EdgeInsets.only(bottom: 0, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //Text(EnumsStrings.spaceKind[space.kind]),
                          Container(height: 5,),
                          Text(space.building, style: TextStyle(fontWeight: FontWeight.w700),),
                        ],
                      ),
                    ),
                    isThreeLine: true,
                  ),
                  isUser?
                  ButtonBar(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: FlatButton(
                          child: const Text('RESERVAR'),
                          onPressed: () {
                            Navigator.pushNamed(context, "reservation",
                                arguments: space);
                          },
                        ),
                      )
                    ],
                  ):
                  Container(),
                ],
              ),
            )),
      ),
    );
  }
}
