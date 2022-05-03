import 'package:flutter/material.dart';
import 'package:markers_map/constants/constants.dart';

class LocationMarket extends StatelessWidget {
  const LocationMarket({Key? key, this.selected = false}) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final size = selected ? markerSizeExpanded : markerSizeShrinked;
    return Center(
      child: AnimatedContainer(
        height: size,
        width: size,
        duration: const Duration(milliseconds: 400),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: mapBoxColor,
          ),
          child: const Center(
            child: Icon(
              Icons.location_on,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
