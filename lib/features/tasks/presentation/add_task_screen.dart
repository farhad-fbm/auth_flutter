import 'package:flutter/material.dart';
import 'package:uione/features/tasks/presentation/widgets/category_selector_widget.dart';
import 'package:uione/features/tasks/presentation/widgets/frequency_selector_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final List<String> categoriesTemp = [
    'Cleaning',
    'Errands',
    'Health & Self-Care',
  ];
  String selectedCategory = "Cleaning";
  String selectedFrequency = "Daily";

  final TextEditingController taskController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Task Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: taskController,
              enabled: true,
              decoration: InputDecoration(
                hintText: "Enter task name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.teal.withValues(alpha: .6),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.teal.withValues(alpha: .6),
                    width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.teal.withValues(alpha: .6),
                    width: 1,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    categoriesTemp
                        .map(
                          (cat) => CategorySelectorWidget(
                            label: cat,
                            isSelected: selectedCategory == cat,
                            onTap: () {
                              setState(() => selectedCategory = cat);
                            },
                          ),
                        )
                        .toList(),
              ),
            ),

            const SizedBox(height: 16),

            // Frequency
            const Text(
              'Frequency',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            FrequencySelectorWidget(
              selectedFrequency: selectedFrequency,
              onFrequencySelected: (freq) {
                setState(() => selectedFrequency = freq);
              },
            ),
            const SizedBox(height: 16),

            // Notes
            const Text(
              'Notes (Optional)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: notesController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Add notes",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.teal.withValues(alpha: .6),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.teal.withValues(alpha: .6),
                    width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.teal.withValues(alpha: .6),
                    width: 1,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Save Task",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
