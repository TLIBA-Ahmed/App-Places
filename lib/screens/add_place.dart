import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/providers/user_places.dart';
import 'package:flutter_application_6/widgets/image_input.dart';
import 'package:flutter_application_6/widgets/location_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  _savePlace() {
    final enterTitle = _titleController.text;
    if (enterTitle.isEmpty || _selectedImage == null) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enterTitle, _selectedImage!);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add new place")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(height: 10),
            // Image input
            ImageInput(onSelectImage: (File image) => _selectedImage = image),
            const SizedBox(height: 10),
            //Location input
            const LocationInput(),
            const SizedBox(height: 10),
            ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text("Add place"))
          ],
        ),
      ),
    );
  }
}
