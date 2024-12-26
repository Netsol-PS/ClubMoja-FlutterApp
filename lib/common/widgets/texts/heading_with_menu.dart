import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../../core/res/colors/colors.dart';

class HeadingWithMenu extends StatefulWidget {
  const HeadingWithMenu({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'Selected item',
    this.onPressed,
    this.menuItems = const [],
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final List<String> menuItems; // List of menu items

  @override
  _HeadingWithMenuState createState() => _HeadingWithMenuState();
}

class _HeadingWithMenuState extends State<HeadingWithMenu> {
  late String _selectedItem;

  @override
  void initState() {
    super.initState();
    // Set the default selected item to the first item in the list
    if (widget.menuItems.isNotEmpty) {
      _selectedItem = widget.menuItems[0];
    } else {
      _selectedItem = widget.buttonTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: widget.textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (widget.showActionButton)
          PopupMenuButton<String>(
            color: AppColors.white,
            onSelected: (String value) {
              setState(() {
                // Update the selected item when a new item is chosen
                _selectedItem = value;
              });

              // Optionally, you can call the onPressed callback if needed
              if (widget.onPressed != null) {
                widget.onPressed!();
              }
            },
            itemBuilder: (BuildContext context) {
              return widget.menuItems
                  .map((String item) => PopupMenuItem<String>(
                value: item,
                child: Text(item),
              ))
                  .toList();
            },
            offset: const Offset(0, 40),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.white, // Transparent background for the button
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Text(_selectedItem), // Display the current selected item
                  const Icon(Icons.arrow_drop_down), // Dropdown arrow icon
                ],
              ),
            ), // Optional: Adjust position of dropdown
          ),
      ],
    );
  }
}
