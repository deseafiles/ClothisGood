import 'package:android/data/services/local/local_geolocator_service.dart';
import 'package:flutter/material.dart'; // Changed from widgets.dart to material.dart to access Icons and CircularProgressIndicator
import 'package:geolocator/geolocator.dart';
import 'package:android/utils/constant.dart';

class WeatherIcon extends StatefulWidget {
  const WeatherIcon({ super.key });

  @override
  State<WeatherIcon> createState() => _WeatherIconState();
}

class _WeatherIconState extends State<WeatherIcon> {
  late final Future<Position?> _positionFuture;
  
  Future<String?>? _addressFuture;

  @override
  void initState() {
    super.initState();
    _positionFuture = GeolocatorService().getCurrentPosition();
  }
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position?>(
      future: _positionFuture,
      builder: (context, locationSnapshot) {
        if (locationSnapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(12),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        if (locationSnapshot.hasError) {
          return const Center(child: Text('Location error'));
        }

        if (!locationSnapshot.hasData || locationSnapshot.data == null) {
          return const Center(child: Text('Location not found'));
        }

        final position = locationSnapshot.data!;

        _addressFuture ??= GeolocatorService().getCurrentLocation(
          position,
        );

        return FutureBuilder<String?>(
          future: _addressFuture,
          builder: (context, addressSnapshot) {
            if (addressSnapshot.connectionState ==
                ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(12),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            }

            if (addressSnapshot.hasError) {
              debugPrint('ADDRESS ERROR: ${addressSnapshot.error}');
              debugPrint('STACK: ${addressSnapshot.stackTrace}');
              return const Center(child: Text('Address error'));
            }

            if (!addressSnapshot.hasData ||
                addressSnapshot.data == null) {
              return const Center(child: Text('Location not found'));
            }

            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Center(child: Text(addressSnapshot.data!)),
            );
          },
        );
      },
    );
  }
}
