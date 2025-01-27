import 'package:get/get.dart';

class VetController extends GetxController {
  // List of available veterinarians with more details
  RxList<Veterinarian> vets = <Veterinarian>[].obs;

  // Add or Edit Veterinarian
  void addOrEditVet(Veterinarian vet) {
    if (!vets.any((existingVet) => existingVet.name == vet.name)) {
      vets.add(vet); // Add new vet if not already present
    } else {
      int index =
          vets.indexWhere((existingVet) => existingVet.name == vet.name);
      vets[index] = vet;
    }
  }

  // Assign a vet to an appointment
  RxMap<String, String> appointments = <String, String>{}.obs;

  void assignVetToAppointment(String vetName, String appointmentTime) {
    if (appointments.containsValue(vetName) &&
        appointments.entries.any((entry) =>
            entry.value == vetName && entry.key == appointmentTime)) {
      Get.snackbar('Error',
          '$vetName is already booked at this time. Please choose a different time slot.');
    } else if (appointments.containsKey(appointmentTime)) {
      Get.snackbar('Error',
          'This time slot is already taken. Please choose a different time.');
    } else {
      appointments[appointmentTime] = vetName;
      Get.snackbar('Success', 'Veterinarian assigned to the appointment');
    }
  }

  // Delete Veterinarian
  void deleteVet(Veterinarian vet) {
    vets.remove(vet);
    Get.snackbar('Success', '${vet.name} has been deleted');
  }


  RxMap<String, String> availability = <String, String>{}.obs;
  void setAvailability(String vetName, String availabilityTime) {
    availability[vetName] = availabilityTime;
  }
}

class Veterinarian {
  String name;
  String clinicName;
  String highestQualification;
  Veterinarian({
    required this.name,
    required this.clinicName,
    required this.highestQualification,
  });
}
