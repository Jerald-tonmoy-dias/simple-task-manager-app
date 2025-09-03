import 'package:flutter/material.dart';
import 'package:hyip/ui/widgets/TaskCard.dart';

import '../widgets/SummaryCard.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSummarySection(),
            ListView.separated(
              itemCount: 6,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const TaskCard();
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildSummarySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SummaryCard(title: 'New', count: 12),
          SummaryCard(title: 'Progress', count: 12),
          SummaryCard(title: 'Completed', count: 12),
          SummaryCard(title: 'Canceled', count: 12),
        ],
      ),
    );
  }
}
