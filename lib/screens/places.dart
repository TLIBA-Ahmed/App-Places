import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/add_place.dart';
import 'package:flutter_application_6/widgets/places_list.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const PlacesList(
        places: [],
      ),
    );
  }
}
