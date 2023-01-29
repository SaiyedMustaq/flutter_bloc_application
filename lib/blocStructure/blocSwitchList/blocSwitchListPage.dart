import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SwitchListBloc.dart';
import 'SwitchListEvent.dart';
import 'SwitchListState.dart';

class BlocSwitchPage extends StatefulWidget {
  @override
  _BlocSwitchPageState createState() => _BlocSwitchPageState();
}

class _BlocSwitchPageState extends State<BlocSwitchPage> {
  @override
  Widget build(BuildContext context) {
    final SwitchListBloc counterBloc = BlocProvider.of<SwitchListBloc>(context);

    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: (context, index) => SwitchItem(
            index: index,
            counterBloc: counterBloc,
          ),
          itemCount: 12,
        ));
  }
}

class SwitchItem extends StatelessWidget {
  int? index;
  SwitchListBloc? counterBloc;
  SwitchItem({Key? key, this.index, this.counterBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchListBloc, SwitchListEventState>(
      bloc: counterBloc,
      builder: (context, state) {
        return ListTile(
          leading: Text('$index'),
          trailing: BlocConsumer<SwitchListBloc, SwitchListEventState>(
            bloc: counterBloc,
            listener: (context, state) {
              if (state is SwitchChangeState) {
                print('STATE $state');
              }
            },
            builder: (context, state) {
              return Switch(
                  value: false,
                  onChanged: (value) {
                    counterBloc!.add(SwitchChangeEvent(value));
                  });
            },
          ),
        );
      },
    );
  }
}
