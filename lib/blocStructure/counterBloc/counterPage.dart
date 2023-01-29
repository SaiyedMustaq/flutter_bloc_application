import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CounterBloc.dart';
import 'CounterEvent.dart';
import 'CounterState.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterBloc _counterBloc = CounterBloc(CounterState(counter: 0));
  List<SwitchModel> switchModelList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bloc Counter'),
      ),
      body: SimpelStreamBloc(counterBloc: _counterBloc),
      floatingActionButton: BottomFlotingButtons(counterBloc: _counterBloc),
    );
  }
}

class BottomFlotingButtons extends StatelessWidget {
  const BottomFlotingButtons({
    Key? key,
    required CounterBloc counterBloc,
  })  : _counterBloc = counterBloc,
        super(key: key);

  final CounterBloc _counterBloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () => _counterBloc.add(IncrementEvent()),
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 15),
        FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () => _counterBloc.add(DecrementEvent()),
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}

class SimpelStreamBloc extends StatelessWidget {
  const SimpelStreamBloc({
    Key? key,
    required CounterBloc counterBloc,
  })  : _counterBloc = counterBloc,
        super(key: key);

  final CounterBloc _counterBloc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CounterBloc, CounterState>(
          bloc: _counterBloc,
          builder: (context, snapshot) {
            return Center(
              child: Text(
                "${snapshot.counter}",
                style: const TextStyle(fontSize: 200.0),
              ),
            );
          }),
    );
  }
}
