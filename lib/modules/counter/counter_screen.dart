import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/modules/counter/cubit/cubit.dart';
import 'package:testing_app/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (BuildContext context, state) {
          if(state is CounterPlusState){
            print("PlusState: ${state.counter}");
          }
        },
        builder: (BuildContext context, Object? state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text("Counter"),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    CounterCubit.get(context).minus();
                  }, child: Text("MINUS")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${CounterCubit.get(context).counter}",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                    CounterCubit.get(context).plus();
                  }, child: Text("PLUS")),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
