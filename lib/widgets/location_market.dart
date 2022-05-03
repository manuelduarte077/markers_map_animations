import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:markers_map/constants/constants.dart';

class MyLocationMarker extends AnimatedWidget {
  const MyLocationMarker(Animation<double> animation, {Key? key})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    final newValue = lerpDouble(0.5, 1.0, value)!;
    const size = 50.0;

    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              width: size * newValue,
              height: size * newValue,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: mapBoxColor.withOpacity(0.5),
              ),
              child: Center(
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: mapBoxColor,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
