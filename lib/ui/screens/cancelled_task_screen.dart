import 'package:flutter/material.dart';
import 'package:hyip/ui/widgets/TaskCard.dart';

import '../widgets/SummaryCard.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const TaskCard(taskStatus: TaskStatus.canceled);
        },
        separatorBuilder: (context, index) => SizedBox(height: 8),
      ),
    );
  }
}
