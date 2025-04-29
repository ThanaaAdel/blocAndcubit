import 'package:chnangebetweenblocandcubit/bloc_task/task_bloc.dart';
import 'package:chnangebetweenblocandcubit/bloc_task/task_event.dart';
import 'package:chnangebetweenblocandcubit/bloc_task/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BlocProvider(
          create: (context) => TaskBloc(),
          child: const TaskScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TaskBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('مهامي'),
        centerTitle: true,
      ),
      body: BlocBuilder<TaskBloc,TasksState>(
        builder: (context,state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // TextField
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: cubit.controller,
                        decoration: InputDecoration(
                          hintText: 'أكتب المهمة هنا',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                         context.read<TaskBloc>().add(AddTaskEvent(cubit.controller.text));
                       // cubit.addTask(cubit.controller.text);
                        print("task ${cubit.controller.text}");
                      },
                      child: const Text('إضافة'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Tasks list (dummy for now)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.tasksList.length, // عدد وهمي للتاسكات
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Checkbox(
                            value: state.tasksList[index].isComplete,
                            onChanged: (value) {
                              context.read<TaskBloc>().add(CheckTask( state.tasksList[index].id));

                              // cubit.checkCompleteTask(id: state.tasksList[index].id);
                            },
                          ),
                          title:  Text(state.tasksList[index].title),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.read<TaskBloc>().add(UpdateTask( state.tasksList[index].id));

                                  //     cubit.updateTask(id: state.tasksList[index].id);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<TaskBloc>().add(RemoveTask( state.tasksList[index].id));

                                },
                                  // cubit.removeTask(
                                  //   id: state.tasksList[index].id,
                                  // );                                },
                                icon: const Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
