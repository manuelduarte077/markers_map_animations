import 'package:flutter/material.dart';
import 'package:markers_map/constants/constants.dart';
import 'package:markers_map/models/map_market.dart';

class MyPageViewItem extends StatelessWidget {
  const MyPageViewItem({
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
