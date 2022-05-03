import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:markers_map/constants/key_map.dart';
import 'package:markers_map/models/map_market.dart';

const keyMapBox = MAPBOX_ACCESS_TOKEN;
const mapBoxStyle = 'mapbox/dark-v10';
const mapBoxColor = Color(0xFF3DC5A7);

final myLocation = LatLng(12.12364648688805, -86.26523041760257);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(Marker(
          point: mapItem.location,
          builder: (_) {
            return GestureDetector(
              onTap: () {
                print('Marker tapped: ${mapItem.title}');
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: mapBoxColor,
                ),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
            );
          }));
    }
    return _markerList;
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 16,
              zoom: 13,
              center: myLocation,
            ),
            nonRotatedLayers: [
              TileLayerOptions(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/${mapBoxStyle}/tiles/{z}/{x}/{y}?access_token=${keyMapBox}',
                additionalOptions: {
                  'accessToken': keyMapBox,
                  'id': mapBoxStyle,
                },
              ),
              MarkerLayerOptions(
                markers: _markers,
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    point: myLocation,
                    builder: (_) {
                      return const _MyLocationMarker();
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _MyLocationMarker extends StatelessWidget {
  const _MyLocationMarker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: mapBoxColor,
      ),
      child: const Icon(
        Icons.location_on,
        color: Colors.red,
        size: 20,
      ),
    );
  }
}
