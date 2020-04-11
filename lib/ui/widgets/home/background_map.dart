import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class BackgroundMap extends StatelessWidget {
  final int selectedFloor;
  final Function(LatLng) onMapTap;

  BackgroundMap({@required this.selectedFloor, @required this.onMapTap});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(41.683252, -0.887632),
        zoom: 17.0,
        onTap: (position) => onMapTap(position),
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://api.mapbox.com/styles/v1/pitazzo/ck8qcai9u03mq1io20upsn6ty/tiles/256/{z}/{x}/{y}@2x?access_token={access_token}',
          additionalOptions: {
            'access_token' : 'pk.eyJ1IjoicGl0YXp6byIsImEiOiJjanQ0YW82dGcxNHo5NDVxdTNhMGRmdW5qIn0.3PUsd4pngYnc3SfUiHe8-Q',
            'id' : ''
          }
        ),
        TileLayerOptions(
          backgroundColor: new Color.fromRGBO(0, 0, 0, 0),
          wmsOptions: WMSTileLayerOptions(
              baseUrl:
                  'http://geo.ucampus.xyz/geoserver/ucampus/wms?service=WMS',
              layers: [
                'ucampus:eina_' +
                    (selectedFloor == -1
                        ? 'sotano'
                        : 'planta_' + selectedFloor.toString())
              ],
              format: 'image/png',
              transparent: true),
        ),
      ],
    );
  }
}
