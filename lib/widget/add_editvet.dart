import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/vet_controller.dart';

class AddVetScreen extends StatelessWidget {
  final VetController vetController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController clinicNameController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();

  final String vetName;

  AddVetScreen({Key? key, this.vetName = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // editing an existing vet
    if (vetName.isNotEmpty) {
      final vet = vetController.vets.firstWhere((vet) => vet.name == vetName);
      nameController.text = vet.name;
      clinicNameController.text = vet.clinicName;
      qualificationController.text = vet.highestQualification;
    }

    return Scaffold(
      appBar: AppBar(
          title:
              Text(vetName.isEmpty ? 'Add Veterinarian' : 'Edit Veterinarian')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Name input
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Veterinarian Name'),
            ),

            // Clinic Name input
            TextField(
              controller: clinicNameController,
              decoration: InputDecoration(labelText: 'Clinic Name'),
            ),

            // Highest Qualification input
            TextField(
              controller: qualificationController,
              decoration: InputDecoration(labelText: 'Highest Qualification'),
            ),

            // Add or Update button
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    clinicNameController.text.isNotEmpty &&
                    qualificationController.text.isNotEmpty) {
                  final vet = Veterinarian(
                    name: nameController.text,
                    clinicName: clinicNameController.text,
                    highestQualification: qualificationController.text,
                  );

                  vetController.addOrEditVet(vet);
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Please fill all fields');
                }
              },
              child: Text(vetName.isEmpty ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
