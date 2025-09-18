import 'package:flutter/material.dart';
import 'package:uione/features/tasks/presentation/widgets/custom_horizontal_chip_selector.dart';
import 'package:uione/features/tasks/presentation/widgets/custom_radio_button.dart';

class FrequencySelectorWidget extends StatefulWidget {
  final String selectedFrequency;
  final Function(String) onFrequencySelected;

  const FrequencySelectorWidget({
    super.key,
    required this.selectedFrequency,
    required this.onFrequencySelected,
  });

  @override
  State<FrequencySelectorWidget> createState() =>
      _FrequencySelectorWidgetState();
}

class _FrequencySelectorWidgetState extends State<FrequencySelectorWidget> {
  final List<String> dayNames = ["MO", "TU", "WE", "TH", "FR", "SA", "SU"];

  String? selectedWeeklyDay;
  Set<String> selectedCustomDays = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRadioButton(
          label: "Daily",
          selected: widget.selectedFrequency == "Daily",
          onTap: () => setState(() => widget.onFrequencySelected("Daily")),
        ),
        // weekly
        const SizedBox(height: 8),
        CustomRadioButton(
          label: "Weekly",
          selected: widget.selectedFrequency == "Weekly",
          onTap: () {
            setState(() {
              widget.onFrequencySelected("Weekly");
              selectedWeeklyDay = null;
            });
          },
        ),
        if (widget.selectedFrequency == "Weekly")
          CustomHorizontalChipSelector(
            items: dayNames,
            singleSelection: true,
            selectedItem: selectedWeeklyDay,
            onItemSelected: (day) => setState(() => selectedWeeklyDay = day),
          ),
        // Custom
        const SizedBox(height: 8),
        CustomRadioButton(
          label: "Custom",
          selected: widget.selectedFrequency == "Custom",
          onTap: () {
            setState(() {
              widget.onFrequencySelected("Custom");
              selectedCustomDays.clear();
            });
          },
        ),
        if (widget.selectedFrequency == "Custom")
          CustomHorizontalChipSelector(
            items: dayNames,
            singleSelection: false,
            selectedItems: selectedCustomDays,
            onItemSelected: (day) {
              setState(() {
                if (selectedCustomDays.contains(day)) {
                  selectedCustomDays.remove(day);
                } else {
                  selectedCustomDays.add(day);
                }
              });
            },
          ),
      ],
    );
  }
}
