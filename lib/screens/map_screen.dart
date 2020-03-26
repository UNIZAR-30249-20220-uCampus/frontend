import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:ucampus/data/espacio.dart';
import '../widgets/space_card.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _selectedFloor = 0;

  //TODO Por defecto se muestran las tarjetas
  bool _showCards = true;

  final espacios = List<Espacio>.generate(
    10,
    (i) => Espacio('Aula $i', 'Ada Byron', 20, '...'),
  );

  void _selectFloor(int floor) {
    setState(() {
      _selectedFloor = floor;
    });
  }

  void _toShowCards() {
    setState(() {
      //TODO Por defecto se muestran las tarjetas
      _showCards = !_showCards;
    });
  }

  Widget _buildFloorButtons(BuildContext context) {
    List<int> floors = [4, 3, 2, 1, 0, -1];
    return Padding(
      padding: EdgeInsets.only(
        right: 10.0,
      ),
      child: Material(
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Wrap(
          spacing: 0.0,
          direction: Axis.vertical,
          children: <Widget>[
            for (var floor in floors)
              Container(
                  width: 45,
                  child: FlatButton(
                    color: _selectedFloor == floor
                        ? Theme.of(context).primaryColor
                        : null,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Text(floor.toString(),
                        style: TextStyle(
                          color: _selectedFloor == floor
                              ? Theme.of(context).accentColor
                              : Theme.of(context).primaryColor,
                        )),
                    onPressed: () {
                      _selectFloor(floor);
                    },
                  )),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 205.0,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.85),
            itemCount: espacios.length,
            itemBuilder: (BuildContext context, int itemIndex) {
              var espacio = espacios[itemIndex];
              return buildSpaceCarouselItem(context, espacio);
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: Stack(
          children: <Widget>[
            // Replace this container with your Map widget
            FlutterMap(
              options: MapOptions(
                center: LatLng(41.683252, -0.887632),
                zoom: 17.0,
                plugins: [],
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                  tileProvider: NonCachingNetworkTileProvider(),
                ),
                TileLayerOptions(
                    backgroundColor: new Color.fromRGBO(0, 0, 0, 0),
                    wmsOptions: WMSTileLayerOptions(
                        baseUrl:
                            'http://geo.ucampus.xyz/geoserver/ucampus/wms?service=WMS',
                        layers: [
                          'ucampus:eina_' +
                              (_selectedFloor == -1
                                  ? 'sotano'
                                  : 'planta_' + _selectedFloor.toString())
                        ],
                        format: 'image/png',
                        transparent: true)),
              ],
            ),
            Positioned(
                top: 50,
                right: 15,
                left: 15,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          splashColor: Colors.grey,
                          icon: Icon(Icons.menu),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.go,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                hintText: "Buscar..."),
                            onSubmitted: (value) {
                              _toShowCards();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              'RD',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),

            Positioned(
                bottom: _showCards ? 0 : 30,
                right: 0,
                left: 0,
                child: Column(children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(child: _buildFloorButtons(context)),
                    ],
                  ),
                  _showCards
                      ? Row(children: [
                          Container(
                              child:
                                  new Flexible(child: _buildCarousel(context))),
                        ])
                      : Container(),
                ])),
          ],
        ),
      ),
    );
  }
}
