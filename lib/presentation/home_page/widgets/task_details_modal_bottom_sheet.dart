import 'package:flutter/material.dart';

class TaskDetailsShowModalBottomSheet extends StatelessWidget {
  const TaskDetailsShowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.home_outlined,
                color: Colors.grey.shade600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications_none,
                color: Colors.grey.shade600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.calendar_month_outlined,
                color: Colors.grey.shade600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.sticky_note_2_outlined,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      );
}
