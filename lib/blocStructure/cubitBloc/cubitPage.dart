import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counterBloc/observable/CounterCubit.dart';

class CubitPage extends StatefulWidget {
  @override
  _CubitPageState createState() => _CubitPageState();
}

class _CubitPageState extends State<CubitPage> {
  CounterCubit? counterCubit;
  @override
  void initState() {
    counterCubit = CounterCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cubit Counter'),
      ),
      body: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocBuilder<CounterCubit, dynamic>(
          bloc: counterCubit,
          builder: (context, count) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello \n$count',
                  style: const TextStyle(fontSize: 150.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        counterCubit?.decrement();
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 15),
                    FloatingActionButton(
                      onPressed: () {
                        counterCubit?.increment();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
