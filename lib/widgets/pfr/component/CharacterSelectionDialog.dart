import 'package:app/interfaces/OnCharacterChangeListener.dart';
import 'package:app/model/project.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CharacterSelectionDialog {
  /// CREATING SINGLETON PATTERN
  static CharacterSelectionDialog _instance =
      new CharacterSelectionDialog.internal();

  CharacterSelectionDialog.internal();

  factory CharacterSelectionDialog() => _instance;

  static showCharacterChangeDialog(
      BuildContext context, OnCharacterChangeListener characterChangeListener) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// DIALOG HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Change character",
                        style: TextStyle(fontSize: 20, color: AppColor.black),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.clear,
                          color: AppColor.black,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),

                  AppSpacing.sq24,

                  /// CHARACTERS LIST
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, position) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.etcBgDivider),
                              borderRadius: BorderRadius.circular(4)),
                          child: InkWell(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset(
                                    "assets/icon/profile_icon.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                AppSpacing.sq8,
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "User",
                                      style: TextStyle(
                                          fontSize: 16, color: AppColor.black),
                                    ),
                                    Text(
                                      "Category (20 days)",
                                      style: TextStyle(
                                          fontSize: 14, color: AppColor.grey),
                                    )
                                  ],
                                ))
                              ],
                            ),
                            onTap: () {
                              characterChangeListener.selectedCharacter(Project(
                                  userId: "", id: "", categoryId: 0, name: ''));
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                      itemCount: 3,
                    ),
                  )
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
          );
        });
  }
}
