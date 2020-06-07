import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:ucampus_lib/core/models/space.dart';

class BackgroundMap extends StatelessWidget {
  final int selectedFloor;
  final Function(LatLng) onMapTap;
  final List<Space> featuredSpaces;
  final Function(Space) onFeaturedSpaceTap;

  BackgroundMap({
    @required this.selectedFloor,
    @required this.onMapTap,
    @required this.featuredSpaces,
    @required this.onFeaturedSpaceTap,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(41.683252, -0.887632),
        zoom: 18.0,
        onTap: (position) => onMapTap(position),
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
                    (selectedFloor == -1
                        ? 'sotano'
                        : 'planta_' + selectedFloor.toString())
              ],
              format: 'image/png',
              transparent: true),
        ),
        MarkerLayerOptions(
          markers: [
            for (var feature in this
                .featuredSpaces
                .where((space) => space.floor == selectedFloor)
                .toList())
              new Marker(
                point: LatLng(feature.lat, feature.long),
                builder: (ctx) => new Container(
                  child: new Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
