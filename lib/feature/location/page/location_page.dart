import 'package:cloud_walk_test/common/base/base_state_page.dart';
import 'package:cloud_walk_test/feature/location/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rx_notifier/rx_notifier.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});
  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends BaseState<LocationPage, LocationController> {
  late GoogleMapController googleController;

  final LatLng _center = const LatLng(0, 0);

  @override
  void initState() {
    controller.getLocation();
    super.initState();
  }

  void _onMapCreated(GoogleMapController googleController) {
    final latLng = LatLng(controller.location.value?.lat ?? _center.latitude, controller.location.value?.lon ?? _center.longitude);
    googleController.moveCamera(CameraUpdate.newLatLng(latLng));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
      onRefresh: () => controller.getLocation(forceReload: true),
        child: RxBuilder(
          builder: (context) {
            if(controller.location.value == null){
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orangeAccent,
                  backgroundColor: Colors.blueGrey,
                ),
              );
            }else{
              return GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.location.value?.lat ?? _center.latitude, controller.location.value?.lon ?? _center.longitude),
                  zoom: 16.0,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('Current Location'),
                    position: LatLng(controller.location.value?.lat ?? _center.latitude, controller.location.value?.lon ?? _center.longitude),
                  )
                },
              );
            }
          },
        ),
      ),
    );
  }
}
