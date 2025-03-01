import 'package:flutter/material.dart';

class EventCategory extends StatefulWidget {
  EventCategory({super.key});

  @override
  State<EventCategory> createState() => _EventCategoryState();
}

class _EventCategoryState extends State<EventCategory> {
  String selectedCategory = '';
  final List<String> finalt = [];
  @override
  final List<String> eventCategories = [
    "Concerts",
    "Workshops",
    "Networking Events",
    "Private Parties",
    "Themed Events",
    "Food & Drink Events",
    "Festivals",
    "Fitness & Wellness Events",
    "Exhibitions & Fairs",
  ];
  final List<String> Particpants = [
    "General Public",
    "Industry Professional",
    "Students",
    "Families",
    "Couples",
    "Solo Participants",
    "Groups/Teams",
    "Vip Guest",
  ];

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (finalt.contains(category)) {
        finalt.remove(category);
      } else {
        finalt.add(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF33495D),
      appBar: AppBar(
        backgroundColor: Color(0xFF33495D),
        title: Text(
          'Event Category',
          style: TextStyle(
              color: Color(0xFFBDC3C7),
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              spacing: 5, // Horizontal space between items
              runSpacing: 5, // Vertical space between lines
              children: eventCategories.map((cat) {
                return _buildCategoryButton(cat);
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 120.0),
              child: Text("Participants",
                  style: TextStyle(
                      color: Color(0xFFBDC3C7),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
            ),
            Wrap(
              spacing: 5, // Horizontal space between items
              runSpacing: 5, // Vertical space between lines
              children: Particpants.map((cat) {
                return _buildCategoryButton(cat);
              }).toList(),
            ),
            selectedCategory.isEmpty
                ? Center(child: Text('Select a category to see options.'))
                : Text(finalt.toString()),
            selectedCategory.isEmpty
                ? Center(child: Text('Select a category to see options.'))
                : Text(finalt.toString())
          ],
        ),
      ),
    );
  }

  //
  Widget _buildCategoryButton(String category) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor:
                finalt.contains(category) ? Color(0xFFBDC3C7) : Colors.black,
            backgroundColor: finalt.contains(category)
                ? Color(0xFF2ECC71)
                : Color(0xFFBDC3C7)),
        onPressed: () => selectCategory(category),
        child: Text(category),
      ),
    );
  }
}
