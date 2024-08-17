import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  User? userInfo;
  Future<void> registerUser({required userName,required String email, required String password}) async {
    emit(RegisterLoading());

    try {
      UserCredential user =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userInfo = FirebaseAuth.instance.currentUser;
      userInfo!.updateDisplayName(userName);
      final SharedPreferences pref =
      await SharedPreferences.getInstance();
      pref.setBool('isLoggedIn', true);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'The account already exists for that email.'));
      }
    } catch(e) {
      emit(RegisterFailure(errMessage: 'there was an error please try again'));
    }
  }
}
