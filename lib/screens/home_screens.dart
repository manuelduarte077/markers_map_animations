import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:markers_map/constants/key_map.dart';
import 'package:markers_map/models/map_market.dart';

const keyMapBox = MAPBOX_ACCESS_TOKEN;
const mapBoxStyle = 'mapbox/dark-v10';
const mapBoxColor = Color(0xFF3DC5A7);

final myLocation = LatLng(12.12364648688805, -86.26523041760257);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();

  int _currentIndex = 0;

  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(
        Marker(
          point: mapItem.location,
          builder: (_) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  i,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticOut,
                );
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
          },
        ),
      );
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
          ),
          // add PageView
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[index];
                return _MyPageViewItem(
                  mapMarker: item,
                );
              },
            ),
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
      height: 50,
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

class _MyPageViewItem extends StatelessWidget {
  const _MyPageViewItem({
    Key? key,
    required this.mapMarker,
  }) : super(key: key);

  final MapMarker mapMarker;

  @override
  Widget build(BuildContext context) {
    const _styleTitle = TextStyle(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);

    final _styleAdress = TextStyle(fontSize: 14, color: Colors.grey[800]);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Image.network(
                      mapMarker.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          mapMarker.title,
                          style: _styleTitle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          mapMarker.address,
                          style: _styleAdress,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.zero,
              elevation: 6,
              color: mapBoxColor,
              onPressed: () {
                print('Marker tapped: ${mapMarker.title}');
              },
              child: const Text(
                'CALL',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
