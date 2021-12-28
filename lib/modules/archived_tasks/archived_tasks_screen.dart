import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/shared/components/components.dart';
import 'package:testing_app/shared/cubit/cubit.dart';
import 'package:testing_app/shared/cubit/states.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        List<Map> tasks = AppCubit.get(context).archiveTasks;
        return taskBuilder(tasks);
      },
    );
  }
}
