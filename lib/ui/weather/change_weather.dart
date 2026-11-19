import 'package:android/domain/models/weathers/current_weather.dart';
import 'package:android/domain/models/weathers/location_data.dart';
import 'package:android/domain/models/weathers/weather_location_selected.dart';
import 'package:android/ui/provider/weather_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChangeWeather extends ConsumerStatefulWidget {
  final WeatherLocationSelected? initialSelection;

  const ChangeWeather({
    super.key,
    this.initialSelection,
  });

  @override
  ConsumerState<ChangeWeather> createState() => _ChangeWeatherState();
}

class _ChangeWeatherState extends ConsumerState<ChangeWeather> {
  LocationData? selectedLocation;
  bool useCurrentLocation = true;
  String searchKeyword = '';

  @override
  void initState() {
    super.initState();

    final initial = widget.initialSelection;

    if (initial != null) {
      useCurrentLocation = initial.useCurrentLocation;
      selectedLocation = initial.location;
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationsAsync = ref.watch(locationsProvider);

    final currentLocationAsync = useCurrentLocation
        ? ref.watch(getLocationProvider)
        : null;

    final currentWeatherAsync = useCurrentLocation
        ? ref.watch(getLangLongProvider)
        : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Weather'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Use current location'),
            subtitle: const Text('Use your device GPS location'),
            value: useCurrentLocation,
            onChanged: (value) {
              setState(() {
                useCurrentLocation = value;
              });
            },
          ),

          if (useCurrentLocation)
            ListTile(
              leading: const Icon(Icons.my_location),
              title: const Text('Current Location'),
              subtitle: currentLocationAsync!.when(
                data: (location) {
                  return Text(
                    location ?? 'Location unavailable',
                  );
                },
                loading: () {
                  return const Text('Loading location...');
                },
                error: (error, stackTrace) {
                  return const Text('Unable to get location');
                },
              ),
              trailing: currentWeatherAsync!.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.check_circle),
            ),

          if (!useCurrentLocation) ...[
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search location...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    searchKeyword = value;
                  });
                },
              ),
            ),

            Expanded(
              child: locationsAsync.when(
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text('Error: $error'),
                  );
                },
                data: (locations) {
                  final filteredLocations = locations.where((location) {
                    final keyword = searchKeyword.toLowerCase();

                    return location.name.toLowerCase().contains(keyword) ||
                        location.district.toLowerCase().contains(keyword);
                  }).toList();

                  if (filteredLocations.isEmpty) {
                    return const Center(
                      child: Text('Location not found'),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredLocations.length,
                    itemBuilder: (context, index) {
                      final location = filteredLocations[index];

                      return RadioListTile<String>(
                        title: Text(location.name),
                        subtitle: Text(location.district),
                        value: location.name,
                        groupValue: selectedLocation?.name,
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = location;
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],

          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _canSave(
                  currentLocationAsync,
                  currentWeatherAsync,
                )
                    ? _saveLocation
                    : null,
                child: const Text('Save'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _canSave(
    AsyncValue<String?>? currentLocation,
    AsyncValue<CurrentWeather>? currentWeather,
  ) {
    if (useCurrentLocation) {
      return currentLocation?.hasValue == true &&
          currentLocation?.value != null &&
          currentWeather?.hasValue == true;
    }

    return selectedLocation != null;
  }

  void _saveLocation() {
    context.pop(
      WeatherLocationSelected(
        useCurrentLocation: useCurrentLocation,
        location: useCurrentLocation ? null : selectedLocation,
      ),
    );
  }
}
