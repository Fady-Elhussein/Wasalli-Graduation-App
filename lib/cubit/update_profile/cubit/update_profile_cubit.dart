import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/cubit/update_profile/cubit/update_profile_state.dart';
import 'package:wasili/services/remote/update_profile_services.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(UpdateProfileInitialState());

  Future updateProfile({
    required String token,
    required String fName,
    required String lName,
    required String phoneNumber,
    required String address,
  }) async {
    try {
      emit(UpdateProfileLoadingState());
      await UpdateProfileServices()
          .updateProfile(
              token: token,
              fName: fName,
              lName: lName,
              phoneNumber: phoneNumber,
              address: address)
          .then(
        (value) {
          print(value);

          emit(UpdateProfileLoadingState());
        },
      ).catchError((error) {
        emit(UpdateProfileFailedState());

        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}

//     try {
      
//     } catch (e) {
      
//     }
//     UpdateProfileServices().updateProfile(
//         token: token,
//         fName: fName,
//         lName: lName,
//         email: email,
//         phoneNumber: phoneNumber,
//         address: address);
//   }
// }
