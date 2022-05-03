import 'package:latlong2/latlong.dart';

class MapMarker {
  final String image;
  final String title;
  final String address;
  final LatLng location;
  MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location,
  });
}

final _locations = [
  LatLng(12.12465294190265, -86.26758336923703),
  LatLng(12.124735101327998, -86.2640959587788),
  LatLng(12.12455024258537, -86.26191107511823),
  LatLng(12.125115088341031, -86.26581865551118),
  LatLng(12.12850539255836, -86.26769545975087),
  LatLng(12.126449470922926, -86.27130034854444),
  LatLng(12.13150533139753, -86.27003434593242),
];

final mapMarkers = [
  MapMarker(
    image:
        'https://static.vecteezy.com/system/resources/previews/002/004/147/large_2x/cartoon-pizza-shop-vector.jpg',
    title: 'Managua',
    address: 'Los Robles #123',
    location: _locations[0],
  ),
  MapMarker(
    image:
        'https://us.123rf.com/450wm/stuartphoto/stuartphoto1705/stuartphoto170500326/77496742-icono-de-la-tienda-de-pizza-significado-pizzer%C3%ADa-restaurante-ilustraci%C3%B3n-3d.jpg?ver=6',
    title: 'Managua',
    address: 'Los Robles #123',
    location: _locations[1],
  ),
  MapMarker(
    image:
        'https://media-cdn.tripadvisor.com/media/photo-s/16/34/5f/49/mas-de-10-anos-mejorando.jpg',
    title: 'Managua',
    address: 'Los Robles #123',
    location: _locations[2],
  ),
  MapMarker(
    image:
        'https://gruposaedal.com/wp-content/uploads/2021/10/El-inventario-de-Dominos-Pizza-cae-despues-de-que-las-1140x641.jpeg',
    title: 'Managua',
    address: 'Los Robles #123',
    location: _locations[3],
  ),
  MapMarker(
    image:
        'https://www.eventoplus.com.ar/wp-content/uploads/2022/03/190-tiendas-Papa-Johns-en-Rusia-siguen-abiertas-Al-final.jpg',
    title: 'Managua',
    address: 'Los Robles #123',
    location: _locations[4],
  ),
  MapMarker(
    image:
        'https://www.eventoplus.com.ar/wp-content/uploads/2022/03/190-tiendas-Papa-Johns-en-Rusia-siguen-abiertas-Al-final.jpg',
    title: 'Managua',
    address: 'Los Robles #123',
    location: _locations[5],
  ),
  MapMarker(
    image:
        'https://www.eventoplus.com.ar/wp-content/uploads/2022/03/190-tiendas-Papa-Johns-en-Rusia-siguen-abiertas-Al-final.jpg',
    title: 'Managua',
    address: 'Los Robles #123',
    location: _locations[6],
  )
];
