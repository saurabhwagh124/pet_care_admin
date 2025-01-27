import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/vet_controller.dart';

class AssignVetScreen extends StatelessWidget {
  final VetController vetController = Get.find();

  final TextEditingController appointmentTimeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assign Veterinarian')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input for appointment time
            TextField(
              controller: appointmentTimeController,
              decoration: InputDecoration(labelText: 'Appointment Time'),
            ),

            // List of available veterinarians
            Obx(() {
              return Expanded(
                child: ListView.builder(
                  itemCount: vetController.vets.length,
                  itemBuilder: (context, index) {
                    final vet = vetController.vets[index];
                    return ListTile(
                      title: Text("Vet Name:${vet.name}"),
                      subtitle: Text("Clinic Name:${vet.clinicName}"),
                      trailing: ElevatedButton(
                        onPressed: () {
                          String appointmentTime =
                              appointmentTimeController.text;
                          vetController.assignVetToAppointment(
                              vet.name, appointmentTime);
                          appointmentTimeController.clear();
                        },
                        child: Text('Assign'),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
