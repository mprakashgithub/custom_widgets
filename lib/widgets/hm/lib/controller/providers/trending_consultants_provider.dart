// import 'package:flutter/cupertino.dart';

// import '../../model/models/trending_consultants_model.dart';

// class TrendingConsultantsProvider with ChangeNotifier {
//   List<TrendingConsultantsModel> list = [];
//   bool isLoaded = false;

//   Future<void> trendingConsultantsPostApi() async {
//     list = await TrendingConsultantsRepo().trendingConsultantsRepoPostApi();
//     print("Trending Provider: ${list.length} ");
//     notifyListeners();
//   }

//   // Future<TrendingConsultantsModel?> trendingConsultantsPostApi() async {
//   //   trendingConsultantsModel =
//   //       await TrendingConsultantsRepo().trendingConsultantsRepoPostApi();
//   //   print("trendingConsultantsPostApi Provider" +
//   //       trendingConsultantsModel.toString());

//   //   if (trendingConsultantsModel != null) {
//   //     setIsLoaded(true);
//   //     return trendingConsultantsModel;
//   //   }
//   // }

//   bool getIsLoaded() {
//     return isLoaded;
//   }

//   void setIsLoaded(bool value) {
//     isLoaded = value;
//     notifyListeners();
//   }
// }
