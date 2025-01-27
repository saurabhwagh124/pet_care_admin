import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/vet_controller.dart';
import '../widget/add_editvet.dart';
import '../widget/assignvet.dart';

class Veterinaryscreen extends StatelessWidget {
  final VetController vetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text('Veterinarians List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Obx(() {
              if (vetController.vets.isEmpty) {
                return Center(child: Text('No veterinarians added.'));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: vetController.vets.length,
                  itemBuilder: (context, index) {
                    final vet = vetController.vets[index];
                    return ListTile(
                      title: Text(vet.name),
                      subtitle: Text(
                          'Clinic: ${vet.clinicName}\nQualification: ${vet.highestQualification}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Edit button to AddVetScreen for editing
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Get.to(() =>
                                  AddVetScreen(vetName: vet.name)); // Edit vet
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.schedule),
                            onPressed: () {
                              Get.to(() => AssignVetScreen());
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              vetController.deleteVet(vet);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => AddVetScreen());
              },
              child: Text('Add Veterinarian'),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
