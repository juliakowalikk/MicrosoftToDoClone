import 'package:flutter/material.dart';

class HomePageListViewContainer extends StatefulWidget {
  final bool checkBoxValue;
  final void Function(bool?)? checkBoxOnChanged;
  final String taskTitle;
  final TextStyle? style;

  const HomePageListViewContainer({
    super.key,
    required this.checkBoxValue,
    this.checkBoxOnChanged,
    required this.taskTitle,
    this.style,
  });

  @override
  State<HomePageListViewContainer> createState() =>
      _HomePageListViewContainerState();
}

class _HomePageListViewContainerState extends State<HomePageListViewContainer> {
  bool isStarChecked = false;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                    shape: const CircleBorder(),
                    activeColor: Colors.grey,
                    value: widget.checkBoxValue,
                    onChanged: widget.checkBoxOnChanged),
                Text(
                  widget.taskTitle,
                  style: widget.style,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () =>
                      setState(() => isStarChecked = !isStarChecked),
                  icon: Icon(isStarChecked ? Icons.star : Icons.star_border),
                )
              ],
            ),
          ),
        ),
      );
}
