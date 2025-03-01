import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  // fire Store instance
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // Function to add title or discription
  Future<void> adddata(
      String title, String Description, ) async {
    // String formatdate = DateFormat("dd MMM yy").format(date);
    // String formatetime = "${Time.hour}:${Time.minute.toString()}";
    try {
      await _firebaseFirestore.collection("Events").add({
        'Title': title,
        'Description': Description,
        // 'Event Date': formatdate,
        // 'Event Time': formatetime,
        'Timestamp': FieldValue.serverTimestamp(),
      });
      Get.snackbar('Success', "Successfully add Event",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", "Faild to add Event $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  // for private or public button
  RxBool isprivate=false.obs;
  // toggel from public to private
  void toggleprive(){
    isprivate.toggle();
  }
  // for 
  var isselected=false.obs;
  // to
  void toggelsele(){
    isselected.toggle();
  }
}
