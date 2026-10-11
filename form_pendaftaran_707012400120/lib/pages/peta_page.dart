import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PetaPage extends StatelessWidget {
  const PetaPage({super.key});

  // Koordinat kampus contoh (Bandung)
  static const LatLng lokasiKampus = LatLng(-6.967751191064061, 107.63501207321289);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lokasi Kegiatan')),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: lokasiKampus,
          initialZoom: 16.0,
        ),
        children: [
          // Layer tile dari OSM resmi
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.form_pendaftaran_707012400120',
          ),
          // Marker penanda lokasi
          MarkerLayer(
            markers: [
              Marker(
                point: lokasiKampus,
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
          const RichAttributionWidget(
            showFlutterMapAttribution:
                false, 
            permanentHeight: 30, 
            attributions: [
              TextSourceAttribution('OpenStreetMap contributors', onTap: null),
            ],
          ),
        ],
      ),
    );
  }
}
