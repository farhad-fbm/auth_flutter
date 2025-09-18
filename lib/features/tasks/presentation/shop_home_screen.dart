import 'package:flutter/material.dart';
// import 'package:uione/constants/app_colors.dart';
import 'package:uione/models/task.dart';
import 'package:uione/features/tasks/presentation/widgets/category_selector_widget.dart';
import 'package:uione/features/tasks/presentation/widgets/task_card.dart';
import 'package:uione/features/tasks/presentation/add_task_screen.dart';

class ShopHomeScreen extends StatefulWidget {
  const ShopHomeScreen({super.key});

  @override
  State<ShopHomeScreen> createState() => _ShopHomeScreenState();
}

class _ShopHomeScreenState extends State<ShopHomeScreen> {
  final List<String> categoriesTemp = [
    "All",
    "Cleaning",
    "Errands",
    "Health & Self-Care",
  ];

  String selectedCategory = "All";

  final List<Task> allTasksT = [
    Task(
      title: "Vacuum Living Room",
      category: "Cleaning",
      frequency: "DAILY",
      isToday: true,
    ),
    Task(
      title: "Pick up groceries",
      category: "Errands",
      frequency: "WEEKLY - SAT",
      isToday: true,
    ),
    Task(
      title: "Book Doctor Appointment",
      category: "Health & Self-Care",
      frequency: "",
      isToday: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Task> filteredTasks =
        selectedCategory == "All"
            ? allTasksT
            : allTasksT.where((t) => t.category == selectedCategory).toList();
    final todayTasks = filteredTasks.where((t) => t.isToday).toList();
    final upcomingTasks = filteredTasks.where((t) => !t.isToday).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("My Tasks & Routines")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 20),

            // Today's Tasks
            if (todayTasks.isNotEmpty) ...[
              Text(
                "Today's Tasks",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ...todayTasks.map((task) => TaskCard(task: task)),
              const SizedBox(height: 20),
            ],

            const SizedBox(height: 20),

            if (upcomingTasks.isNotEmpty) ...[
              Text(
                "Upcoming Tasks",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ...upcomingTasks.map((task) => TaskCard(task: task)),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        label: const Text("Add Task", style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
    );
  }
}
