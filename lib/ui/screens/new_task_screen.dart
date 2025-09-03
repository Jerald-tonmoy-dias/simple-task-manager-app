import 'package:flutter/material.dart';
import 'package:hyip/ui/screens/add_new_task_screen.dart';
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
                return const TaskCard(taskStatus: TaskStatus.sNew,);
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
  
  void _onTapAddNewTask() {
    Navigator.push(context,MaterialPageRoute(builder: (context)=> const AddNewTaskScreen()));
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
