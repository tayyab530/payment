import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'auth_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthenticationCubit() : super(AuthenticationInitial());

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationFailure(message: 'Login failed.'));
    }
  }

  void signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationFailure(message: 'Signup failed.'));
    }
  }
}
