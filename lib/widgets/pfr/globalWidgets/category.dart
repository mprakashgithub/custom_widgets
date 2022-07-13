import 'package:app/provider/project_provider.dart';
import 'package:app/repository/common_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:app/constant.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:app/model/category.dart';
import 'package:app/provider/create_project_provider.dart';
import 'package:app/repository/explore_repository.dart';
import 'package:app/screens/create_project/components/custom_app_bar.dart';
import 'package:app/screens/create_project/create_final.dart';

class SelectCategory extends StatefulWidget {
  final fromSetting;

  SelectCategory({Key? key, this.fromSetting = false}) : super(key: key);

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  void setCategory(ProjectCategory category) {
    final CreateProjectProvider projectProvider = context.read<CreateProjectProvider>();

    projectProvider.setCategory(category);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateProjectFinal(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<CreateProjectProvider>(
      builder: (context, CreateProjectProvider createProjectProvider, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(LocaleKeys.categorySetting.tr(),
                style: AppText.m20.copyWith(fontWeight: FontWeight.w600)),
            centerTitle: true,
            leading: CustomBackButton(),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "OK",
                  style: AppText.m18.copyWith(color: colorScheme.secondary),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              top: false,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.sq28,
                    // widget.fromSetting
                    //     ? Text(
                    //         LocaleKeys.exploreTheCategoriesYouInterestedIn.tr(),
                    //         style: AppText.m20,
                    //       )
                    //     : Container(),
                    // if (widget.fromSetting) AppSpacing.sq28,
                    ...buildGroupedCategory(context, createProjectProvider),
                    Text(
                      LocaleKeys.otherReport.tr(),
                      style: AppText.r16,
                    ),
                    widget.fromSetting
                        ? InkWell(
                            onTap: () => setCategory(ProjectCategory.etc),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 13),
                              decoration: BoxDecoration(
                                  color: colorScheme.background,
                                  border: Border.all(
                                      color: colorScheme.secondaryVariant, width: 1),
                                  borderRadius: BorderRadius.circular(13)),
                              child: Text(
                                LocaleKeys.addNewCategory.tr(),
                                style: AppText.r16,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              createProjectProvider
                                  .updateSelectedCategory(ProjectCategory.etc);
                              createProjectProvider
                                  .updateOnScreenCategory(ProjectCategory.etc);
                              createProjectProvider.updateIsAllSelectCat(false);
                              ExploreRepository.pagingController.refresh();
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                  color: createProjectProvider.selectedCategory
                                          .contains(ProjectCategory.etc)
                                      ? colorScheme.secondary
                                      : colorScheme.background,
                                  borderRadius: BorderRadius.circular(13),
                                  border:
                                      Border.all(color: colorScheme.secondaryVariant)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "?",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    " ${createProjectProvider.groupList.last.label}",
                                    style: AppText.m16.copyWith(
                                        color: createProjectProvider.selectedCategory
                                                .contains(ProjectCategory.etc)
                                            ? colorScheme.onSecondary
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    AppSpacing.sq16,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildGroupedCategory(
      BuildContext context, CreateProjectProvider provider) {
    final categoryGroups = provider.groupList;
    final categories = provider.categoryList;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return List.generate(
      categoryGroups.length,
      (index) {
        final groupInfo = categoryGroups[index];
        final childCategories =
            categories.where((cate) => cate.gid == groupInfo.id).toList();
        return Consumer<ProjectProvider>(
          builder: (context, projectProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (childCategories.isNotEmpty)
                  Text(
                    groupInfo.fullLabel,
                    style: AppText.m18,
                  ),
                const SizedBox(height: 10),
                Wrap(
                  children: List.generate(
                    childCategories.length,
                    (i) => Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 8),
                      child: InkWell(
                        onTap: () {
                          if (widget.fromSetting) {
                            projectProvider.setCurrentProjectCategory(childCategories[i]);
                            CommonRepository.categoryController.text =
                                childCategories[i].label;
                            Navigator.pop(context);
                          } else {
                            provider.updateSelectedCategory(childCategories[i]);
                            provider.updateOnScreenCategory(childCategories[i]);
                            provider.updateIsAllSelectCat(false);
                            ExploreRepository.pagingController.refresh();
                          }
                        },
                        child: Container(
                          // height: 40,
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.etcTextFieldLine,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: widget.fromSetting
                                ? colorScheme.background
                                : provider.selectedCategory.contains(childCategories[i])
                                    ? colorScheme.secondary
                                    : colorScheme.background,
                          ),
                          child: Column(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              childCategories[i].fullLabel,
                              style: AppText.m16.copyWith(
                                  color: widget.fromSetting
                                      ? Colors.black
                                      : provider.selectedCategory
                                              .contains(childCategories[i])
                                          ? colorScheme.onSecondary
                                          : Colors.black),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4)
              ],
            );
          },
        );
      },
    );
  }
}
