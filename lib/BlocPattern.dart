import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'ThemeDemo/ThmeChnagePage.dart';
import 'ThemeDemo/bloc/theme_cubit.dart';
import 'blocStructure/blocListApiCall/blocListApi.dart';
import 'blocStructure/bottomNavigationBloc/MainPageBottomNav.dart';
import 'blocStructure/counterBloc/counterPage.dart';
import 'blocStructure/cubitBloc/cubitPage.dart';
import 'blocStructure/fireStoreBloc/FireStoreListPage.dart';
import 'blocStructure/infinateScroll/postPage.dart';
import 'blocStructure/login/loginPageBloc.dart';
import 'blocStructure/login/repository/loginRepository.dart';
import 'main.dart';

class BlocPatternPage extends StatefulWidget with WidgetsBindingObserver {
  BlocPatternPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _BlocPatternState createState() => _BlocPatternState();
}

class _BlocPatternState extends State<BlocPatternPage>
    with WidgetsBindingObserver {
  UserRepository? userRepository = UserRepository();

  ThemeCubit themeCubit = ThemeCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print('dispose CALL');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    print('didChangePlatformBrightness CALL');
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 25.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPictureSize: const Size.square(80),
              arrowColor: Colors.red,
              currentAccountPicture: CircleAvatar(
                maxRadius: 50.0,
                minRadius: 50.0,
                backgroundColor: Colors.white,
                child: Image.network(
                    'https://s27.q4cdn.com/202248034/files/images/executive/Evgeny.png'),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              accountEmail: Text(
                'abd@gmial.com',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              accountName: Text(
                'Text',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Version 0.1'),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bloc',
          style: TextStyle(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 60),
          PrimaryButton(
            buttonText: 'Bottom Navigation Bloc',
            buttonClick: () => navigateToLoginBloc(id: 11),
          ),
          PrimaryButton(
            buttonText: 'Bloc Counter',
            buttonClick: () => navigateToLoginBloc(id: 0),
          ),
          PrimaryButton(
            buttonText: 'Cubit Counter ',
            buttonClick: () => navigateToLoginBloc(id: 1),
          ),
          PrimaryButton(
            buttonText: 'Bloc Login ',
            buttonClick: () => navigateToLoginBloc(id: 2),
          ),
          PrimaryButton(
            buttonText: 'Bloc Listing',
            buttonClick: () => navigateToLoginBloc(id: 3),
          ),
          PrimaryButton(
            buttonText: 'Bloc Pagination',
            buttonClick: () => navigateToLoginBloc(id: 4),
          ),
          PrimaryButton(
            buttonText: 'Bloc Firebase Login',
            buttonClick: () => navigateToLoginBloc(id: 5),
          ),
          PrimaryButton(
            buttonText: 'Bloc Mobile Otp',
            buttonClick: () => navigateToLoginBloc(id: 9),
          ),
          PrimaryButton(
            buttonText: 'Bloc Add to cart',
            buttonClick: () => navigateToLoginBloc(id: 6),
          ),
          PrimaryButton(
            buttonText: 'Bloc Shop',
            buttonClick: () => navigateToLoginBloc(id: 7),
          ),
          PrimaryButton(
            buttonText: 'Theme Change',
            buttonClick: () => navigateToLoginBloc(id: 8),
          ),
          PrimaryButton(
            buttonText: 'Animation Page',
            buttonClick: () => navigateToLoginBloc(id: 10),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void navigateToLoginBloc({int? id}) {
    switch (id) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CounterPage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CubitPage()));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage(
                      userRepository: userRepository,
                    )));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BlocListingPage()));
        break;

      case 4:
        Get.to(PostPage());
        //Constants().showTost(message: 'Under Development');

        break;

      // case 6:
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => FireStoreItemListPage()));
      //   break;

      case 8:
        Get.to(ThemeChangePage());
        break;

      case 11:
        Get.to(BottomNavigationMainPage());
        break;
      default:
        print('');
    }
  }
}
