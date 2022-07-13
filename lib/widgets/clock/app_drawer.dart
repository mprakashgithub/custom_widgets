// import 'package:clokworx/view/app_data/app_colors.dart';
// import 'package:clokworx/view/app_data/app_strings.dart';
// import 'package:clokworx/view/app_data/app_text_style.dart';
// import 'package:flutter/material.dart';

// class AppDrawer extends StatefulWidget {
//   const AppDrawer({Key? key}) : super(key: key);

//   @override
//   State<AppDrawer> createState() => _AppDrawerState();
// }

// class _AppDrawerState extends State<AppDrawer> {
//   bool _switchValue = true;
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: AppColors.backgroundDark,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             padding: const EdgeInsets.all(0),
//             child: Container(
//               color: AppColors.backgroundDark,
//               // width: _width! * 0.90,
//               // height: 100,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                       height: 25,
//                       width: 25,
//                       margin: const EdgeInsets.only(left: 20, bottom: 5),
//                       child: Image.asset("assets/icons/Reply_Icon_7.png")),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       SizedBox(
//                         // width: 180,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "Jenifer Evans",
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: AppColors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Row(
//                               children: const [
//                                 SizedBox(
//                                   width: 30,
//                                 ),
//                                 Text(
//                                   AppStrings.txtDistrictManager,
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       color: AppColors.bottomBarCardsColor,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 84,
//                         width: 84,
//                         decoration: BoxDecoration(
//                             color: AppColors.circleClipBg,
//                             borderRadius: BorderRadius.circular(42)),
//                         child: Center(
//                             child: Text(
//                           "JE",
//                           style: AppTextStyle
//                               .font36OpenSansExtraboldLightGreenTextStyle,
//                           // style: TextStyle(
//                           //   fontSize: 20,
//                           //   color: AppColors.bottomBarCardsColor,
//                           //   fontWeight: FontWeight.bold,
//                           //   shadows: [
//                           //     Shadow(
//                           //       color:
//                           //           AppColors.whiteTextShadow.withOpacity(1.0),
//                           //       offset: const Offset(0, 3),
//                           //       blurRadius: 20,
//                           //     ),
//                           //   ],
//                           // ),
//                         )),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             decoration: const BoxDecoration(
//               color: Colors.blue,
//             ),
//           ),
//           Container(
//             alignment: Alignment.centerLeft,
//             padding: const EdgeInsets.only(left: 20),
//             child: const Text(
//               AppStrings.txtProfile,
//               style: TextStyle(
//                   fontSize: 20,
//                   color: AppColors.appGray,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(left: 30),
//             child: Column(
//               children: [
//                 ListTile(
//                   leading: const Icon(
//                     Icons.person,
//                     color: AppColors.bottomBarCardsColor,
//                   ),
//                   title: Text(
//                     AppStrings.txtPersonalDetails,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: AppColors.white,
//                         shadows: [
//                           Shadow(
//                             color: AppColors.textShadow.withOpacity(1.0),
//                             offset: const Offset(0, 3),
//                             blurRadius: 20,
//                           ),
//                         ],
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   leading: SizedBox(
//                     height: 22,
//                     width: 22,
//                     child: Image.asset(
//                       "assets/icons/Account_Balance_Wallet_Icon_4.png",
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   // leading: const Icon(
//                   //   Icons.account_balance_wallet_outlined,
//                   //   color: AppColors.bottomBarCardsColor,
//                   // ),
//                   title: Text(
//                     AppStrings.txtWallet,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: AppColors.white,
//                         shadows: [
//                           Shadow(
//                             color: AppColors.textShadow.withOpacity(1.0),
//                             offset: const Offset(0, 3),
//                             blurRadius: 20,
//                           ),
//                         ],
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   leading: const Icon(
//                     Icons.assignment,
//                     color: AppColors.bottomBarCardsColor,
//                   ),
//                   title: Text(
//                     AppStrings.txtDocuments,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: AppColors.white,
//                         shadows: [
//                           Shadow(
//                             color: AppColors.textShadow.withOpacity(1.0),
//                             offset: const Offset(0, 3),
//                             blurRadius: 20,
//                           ),
//                         ],
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   leading: const Icon(
//                     Icons.key,
//                     color: AppColors.bottomBarCardsColor,
//                   ),
//                   title: Text(
//                     AppStrings.txtChangePin,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: AppColors.white,
//                         shadows: [
//                           Shadow(
//                             color: AppColors.textShadow.withOpacity(1.0),
//                             offset: const Offset(0, 3),
//                             blurRadius: 20,
//                           ),
//                         ],
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   leading: const Icon(
//                     Icons.fingerprint,
//                     color: AppColors.bottomBarCardsColor,
//                   ),
//                   title: Text(
//                     AppStrings.txtUseBiometrics,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: AppColors.white,
//                         shadows: [
//                           Shadow(
//                             color: AppColors.textShadow.withOpacity(1.0),
//                             offset: const Offset(0, 3),
//                             blurRadius: 20,
//                           ),
//                         ],
//                         fontWeight: FontWeight.bold),
//                   ),
//                   trailing: SizedBox(
//                     height: 20,
//                     width: 60,
//                     child: Switch(
//                       value: _switchValue,
//                       activeColor: AppColors.bottomBarCardsColor,
//                       onChanged: (value) {
//                         setState(() {
//                           _switchValue = value;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   leading: SizedBox(
//                     height: 22,
//                     width: 22,
//                     child: Image.asset(
//                       "assets/icons/Security_Icon_3.png",
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   // leading: const Icon(
//                   //   Icons.help_outline,
//                   //   color: AppColors.bottomBarCardsColor,
//                   // ),
//                   title: Text(
//                     AppStrings.txtPrivacyAndSecurity,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: AppColors.white,
//                         shadows: [
//                           Shadow(
//                             color: AppColors.textShadow.withOpacity(1.0),
//                             offset: const Offset(0, 3),
//                             blurRadius: 20,
//                           ),
//                         ],
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   leading: const Icon(
//                     Icons.help_outline,
//                     color: AppColors.bottomBarCardsColor,
//                   ),
//                   title: Text(
//                     AppStrings.txtHelp,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: AppColors.white,
//                         shadows: [
//                           Shadow(
//                             color: AppColors.textShadow.withOpacity(1.0),
//                             offset: const Offset(0, 3),
//                             blurRadius: 20,
//                           ),
//                         ],
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
