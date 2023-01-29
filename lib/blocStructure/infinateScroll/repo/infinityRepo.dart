// ignore_for_file: camel_case_types
import 'package:http/http.dart' as http;

class infinityRepo {
  callInfinity() async {
    var resposnse = await http
        .get(Uri.parse('https://randomuser.me/api/?page=1&results=10'));
    return resposnse;
  }
}
