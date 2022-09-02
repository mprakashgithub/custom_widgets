// import 'package:flutter/cupertino.dart';

// import '../../model/models/track_user_model.dart';
// import '../../model/repository/track_user_repo.dart';

// class TrackUserProvider with ChangeNotifier {
//   TrackUserModel? trackUserModel;
//   bool isLoaded = false;

//   Future<void> trackUserApi() async {
//     trackUserModel = await TrackUserRepo().trackUserRepoApi();
//     notifyListeners();
//   }

//   bool getIsLoaded() {
//     return isLoaded;
//   }

//   void setIsLoaded(bool value) {
//     isLoaded = value;
//     notifyListeners();
//   }
// }
