import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/space_screen_args.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/shared/string_utils.dart';

class SpacesCarousel extends StatelessWidget {
  final bool isExternal;
  final List<Space> spaces;
  final bool isUser;

  SpacesCarousel(
      {@required this.isExternal,
      @required this.spaces,
      @required this.isUser});

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
              Navigator.pushNamed(context, "space_info",
                  arguments: new SpaceScreenArguments(space, isExternal));
            },
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 0),
                      child: Text(
                        StringUtils.spaceNameParser(space.name),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(bottom: 0, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 5,
                          ),
                          Text(
                            space.uuid.replaceAll("\"", ""),
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Container(
                            height: 5,
                          ),
                          Text(
                            EnumsStrings.building[space.building],
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    isThreeLine: true,
                  ),
                  isUser && (space.isBookable || space.isLeasable)
                      ? ButtonBar(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: FlatButton(
                                child: isExternal
                                    ? const Text('ALQUILAR')
                                    : const Text('RESERVAR'),
                                onPressed: () {
                                  Navigator.pushNamed(context, "reservation",
                                      arguments: new SpaceScreenArguments(
                                          space, isExternal));
                                },
                              ),
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            )),
      ),
    );
  }
}
