import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/vet_controller.dart';

class AssignVetScreen extends StatelessWidget {
  final VetController vetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign Vet to Appointment'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final vets = vetController.vets;

              if (vets.isEmpty) {
                return Center(
                  child: Text('No veterinarians available. Add vets to assign appointments.'),
                );
              }

              return ListView.builder(
                itemCount: vets.length,
                itemBuilder: (context, index) {
                  final vet = vets[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(vet.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: ${vet.email}'),
                          Text('Specialization: ${vet.specialization}'),
                          Text('Clinic: ${vet.clinicName}'),
                          Text('Experience: ${vet.experienceYears} years'),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _showTimeSlotPicker(context, vet.name);
                        },
                        child: Text('Assign Slot'),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showTimeSlotPicker(BuildContext context, String vetName) {
    final TextEditingController timeSlotController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Assign Time Slot'),
          content: TextField(
            controller: timeSlotController,
            decoration: InputDecoration(labelText: 'Enter Time Slot (e.g., 09:00 AM)'),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final timeSlot = timeSlotController.text.trim();

                if (timeSlot.isEmpty) {
                  Get.snackbar('Error', 'Please enter a valid time slot.');
                } else {
                  final result = vetController.assignVetToAppointment(vetName, timeSlot);

                  if (result) {
                    Get.snackbar('Success', '$vetName assigned to $timeSlot');
                  }
                  Get.back();
                }
              },
              child: Text('Assign'),
            ),
          ],
        );
      },
    );
  }
}
