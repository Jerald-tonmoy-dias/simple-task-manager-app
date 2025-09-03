import 'package:flutter/material.dart';
import 'package:hyip/ui/widgets/TaskCard.dart';

import '../widgets/SummaryCard.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const TaskCard();
        },
        separatorBuilder: (context, index) => SizedBox(height: 8),
      ),
    );
  }
}
