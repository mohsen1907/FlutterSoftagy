import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testing_app/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:testing_app/modules/done_tasks/done_screen.dart';
import 'package:testing_app/modules/new_tasks/new_tasks_screen.dart';
import 'package:testing_app/shared/components/components.dart';
import 'package:testing_app/shared/components/constants.dart';
import 'package:testing_app/shared/cubit/cubit.dart';
import 'package:testing_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  var scafoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  // List<Map> tasks = [];
  @override
  void initState() {
    // super.initState();
    // createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              key: scafoldKey,
              appBar: AppBar(
                title: Text('Todo App'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // insertToDatabase();
                  if (cubit.isBottomSheetShown) {
                    if (formKey.currentState!.validate()) {
                      cubit.insertToDatabase(
                          title: titleController.text,
                          time: timeController.text,
                          date: dateController.text);
                          Navigator.pop(context);
                      // fabIcon = Icons.edit;
                      // isBottomSheetShown = false;
                      // setState(() {
                      //   fabIcon = Icons.edit;
                      // });
                      cubit.changeBottomSheetState(
                          isShow: false, icon: Icons.edit);
                    }
                  } else {
                    scafoldKey.currentState
                        ?.showBottomSheet((context) => Container(
                              color: Colors.grey[200],
                              padding: EdgeInsets.all(20.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //Title Box
                                    defaultTextFormField(
                                        controller: titleController,
                                        type: TextInputType.text,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'title must not be empty';
                                          }
                                        },
                                        labelText: "Task Title",
                                        prefix: Icons.title),

                                    SizedBox(
                                      height: 15,
                                    ),

                                    //TimeBox
                                    defaultTextFormField(
                                        controller: timeController,
                                        type: TextInputType.text,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'Time must not be empty';
                                          }
                                          return null;
                                        },
                                        labelText: "Task Time",
                                        prefix: Icons.watch_later,
                                        onTap: () {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((value) {
                                            print(value!.format(context));
                                            timeController.text =
                                                value.format(context);
                                          });
                                        }),
                                    SizedBox(
                                      height: 15,
                                    ),

                                    //DateBox
                                    defaultTextFormField(
                                        controller: dateController,
                                        type: TextInputType.text,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'Date must not be empty';
                                          }
                                          return null;
                                        },
                                        labelText: "Date Time",
                                        prefix: Icons.watch_later,
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime.parse(
                                                      '2022-10-03'))
                                              .then((value) {
                                            dateController.text =
                                                DateFormat.yMMMd()
                                                    .format(value!);
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ))
                        .closed
                        .then((value) => {
                              cubit.changeBottomSheetState(
                                  isShow: false, icon: Icons.edit),
                              // setState(() {
                              //   fabIcon = Icons.edit;
                              // })
                            });

                    // setState(() {
                    //   fabIcon = Icons.add;
                    // });
                    cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                  }
                },
                child: Icon(cubit.fabIcon),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  // setState(() {
                  //   currentIndex = index;
                  // });
                  cubit.changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu), label: 'Tasks'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.check_outlined), label: 'Done'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.architecture_outlined),
                      label: 'Archived'),
                ],
              ),
              //tasks.length==0? Center(child: null) : items[currentIndex],
              body: ConditionalBuilder(
                condition: state!= AppGetDatabaseLoadingState(),
                builder: (context) => cubit.items[cubit.currentIndex],
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ));
        },
      ),
    );
  }

  Future<String> getName() async {
    return ("My name is mohsen");
  }
}
