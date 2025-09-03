import 'package:flutter/material.dart';

enum TaskStatus { sNew, progress, completed, canceled }

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskStatus});

  final TaskStatus taskStatus;

  Color _getStatusChipColor() {
    late Color color;
    switch (taskStatus) {
      case TaskStatus.sNew:
        color = Colors.blue;
      case TaskStatus.progress:
        color = Colors.purple;
      case TaskStatus.completed:
        color = Colors.green;
      case TaskStatus.canceled:
        color = Colors.red;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title will be here',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Des will be here'),
            Text('Date: 12/02/23'),
            Row(
              children: [
                Chip(
                  label: Text('New', style: TextStyle(color: Colors.white)),
                  backgroundColor: _getStatusChipColor(),
                  side: BorderSide.none,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
