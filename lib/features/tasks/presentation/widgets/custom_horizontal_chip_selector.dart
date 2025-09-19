import 'package:flutter/material.dart';

class CustomHorizontalChipSelector extends StatelessWidget {
  final List<String> items;
  final bool singleSelection; // true = ChoiceChip, false = FilterChip
  final String? selectedItem; // for single selection
  final Set<String>? selectedItems; // for multiple selection
  final Function(String) onItemSelected;

  const CustomHorizontalChipSelector({
    super.key,
    required this.items,
    this.singleSelection = true,
    this.selectedItem,
    this.selectedItems,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            items.map((item) {
              if (singleSelection) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(item),
                    selected: selectedItem == item,
                    showCheckmark: false,
                    selectedColor: Colors.teal,
                    backgroundColor: Colors.grey.shade200,
                    labelStyle: TextStyle(
                      color: selectedItem == item ? Colors.white : Colors.black,
                    ),
                    onSelected: (_) => onItemSelected(item),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(item),
                    selected: selectedItems?.contains(item) ?? false,
                    showCheckmark: false,
                    selectedColor: Colors.teal,
                    backgroundColor: Colors.grey.shade200,
                    labelStyle: TextStyle(
                      // color: selectedItem == item ? Colors.white : Colors.black,
                      color:
                          selectedItems?.contains(item) ?? false
                              ? Colors.white
                              : Colors.black,
                    ),

                    onSelected: (_) => onItemSelected(item),
                  ),
                );
              }
            }).toList(),
      ),
    );
  }
}
