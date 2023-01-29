import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import '../../fireBaseRepository/firebaseRepository.dart';
import 'FirebaseLogin_event.dart';
import 'FirebaseLogin_state.dart';

class FirebaseSignInBloc
    extends Bloc<FirebaseSignInEvent, FirebaseSignInState> {
  FirebaseSignInBloc() : super(FirebaseLoginInitState());
  FirebaseRepository firebaseRepository = FirebaseRepository();

  @override
  Stream<FirebaseSignInState> mapEventToState(
      FirebaseSignInEvent event) async* {
    try {
      if (event is FirebaseLoginButtonEvent) {
        var response = await firebaseRepository.signInWithEmailMobile(
            emailMobile: event.emailMobile, password: event.password);
        print('FirebaseVerify Response $response');
        yield FirebaseSingInSuccessfullyState('Login Successfully');
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'FirebaseSignUpBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
