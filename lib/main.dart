import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'EntryType.dart';
import 'SimpleBlocObserver.dart';
import 'ThemeDemo/ThmeChnagePage.dart';
import 'ThemeDemo/bloc/theme_cubit.dart';
import 'blocStructure/blocListApiCall/bloc/ArticleBloc.dart';
import 'blocStructure/blocListApiCall/bloc/ArticleState.dart';
import 'blocStructure/blocListApiCall/blocListApi.dart';
import 'blocStructure/blocSwitchList/SwitchListBloc.dart';
import 'blocStructure/blocSwitchList/SwitchListState.dart';
import 'blocStructure/bottomNavigationBloc/bloc/bottom_navigation_bloc.dart';
import 'blocStructure/bottomNavigationBloc/bloc/bottom_navigation_event.dart';
import 'blocStructure/bottomNavigationBloc/bottomNavigationPageRepo/pageOneRepo.dart';
import 'blocStructure/bottomNavigationBloc/bottomNavigationPageRepo/pageTwoRepo.dart';
import 'blocStructure/cartBloc/shopBloc/shop_bloc.dart';
import 'blocStructure/counterBloc/counterPage.dart';
import 'blocStructure/counterBloc/observable/CounterCubit.dart';
import 'blocStructure/counterBloc/observable/SwithCubit.dart';
import 'blocStructure/cubitBloc/cubitPage.dart';
import 'blocStructure/fireStoreBloc/FireStoreListPage.dart';
import 'blocStructure/fireStoreBloc/repository/FIrebaseGetDataRepository.data.dart';
import 'blocStructure/fireStoreBloc/storeBloc/FireStoreBloc.dart';
import 'blocStructure/infinateScroll/bloc/infinity_bloc.dart';
import 'blocStructure/infinateScroll/bloc/paginationCubit.dart';
import 'blocStructure/infinateScroll/postPage.dart';
import 'blocStructure/infinateScroll/postServices.dart';
import 'blocStructure/infinateScroll/repo/infinityRepo.dart';
import 'blocStructure/infinateScroll/repo/postRepository.dart';
import 'blocStructure/login/loginBloc/LoginBloc.dart';
import 'blocStructure/login/loginPageBloc.dart';
import 'blocStructure/login/repository/loginRepository.dart';
import 'comersApp/screens/views/productsScreen.dart';
import 'firebaseLogin/bloc/login/FirebaseLogin_bloc.dart';
import 'firebaseLogin/bloc/mobileOtp/mobile_otp_bloc.dart';
import 'firebaseLogin/bloc/singUp/FirebaseSignUp_bloc.dart';
import 'firebaseLogin/loginFireBase/FirbaseMobilePage.dart';
import 'firebaseLogin/loginFireBase/FirebaseLogin.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  PostRepository postRepository = PostRepository(PostServices());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit()),
        BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(UserRepository())),
        BlocProvider(
            create: (BuildContext context) =>
                ArticleBloc(ArticleInitialState())),
        BlocProvider<SwitchListBloc>(
            create: (BuildContext context) =>
                SwitchListBloc(InitialSwitchState(false))),
        BlocProvider<FireStoreBloc>(
            create: (BuildContext context) =>
                FireStoreBloc(fireStoreApi: FirebaseGetDataRepository())),
        BlocProvider<CounterCubit>(
            create: (BuildContext context) => CounterCubit()),
        BlocProvider<SwithCubit>(
            create: (BuildContext context) => SwithCubit()),
        BlocProvider<ShopBloc>(create: (BuildContext context) => ShopBloc()),
        BlocProvider<PostCubit>(
            create: (BuildContext context) => PostCubit(postRepository)),
        BlocProvider<FirebaseSignUpBloc>(
            create: (BuildContext context) => FirebaseSignUpBloc()),
        BlocProvider<FirebaseSignInBloc>(
            create: (BuildContext context) => FirebaseSignInBloc()),
        BlocProvider<MobileOtpBloc>(
            create: (BuildContext context) => MobileOtpBloc()),
        BlocProvider<BottomNavigationBloc>(
            create: (BuildContext context) => BottomNavigationBloc(
                  firstPageRepository: FirstPageRepository(),
                  secondPageRepository: SecondPageRepository(),
                )..add(const PageTapped(0))),
        BlocProvider<InfinityBloc>(
            create: (BuildContext context) => InfinityBloc(infinityRepo()))
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, themeState) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeState,
            builder: EasyLoading.init(),
            home: MyHomePage(title: 'Home'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget with WidgetsBindingObserver {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PrimaryButton(
              buttonText: 'Bloc Counter ',
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
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void navigateToLoginBloc({int? id}) {
    switch (id) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CounterPage()));
        //Get.to(HelloHomePage());
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

      case 5:
        Get.to(FirebaseLogin());
        //Constants().showTost(message: 'Under Development');
        break;

      // case 6:
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => FireStoreItemListPage()));
      //   break;

      case 7:
        //Constants().showTost(message: 'Under Development');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductsPage()));
        break;
      case 8:
        Get.to(ThemeChangePage());
        break;
      case 9:
        Get.to(FiremobilePage());
        break;
      default:
        print('');
    }
  }
}

class LoginLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/logo_social.png'),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String? buttonText;
  final Function? buttonClick;

  const PrimaryButton({Key? key, this.buttonText, this.buttonClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(
                  60), // fromHeight use double.infinity as width and 40 is the height
            ),
            onPressed: () {
              buttonClick!();
            },
            child: Text(buttonText ?? "")),
        const SizedBox(height: 8)
      ],
    );
  }
}

//! TEST
