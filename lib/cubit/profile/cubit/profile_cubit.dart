import 'package:bloc/bloc.dart';
import 'package:wasili/cubit/profile/cubit/profile_state.dart';
import 'package:wasili/model/profile_model.dart';
import 'package:wasili/services/remote/profile_srvices.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  ProfileModel? profileModel;

  getProfileData({required String token}) {
    try {
      emit(ProfileLoadingState());

      ProfileServices()
          .getProfileData(
        token: token,
      )
          .then((value) {
        profileModel = ProfileModel.fromjson(value);
        emit(ProfileSuccessState());
      }).catchError((error) {
        print(error);
        emit(ProfileFailedState());
        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
