import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:ucampus/core/models/space.dart';

class MiniMap extends StatelessWidget {
  final Space space;

  MiniMap({@required this.space});

  @override
  Widget build(BuildContext context) {
    LatLng _spaceCenter = LatLng(41.683402, -0.887682);
    int _floor = 0;
    return FlutterMap(
      options: MapOptions(
        center: _spaceCenter, //TODO: añadir
        zoom: 19.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/pitazzo/ck8qcai9u03mq1io20upsn6ty/tiles/256/{z}/{x}/{y}@2x?access_token={access_token}',
            additionalOptions: {
              'access_token':
                  'pk.eyJ1IjoicGl0YXp6byIsImEiOiJjanQ0YW82dGcxNHo5NDVxdTNhMGRmdW5qIn0.3PUsd4pngYnc3SfUiHe8-Q',
              'id': ''
            }),
        TileLayerOptions(
          backgroundColor: new Color.fromRGBO(0, 0, 0, 0),
          wmsOptions: WMSTileLayerOptions(
              baseUrl:
                  'http://geo.ucampus.xyz/geoserver/ucampus/wms?service=WMS',
              layers: [
                'ucampus:eina_' +
                    (_floor == -1 ? 'sotano' : 'planta_' + _floor.toString())
              ],
              format: 'image/png',
              transparent: true),
        ),
        MarkerLayerOptions(markers: [
          Marker(
            point: _spaceCenter,
            builder: (context) => Icon(
              Icons.location_on,
              color: Theme.of(context).primaryColor,
              size: 40,
            ),
          ),
        ]),
      ],
    );
  }
}
