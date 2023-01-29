import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bottom_navigation_bloc.dart';
import 'bloc/bottom_navigation_event.dart';
import 'bloc/bottom_navigation_state.dart';
import 'page/PageOne.dart';
import 'page/PageTwo.dart';

class BottomNavigationMainPage extends StatefulWidget {
  @override
  _BottomNavigationMainPageState createState() =>
      _BottomNavigationMainPageState();
}

class _BottomNavigationMainPageState extends State<BottomNavigationMainPage> {
  late BottomNavigationBloc bottomNavigationBloc;

  @override
  void initState() {
    // TODO: implement initState
    bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);
    bottomNavigationBloc.add(const PageTapped(0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation with BLoC'),
      ),
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        bloc: bottomNavigationBloc,
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FirstPageLoaded) {
            return FirstPage();
          }
          if (state is SecondPageLoaded) {
            return SecondPage();
          }
          return Container();
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              bloc: bottomNavigationBloc,
              builder: (BuildContext context, BottomNavigationState state) {
                return BottomNavigationBar(
                  currentIndex: bottomNavigationBloc.currentIndex,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home, color: Colors.black),
                      label: 'First',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.all_inclusive, color: Colors.black),
                      label: 'Second',
                    ),
                  ],
                  onTap: (index) => bottomNavigationBloc.add(PageTapped(index)),
                );
              }),
    );
  }
}
