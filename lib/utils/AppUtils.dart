import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class Constants {
  static final formatCurrency = new NumberFormat.simpleCurrency(
      locale: "en_US", decimalDigits: 0, name: 'Rs.');
  static final RouteName routeName = RouteName();
  static final CommonMethod commonMethod = CommonMethod();
  static final EndPoint endPoint = EndPoint();
  static final AppMargin margin = AppMargin();
  static final AppPadding padding = AppPadding();
  static final AppString appString = AppString();
  void showTost({required String message}) {
    EasyLoading.showToast('$message',
        duration: Duration(seconds: 1),
        toastPosition: EasyLoadingToastPosition.bottom);
  }
}

class RouteName {
  const RouteName();
  final homePage = '/';
  final pageOne = '/onePage';
  final pageTwo = '/pageTwo';
  final pageThree = '/pageThree';
  final pageFour = '/pageFour';
  final pageFive = '/pageFive';
}

class AppString {
  const AppString();
  final appName = "Flutter Implementation";
}

class AppColor {
  
}

class CommonMethod {
  const CommonMethod();

  void showSnack({
    @required BuildContext? context,
    @required String? message,
    @required String? actionText,
    Function? doAction,
  }) {
    final snackBar = SnackBar(
      content: Text(message!),
      action: SnackBarAction(
        label: actionText!,
        textColor: Colors.white,
        onPressed: () {
          doAction!();
        },
      ),
    );
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }

  // Future checkInterNet() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     return true;
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     return true;
  //   }
  //   return false;
  // }
}

class AppMargin {
  const AppMargin();
  final double extraSmall = 8.0;
  final double smallMargin = 10.5;
  final double mediumMargin = 15.0;
  final double largeMargin = 20.0;
  final double extraLargeMargin = 25.0;
}

class AppPadding {
  const AppPadding();
  final double smallPadding = 10.0;
}

class EndPoint {
  const EndPoint();

  static final todos = 'https://jsonplaceholder.typicode.com/todos';
  static final synergyLoginCall = "http://synergy.imperoserver.in/api/login";
}
