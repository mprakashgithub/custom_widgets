import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergohylogistics/appWidgets/AppText.dart';
import 'package:fluttergohylogistics/helper/AppColors.dart';
import 'package:fluttergohylogistics/helper/AppConstants.dart';


enum DrawerSelection { home, stock, employee, settings}



class MyDrawerClass extends StatefulWidget{

//  final drawerItems = [
//    new DrawerItem(AppConstants.drawerHome, Icons.home),
//    new DrawerItem(AppConstants.drawerStock, Icons.scanner),
//    new DrawerItem(AppConstants.drawerEmployee, Icons.person),
//    new DrawerItem(AppConstants.drawerSetting, Icons.settings),
//    new DrawerItem(AppConstants.drawerLogout, Icons.exit_to_app),
//  ];


//  @override
//  Widget build(BuildContext context) {
//context=context;
//   return Drawer(
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: <Widget>[
//         createDrawerHeader(),
//         createDrawerBodyItem(
//             icon: Icons.home,text: AppConstants.drawerHome, onTap: () =>
//              Navigator.pushNamed(context, AppConstants.homeScreen)),
//         createDrawerBodyItem(
//             icon: Icons.scanner,text: AppConstants.drawerStock,onTap: () =>
//             Navigator.pushNamed(context, AppConstants.stockScreen)),
//         createDrawerBodyItem(
//             icon:  Icons.person,text:AppConstants.drawerEmployee,onTap: () =>
//             Navigator.pushNamed(context, AppConstants.drawerEmployee)),
//         createDrawerBodyItem(
//             icon: Icons.settings,text: AppConstants.drawerSetting,onTap: () =>
//             Navigator.pushNamed(context, AppConstants.homeScreen)),
//         createDrawerBodyItem(
//             icon: Icons.exit_to_app,text: AppConstants.drawerLogout,onTap: () =>
//             Navigator.pushNamed(context, AppConstants.homeScreen)),
//       ],
//     ),
//   );
//  }




  @override
  State<StatefulWidget> createState() {

   return MyDrawerState();
  }

}
class MyDrawerState extends State<MyDrawerClass>{
  DrawerSelection _drawerSelection = DrawerSelection.home;
  bool flag=false;
  BuildContext context;
  int itemSelected=-1;
  var availableList = ["Disponsible", "Absent", "Inconnu"];
  String avalue = "Disponsible";
  List<Color> colors = [
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.pinkAccent,
    Colors.amberAccent[200],
    Colors.teal[200],
    Colors.deepOrange[200]
  ];
  String warehouse = "",username="";



  Widget createDrawerHeader() {
    return
      DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.white,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Container(
                width: 80.0,
                height: 100.0,
                padding: EdgeInsets.all(1.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.colorPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Image.asset('assets/images/img.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      AppText(
                        text: username != null ? username : "",
                        textColor: AppColors.colorPrimaryDark,
                        fontSize: 16.0,
                        margin: EdgeInsets.only(top: 5.0, left: 10.0),
                      ),
                      //  showReFreshButton(),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, left: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: AppColors.colorPrimary,
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: DropdownButton(
                      focusColor: AppColors.white,
                      dropdownColor: AppColors.white_80,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.colorPrimaryDark,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: AppColors.white),
                      underline: Container(),
                      items: availableList.map((String value) {
                        return DropdownMenuItem<String>(
                          child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: AppText(
                                  text: value,
                                  textColor:
                                  colors[availableList.length - 1],
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300)),
                          value: value,
                        );
                      }).toList(),
                      value: avalue,
                      onChanged: (String newValueSelected) {
                        // Your code to execute, when a menu item is selected from

                        setState(() {
                          avalue = newValueSelected;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ));
  }


  Widget createDrawerBodyItem(
      {IconData icon, String text, GestureTapCallback onTap}) {

    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon,
          color:flag?AppColors.colorPrimary:AppColors.black,),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap:(){
        setState(() {
          flag=true;
        });
        onTap;
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    context=context;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
              icon: Icons.home,text: AppConstants.drawerHome, onTap: () {

              Navigator.pushNamed(context, AppConstants.homeScreen);}),

          ListTile(
            selected: _drawerSelection == DrawerSelection.home,
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _drawerSelection = DrawerSelection.home;
//                _currentWidget = MainWidget();
//                _appBarTitle = Text("Home");
              });
            },
          ),
          ListTile(
            selected: _drawerSelection == DrawerSelection.employee,
            title: Text(AppConstants.drawerEmployee),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _drawerSelection = DrawerSelection.employee;
//                _currentWidget = MainWidget();
//                _appBarTitle = Text("Home");
              });
            },
          ),
//          createDrawerBodyItem(
//              icon: Icons.scanner,text: AppConstants.drawerStock,onTap: () {
//              Navigator.pushNamed(context, AppConstants.stockScreen);}),
          createDrawerBodyItem(
              icon:  Icons.person,text:AppConstants.drawerEmployee,onTap: () =>
              Navigator.pushNamed(context, AppConstants.employeeScreen)),
          createDrawerBodyItem(
              icon: Icons.settings,text: AppConstants.drawerSetting,onTap: () =>
              Navigator.pushNamed(context, AppConstants.languageSelectionScreen)),
          createDrawerBodyItem(
              icon: Icons.exit_to_app,text: AppConstants.drawerLogout,onTap: () =>
              Navigator.pushNamed(context, AppConstants.logoutScreen)),
        ],
      ),
    );
  }

}
