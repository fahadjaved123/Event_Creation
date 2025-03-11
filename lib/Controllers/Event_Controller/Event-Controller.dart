import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_creation/Utils/utils.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  // fire Store instance
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // Function to add title or discription
  Future<void> adddata(
    String title,
    String Description,
    String date,
    String time,
  ) async {
    //String formatdate = DateFormat("dd MMM yy").format(date!);
    //String formatetime = "${time!.hour}:${time.minute.toString()}";
    try {
      await _firebaseFirestore.collection("Events").add({
        'Title': title,
        'Description': Description,
        'Event Date': date,
        'Event Time': time,
        'Timestamp': FieldValue.serverTimestamp(),
      }).then((onValue) {
        utils().toastmassege('Succefully add');
      });
    } catch (e) {
      utils().toastmassege('Failed to Load  $e');
    }
  }

  // for private or public button
  RxBool isprivate = false.obs;
  // toggel from public to private
  void toggleprive() {
    isprivate.toggle();
  }

  

  // for
  var isselected = false.obs;
  // to
  void toggelsele() {
    isselected.toggle();
  }
}
