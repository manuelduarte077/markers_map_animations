import 'package:flutter/material.dart';
import 'package:markers_map/constants/constants.dart';

class MyLocationMarker extends StatelessWidget {
  const MyLocationMarker({
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
