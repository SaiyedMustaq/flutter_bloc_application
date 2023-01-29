import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/blocStructure/infinateScroll/repo/infinityRepo.dart';

import 'bloc/infinity_bloc.dart';

//https://randomuser.me/api/?page=1&results=10
class InfinityPage extends StatefulWidget {
  @override
  _InfinityPageState createState() => _InfinityPageState();
}

class _InfinityPageState extends State<InfinityPage> {
  late InfinityBloc infinityBloc;

  @override
  void initState() {
    infinityBloc = InfinityBloc(infinityRepo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
