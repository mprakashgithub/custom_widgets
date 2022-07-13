import 'package:clokworx/model/models/specific_date_attendance_model.dart';
import 'package:clokworx/view/app_data/app_colors.dart';
import 'package:clokworx/view/app_data/app_strings.dart';
import 'package:clokworx/view/app_data/app_text_style.dart';
import 'package:clokworx/view/screens/add_note_start_time.dart';
import 'package:clokworx/view/screens/floating_holiday_calendar.dart';
import 'package:clokworx/view/screens/sick_calendar.dart' as sickCalendar;
import 'package:clokworx/view/screens/tour_lobby.dart';
import 'package:clokworx/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppDialogs {
  static Future openStartTourDialog(BuildContext context) {
    // bool? yesPressed = false;
    // bool? cancelPressed = false;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Would you like to start a Tour?",
                    style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          // setState(() {
                          // if (b1Pressed == false) {
                          //   b1Pressed = !b1Pressed!;
                          //   b2Pressed = false;
                          // }
                          // });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const TourLobby())));
                        },
                        child: Text(
                          "Yes",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            // side: const BorderSide(
                            //     color: AppColors.foregroundLight, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            // side: const BorderSide(
                            //     color: AppColors.foregroundLight, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  ///End Dialog
  static Future openEndDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.90,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Are you sure you wish to end?",
                    style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        height: 34,
                        minWidth: 84,
                        onPressed: () {
                          // setState(() {
                          // if (b1Pressed == false) {
                          //   b1Pressed = !b1Pressed!;
                          //   b2Pressed = false;
                          // }
                          // });
                          Navigator.pushNamed(context, AppStrings.bottomNavBar);
                        },
                        child: Text(
                          "Yes",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            // side: const BorderSide(
                            //     color: AppColors.foregroundLight, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      MaterialButton(
                        height: 34,
                        minWidth: 84,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            // side: const BorderSide(
                            //     color: AppColors.foregroundLight, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text("All visitors have exited the main gate",
                      style: AppTextStyle.font18AsapRegularLightGreenTextStyle),
                ],
              ),
            ),
          );
        });
  }

  ///Pin Dialog
  static Future openPinDialog(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    // String currentText = "";
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 250,
              padding: EdgeInsets.all(20),
              child: Center(
                child: PinCodeTextField(
                  length: 4,
                  obscureText: true,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 61,
                      fieldWidth: 63,
                      activeFillColor: Colors.white,
                      selectedFillColor: AppColors.clockingLogTextColor,
                      activeColor: Colors.brown,
                      inactiveFillColor: Colors.white,
                      selectedColor: AppColors.badgeDialogHeader,
                      inactiveColor: AppColors.clockingLogTextColor,
                      disabledColor: AppColors.badgeDialogBg),
                  animationDuration: const Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,

                  enableActiveFill: true,
                  controller: textEditingController,
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  onChanged: (value) {
                    debugPrint(value);
                    // setState(() {
                    //   currentText = value;
                    // });
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
              ),
            ),
          );
        });
  }

  ///Floating Options Dialog for calendar
  static Future openFloatingOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0),
            alignment: Alignment.bottomCenter,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.95,
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  sickCalendar.SickCalendar())));
                    },
                    child: Container(
                      height: 69,
                      width: 69,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.calendarFloatingOptionsBgColor),
                      child: Image.asset(
                        "assets/icons/Sick_Icon_1.png",
                        // fit: BoxFit.fill,HolidayCalendarView
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  FloatingHolidayCalendarView())));
                    },
                    child: Container(
                      height: 69,
                      width: 69,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.calendarFloatingOptionsBgColor),
                      child: Image.asset(
                        "assets/icons/Beach_Access_Icon_1.png",
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: 69,
                    width: 69,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.calendarFloatingOptionsBgColor),
                    child: Image.asset(
                      "assets/icons/Money_Off_Icon_1.png",
                      // fit: BoxFit.fill,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => AddNoteStartTime())));
                    },
                    child: Container(
                      height: 69,
                      width: 69,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.calendarFloatingOptionsBgColor),
                      child: Image.asset(
                        "assets/icons/Create_Icon_1.png",
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  ///User personal To-Do List dialog
  static Future openUserToDoListDialog(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    // String currentText = "";
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 400,
                  // padding: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.badgeDialogBg,
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.dialogEnableColor,
                            borderRadius: BorderRadius.circular(15)),
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 89,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "19",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: AppColors.white),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "February",
                                  style: TextStyle(
                                      fontSize: 20, color: AppColors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "2022",
                                  style: TextStyle(
                                      fontSize: 16, color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 360,
                    left: MediaQuery.of(context).size.width * 0.34,
                    child: InkWell(
                      onTap: () {
                        openUserToDoAddDialog(context);
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(27.5)),
                        child: Icon(
                          Icons.add,
                          size: 50,
                        ),
                      ),
                    )),
              ],
              clipBehavior: Clip.none,
            ),
          );
        });
  }

  ///To-Do: Add
  static Future openUserToDoAddDialog(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    // String currentText = "";
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: 400,
              // padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.badgeDialogBg,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.dialogEnableColor,
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 89,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "19",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: AppColors.white),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "February",
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "2022",
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 114,
                            width: 142,
                            // padding: const EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                boxShadow: kElevationToShadow[4],
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.addCardColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Sick",
                                  style: TextStyle(
                                      fontSize: 15,
                                      shadows: [
                                        Shadow(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          offset: const Offset(0, 3),
                                          blurRadius: 20,
                                        ),
                                      ],
                                      color: AppColors.white),
                                ),
                                SizedBox(
                                    height: 69,
                                    width: 69,
                                    child: Image.asset(
                                      "assets/icons/Sick_Icon_1.png",
                                      fit: BoxFit.contain,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            openHolidayDialog(context);
                          },
                          child: Container(
                            height: 114,
                            width: 142,
                            // padding: const EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                boxShadow: kElevationToShadow[4],
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.addCardColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Holiday",
                                  style: TextStyle(
                                      fontSize: 15,
                                      shadows: [
                                        Shadow(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          offset: const Offset(0, 3),
                                          blurRadius: 20,
                                        ),
                                      ],
                                      color: AppColors.white),
                                ),
                                SizedBox(
                                    height: 69,
                                    width: 69,
                                    child: Image.asset(
                                      "assets/icons/Beach_Access_Icon_1.png",
                                      fit: BoxFit.contain,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 114,
                            width: 142,
                            // padding: const EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                boxShadow: kElevationToShadow[4],
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.addCardColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Unpaid",
                                  style: TextStyle(
                                      fontSize: 15,
                                      shadows: [
                                        Shadow(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          offset: const Offset(0, 3),
                                          blurRadius: 20,
                                        ),
                                      ],
                                      color: AppColors.white),
                                ),
                                SizedBox(
                                    height: 69,
                                    width: 69,
                                    child: Image.asset(
                                      "assets/icons/Money_Off_Icon_1.png",
                                      fit: BoxFit.contain,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            _selectTime(context);
                          },
                          child: Container(
                            height: 114,
                            width: 142,
                            // padding: const EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                boxShadow: kElevationToShadow[4],
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.addCardColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Notes",
                                  style: TextStyle(
                                      fontSize: 15,
                                      shadows: [
                                        Shadow(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          offset: const Offset(0, 3),
                                          blurRadius: 20,
                                        ),
                                      ],
                                      color: AppColors.white),
                                ),
                                SizedBox(
                                    height: 64,
                                    width: 64,
                                    child: Image.asset(
                                      "assets/icons/Create_Icon_1.png",
                                      fit: BoxFit.contain,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }

  ///Holiday Dialog
  static Future openHolidayDialog(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    // String currentText = "";
    final DateRangePickerSelectionMode _selectionMode =
        DateRangePickerSelectionMode.multiRange;
    final DateRangePickerController _controller = DateRangePickerController();
    _controller.view = DateRangePickerView.month;
    _controller.selectedDate = DateTime(2021, 9, 5);
    _controller.selectedRange =
        PickerDateRange(DateTime(2021, 9, 7), DateTime(2021, 9, 11));
    _controller.selectedRanges = <PickerDateRange>[
      PickerDateRange(DateTime.now().subtract(const Duration(days: 4)),
          DateTime.now().add(const Duration(days: 4))),
      PickerDateRange(DateTime.now().add(const Duration(days: 11)),
          DateTime.now().add(const Duration(days: 16)))
    ];
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Positioned(
                  bottom: 425,
                  // child: Text("Select your LAST day of Holiday leave",
                  //     style: TextStyle(color: AppColors.white, fontSize: 16)),
                  child: Text.rich(
                    TextSpan(
                        text: "Select your LAST day of ",
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                        children: <InlineSpan>[
                          TextSpan(
                            text: "Holiday ",
                            style:
                                TextStyle(fontSize: 16, color: AppColors.blue),
                          ),
                          TextSpan(
                            text: "leave",
                            style:
                                TextStyle(fontSize: 16, color: AppColors.white),
                          ),
                        ]),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 400,
                  // padding: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.badgeDialogBg,
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.dialogEnableColor,
                            borderRadius: BorderRadius.circular(15)),
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 89,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "19",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: AppColors.white),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "February",
                                  style: TextStyle(
                                      fontSize: 20, color: AppColors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "2022",
                                  style: TextStyle(
                                      fontSize: 16, color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SfDateRangePicker(
                        controller: _controller,
                        selectionMode: _selectionMode,
                        startRangeSelectionColor: Colors.transparent,
                        endRangeSelectionColor: Colors.transparent,
                        rangeSelectionColor: Colors.transparent,
                        selectionColor: Colors.transparent,
                        selectionShape: DateRangePickerSelectionShape.rectangle,
                        cellBuilder: (BuildContext context,
                            DateRangePickerCellDetails details) {
                          if (_selectionMode ==
                              DateRangePickerSelectionMode.range) {
                            return CustomPaint(
                              painter:
                                  RangeSelection(details.date, _controller),
                              size: Size(
                                  details.bounds.width, details.bounds.height),
                            );
                          } else if (_selectionMode ==
                              DateRangePickerSelectionMode.multiRange) {
                            return CustomPaint(
                              painter: MultiRangeSelection(
                                  details.date, _controller),
                              size: Size(
                                  details.bounds.width, details.bounds.height),
                            );
                          }
                          return CustomPaint(
                            painter: SingleSelection(details.date, _controller),
                            size: Size(
                                details.bounds.width, details.bounds.height),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  ///Finish stock Dialog
  static Future openFinishStockDialog(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    String _selectedUser = '';
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Dialog(
                backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0)), //this right here
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 520,
                  // padding: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.badgeDialogBg,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.yellow,
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: 89,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "19",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: AppColors.white),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "February",
                                    style: TextStyle(
                                        fontSize: 20, color: AppColors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "2022",
                                    style: TextStyle(
                                        fontSize: 16, color: AppColors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CommonWidgets().stockTextFormField(),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            openSpecificDayViewDialog(context);
                          },
                          child: Container(
                            color: AppColors.finishStockCardBgColor,
                            height: 340,
                            margin: EdgeInsets.all(15),
                            child: SingleChildScrollView(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(),
                                  RadioListTile(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    dense: true,
                                    title: Transform.translate(
                                      offset: const Offset(-12, 0),
                                      child: Text(AppStrings.txtMaterials),
                                    ),
                                    value: AppStrings.txtMaterials,
                                    groupValue: _selectedUser,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedUser = value!;
                                      });
                                      print(
                                          "value $value : selected user $_selectedUser");
                                    },
                                  ),
                                  Divider(),
                                  RadioListTile(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    dense: true,
                                    title: Transform.translate(
                                      offset: const Offset(-12, 0),
                                      child: Text(AppStrings.txtPaint),
                                    ),
                                    value: AppStrings.txtPaint,
                                    groupValue: _selectedUser,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedUser = value!;
                                      });
                                      print(
                                          "value $value : selected user $_selectedUser");
                                    },
                                  ),
                                  Divider(),
                                  RadioListTile(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    title: Transform.translate(
                                      offset: const Offset(-12, 0),
                                      child: Text(AppStrings.txtStationary),
                                    ),
                                    dense: true,
                                    value: AppStrings.txtStationary,
                                    groupValue: _selectedUser,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedUser = value!;
                                      });
                                      print(
                                          "value $value : selected user $_selectedUser");
                                    },
                                  ),
                                  Divider(),
                                  RadioListTile(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: -4,
                                    ),
                                    title: Transform.translate(
                                      offset: const Offset(-12, 0),
                                      child: Text(AppStrings.txtTools),
                                    ),
                                    dense: true,
                                    value: AppStrings.txtTools,
                                    groupValue: _selectedUser,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedUser = value!;
                                      });
                                      print(
                                          "value $value : selected user $_selectedUser");
                                    },
                                  ),
                                  Divider(),
                                  RadioListTile(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: -4,
                                    ),
                                    title: Transform.translate(
                                      offset: const Offset(-12, 0),
                                      child:
                                          Text(AppStrings.txtCleaningProducts),
                                    ),
                                    dense: true,
                                    value: AppStrings.txtCleaningProducts,
                                    groupValue: _selectedUser,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedUser = value!;
                                      });
                                      print(
                                          "value $value : selected user $_selectedUser");
                                    },
                                  ),
                                  Divider(),
                                  RadioListTile(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: -4,
                                    ),
                                    title: Transform.translate(
                                      offset: const Offset(-12, 0),
                                      child: Text(AppStrings.txtCelebrate),
                                    ),
                                    dense: true,
                                    value: AppStrings.txtCelebrate,
                                    groupValue: _selectedUser,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedUser = value!;
                                      });
                                      print(
                                          "value $value : selected user $_selectedUser");
                                    },
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  ///Time Picker
  static Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 00, minute: 00),
    );
    // if (picked != null)
    //   setState(() {
    //     selectedTime = picked;
    //     _hour = selectedTime.hour.toString();
    //     _minute = selectedTime.minute.toString();
    //     _time = _hour + ' : ' + _minute;
    //     _timeController.text = _time;
    //     _timeController.text = formatDate(
    //         DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
    //         [hh, ':', nn, " ", am]).toString();
    //   });
  }

  ///Radio Options stock
  static Widget selectStockOptions(BuildContext context) {
    String _selectedUser = '';
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.80,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "You are a :",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Radio<String>(
                    value: 'Mechanic',
                    groupValue: _selectedUser,
                    onChanged: (value) {
                      // setState(() {
                      _selectedUser = value!;
                      // });
                      print("value $value : selected user $_selectedUser");
                    },
                  ),
                  Text("Mechanic")
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Customer',
                    groupValue: _selectedUser,
                    onChanged: (value) {
                      // setState(() {
                      _selectedUser = value!;
                      // });
                      print("value $value : selected user $_selectedUser");
                    },
                  ),
                  Text("Customer")
                ],
              ),
              // Text('Male'),
              // ),
              // ListTile(
              //   leading: Radio<String>(
              //     value: 'female',
              //     groupValue: _selectedUser,
              //     onChanged: (value) {
              //       setState(() {
              //         _selectedUser = value!;
              //       });
              //     },
              //   ),
              //   title: Text('Female'),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  ///schedule this holiday leave
  static Future openScheduleLeaveDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.90,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(TextSpan(
                      // text: AppStrings.txtIAgreeToThe,
                      text: "Are you sure you wish to schedule this ",
                      style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                      children: <InlineSpan>[
                        TextSpan(
                          text: "Holiday ",
                          style:
                              AppTextStyle.font24AsapRegularLightBlueTextStyle,
                        ),
                        TextSpan(
                          text: "leave? ",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                      ])),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        height: 34,
                        minWidth: 84,
                        onPressed: () {
                          Navigator.pop(context);
                          //Call the review snackbar/dialog
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.transparent,
                            content: Container(
                              alignment: Alignment.center,
                              height: 80,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 53,
                                    width: 53,
                                    child: Image.asset(
                                        "assets/icons/Check_Circle_Outline_Icon_3.png"),
                                  ),
                                  Text(
                                    'Your leave request is under review',
                                    style: AppTextStyle
                                        .font18QuicksandBoldWhiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            duration: const Duration(seconds: 2),
                            // margin: EdgeInsets.only(bottom: 60),
                          ));
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppStrings.userPersonalCalenderView,
                              (route) => false);
                        },
                        child: Text(
                          "Yes",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            // side: const BorderSide(
                            //     color: AppColors.foregroundLight, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      MaterialButton(
                        height: 34,
                        minWidth: 84,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            // side: const BorderSide(
                            //     color: AppColors.foregroundLight, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Request leave under review Dialog
  static Future openLeaveUnderReviewDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.90,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("under review"),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Specific Day view
  static Future openSpecificDayViewDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Dialog(
                backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0)), //this right here
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 450,
                  // padding: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.badgeDialogBg,
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.dialogEnableColor,
                            borderRadius: BorderRadius.circular(15)),
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 89,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "19",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: AppColors.white),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "February",
                                  style: TextStyle(
                                      fontSize: 20, color: AppColors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "2022",
                                  style: TextStyle(
                                      fontSize: 16, color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: SfCalendar(
                          view: CalendarView.day,
                          appointmentTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                          // todayHighlightColor: AppColors.white,
                          todayTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                          weekNumberStyle: WeekNumberStyle(
                            backgroundColor: Colors.blue,
                            textStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          showCurrentTimeIndicator: true,
                          cellBorderColor: AppColors.badgeDialogBg,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  ///Confirmation dialog
  static Future openConfirmationDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.90,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                        text: "Are you sure you wish to submit this ",
                        style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        children: <InlineSpan>[
                          TextSpan(
                            text: "sick ",
                            style:
                                AppTextStyle.font24AsapRegularYellowTextStyle,
                          ),
                          TextSpan(
                            text: "leave",
                            style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        height: 34,
                        minWidth: 84,
                        onPressed: () {
                          // setState(() {
                          // if (b1Pressed == false) {
                          //   b1Pressed = !b1Pressed!;
                          //   b2Pressed = false;
                          // }
                          // });
                          Navigator.pop(context);
                          openLeaveRequestUnderReviewDialog(context);
                        },
                        child: Text(
                          "Yes",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            // side: const BorderSide(
                            //     color: AppColors.foregroundLight, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      MaterialButton(
                        height: 34,
                        minWidth: 84,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            // side: const BorderSide(
                            //     color: AppColors.foregroundLight, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  ///Leave request under review
  static Future openLeaveRequestUnderReviewDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.90,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 53,
                      width: 53,
                      child: Image.asset(
                          "assets/icons/Check_Circle_Outline_Icon_3.png")),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Your leave request is under review",
                    style: AppTextStyle.font18QuicksandBoldWhiteTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }

  ///Specific Date Attendance
  static Future openSpecificDateAttendanceDialog(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    // String currentText = "";
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: 400,
              // padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.badgeDialogBg,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.purpleColor,
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 89,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "22",
                          style: AppTextStyle.font60AsapRegularWhiteTextStyle,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "February",
                              style:
                                  AppTextStyle.font24AsapRegularWhiteTextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "2022",
                              style:
                                  AppTextStyle.font18AsapRegularWhiteTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: ListView.builder(
                          itemCount: specificAttendanceDataModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: specificAttendanceDataModel[index]
                                          .widget),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.60,
                                    child: Text(
                                        specificAttendanceDataModel[index]
                                            .userAttendanceDetails
                                            .toString(),
                                        style: AppTextStyle
                                            .font18OpenSansExtraBoldUnderlinePurpleTextStyle),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Credit voucher dialog
  static Future openCreditVoucherDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.90,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Credit this voucher?",
                    style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        height: 34,
                        minWidth: 84,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Yes",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      MaterialButton(
                        height: 34,
                        minWidth: 84,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Create site
  static Future openCreateSiteDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.backgroundDark.withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.90,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Create Site?",
                    style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        height: 34,
                        minWidth: 84,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Yes",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      MaterialButton(
                        height: 34,
                        minWidth: 84,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: AppTextStyle.font24AsapRegularWhiteTextStyle,
                        ),
                        color: AppColors.dialogDesableColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  ///Add workers Dialog
  static Future openAddWorkersDialog(
      BuildContext context, double? height, double? width) async {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height! * 0.60,
            // margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: SizedBox.expand(
                child: Container(
              margin: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Select Workers"),
                  Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: AppColors.profileClipBg,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      // controller: searchController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {},
                      cursorColor: Colors.orange[200],

                      decoration: InputDecoration(
                        hintText: AppStrings.txtSiteSearch,
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        hintStyle: const TextStyle(
                            textBaseline: TextBaseline.ideographic,
                            color: AppColors.searchHintTextColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.qr_code_scanner),
                              Text(
                                  AppStrings.txtActiveOvertime) //Scan a receipt
                            ],
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              AppColors.blue,
                              Colors.blue.shade900,
                            ]),
                          ),
                          height: 60,
                          width: width! * 80,
                          child: Center(
                            child: Text(
                              AppStrings.txtAdd,
                              // "Effectuer une reservation"
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            )),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }
}
