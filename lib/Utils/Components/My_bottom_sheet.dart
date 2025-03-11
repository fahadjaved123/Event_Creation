import 'package:flutter/material.dart';

class MyBottomSheet {
   
  static void showMybottomsheet(BuildContext context){
    showModalBottomSheet(
      context: context,
       builder: (context){
        return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Setting",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Event"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Manage Participants"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.delete, ),
              title: Text("Delete Event", style: TextStyle()),
              onTap: () {
                Navigator.pop(context); // Close bottom sheet
               // showDeleteConfirmationDialog(context); // Open delete dialog
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share Event"),
              onTap: () {},
            ),
          ],
        ),
      );
       });
  }
}