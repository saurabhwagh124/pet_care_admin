import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/vet_controller.dart';
import '../model/veterinarian.dart';

class AddVetScreen extends StatelessWidget {
  final VetController vetController = Get.find();

  // Pre-filled data for editing
  final Veterinarian? vet;

  AddVetScreen({this.vet});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController experienceYearsController =
      TextEditingController();
  final TextEditingController reviewScoreController = TextEditingController();
  final TextEditingController clinicNameController = TextEditingController();
  final TextEditingController startDayController = TextEditingController();
  final TextEditingController endDayController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController closeTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Populate fields if editing
    if (vet != null) {
      nameController.text = vet!.name;
      emailController.text = vet!.email;
      specializationController.text = vet!.specialization;
      experienceYearsController.text = vet!.experienceYears.toString();
      clinicNameController.text = vet!.clinicName;
      reviewScoreController.text = vet!.reviewScore.toString();
      startDayController.text = vet!.startDay;
      endDayController.text = vet!.endDay;
      startTimeController.text = vet!.startTime;
      closeTimeController.text = vet!.closeTime;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(vet == null ? 'Add Veterinarian' : 'Edit Veterinarian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Name is required' : null,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Email is required' : null,
              ),
              TextFormField(
                controller: specializationController,
                decoration: InputDecoration(labelText: 'Specialization'),
              ),
              TextFormField(
                controller: reviewScoreController,
                decoration: InputDecoration(labelText: 'Review Score'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: experienceYearsController,
                decoration: InputDecoration(labelText: 'Experience (Years)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: clinicNameController,
                decoration: InputDecoration(labelText: 'Clinic Name'),
              ),
              TextFormField(
                controller: startDayController,
                decoration: InputDecoration(labelText: 'Start Day'),
              ),
              TextFormField(
                controller: endDayController,
                decoration: InputDecoration(labelText: 'End Day'),
              ),
              TextFormField(
                controller: startTimeController,
                decoration: InputDecoration(labelText: 'Start Time'),
              ),
              TextFormField(
                controller: closeTimeController,
                decoration: InputDecoration(labelText: 'Close Time'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newVet = Veterinarian(
                      name: nameController.text,
                      email: emailController.text,
                      specialization: specializationController.text,
                      experienceYears:
                          int.parse(experienceYearsController.text),
                      clinicName: clinicNameController.text,
                      startDay: startDayController.text,
                      endDay: endDayController.text,
                      startTime: startTimeController.text,
                      closeTime: closeTimeController.text,
                      description: "",
                      reviewScore: 0,
                    );

                    vetController.addOrEditVet(newVet);
                    Get.back(); // Navigate back to Vet List Screen
                  }
                },
                child: Text(
                    vet == null ? 'Add Veterinarian' : 'Update Veterinarian'),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
