import 'package:get/get.dart';

import '../model/veterinarian.dart';


class VetController extends GetxController {
  // List of veterinarians
  RxList<Veterinarian> vets = <Veterinarian>[].obs;

   // Map to track assigned appointments
  RxMap<String, String> appointments = <String, String>{}.obs; // {TimeSlot: VetName}

  // Add or Edit Veterinarian
  void addOrEditVet(Veterinarian vet) {
    int index = vets.indexWhere((existingVet) => existingVet.email == vet.email);
    if (index == -1) {
      // If not found, add as new vet
      vets.add(vet);
    } else {
      // If found, update existing vet
      vets[index] = vet;
    }
  }

   // Assign a vet to a specific time slot
  bool assignVetToAppointment(String vetName, String timeSlot) {
    if (appointments.containsKey(timeSlot)) {
      if (appointments[timeSlot] == vetName) {
        Get.snackbar('Error', '$vetName is already assigned to this time slot.');
        return false;
      }
      Get.snackbar('Error', 'This time slot is already assigned to another vet.');
      return false;
    }

    // Assign the vet to the time slot
    appointments[timeSlot] = vetName;
    return true;
  }

  // Delete Veterinarian
  void deleteVet(Veterinarian vet) {
    vets.remove(vet);
  }
}
