import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileLayout extends StatelessWidget {
  static const headerImgHeight = 200.0;
  static const circleSize = 124.0;
  static const boxSize = 60.0;

  final List<ProjectViewData> projects;
  final ScrollController scrollController;
  final Widget? headerBgChild;
  final Widget? child;
  final void Function(Project? project)? onTapProject;
  final void Function()? onTapCurrentProfileImage;

  const ProfileLayout({
    Key? key,
    required this.projects,
    required this.scrollController,
    this.child,
    this.headerBgChild,
    this.onTapProject,
    this.onTapCurrentProfileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      controller: scrollController,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          buildBodyHeader(context),
          buildBody(context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget buildBodyHeader(BuildContext context) {
    final _circleSize = circleSize;
    final _boxSize = boxSize;

    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                Container(
                  // headerImage
                  width: double.infinity,
                  height: headerImgHeight,
                  color: Colors.grey[200],
                  child: headerBgChild,
                ),
                Container(
                  // empty space for avatar center
                  height: _circleSize / 2,
                  // color: Colors.purple,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              child: Row(
                children: [
                  SizedBox(width: 16),
                  if (projects.isNotEmpty)
                    InkWell(
                      onTap: onTapCurrentProfileImage,
                      child: AvatarBigCircle(
                        image: projects[0].profileImage,
                        size: _circleSize,
                        emoji: projects[0].emoji,
                      ),
                    ),
                  SizedBox(width: 16),
                  if (projects.length > 1)
                    InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        if (onTapProject != null) {
                          onTapProject!(projects[1].data);
                        }
                      },
                      child: AvatarRect(
                        image: projects[1].profileImage,
                        size: _boxSize,
                        markNew: projects[1].hasNew,
                      ),
                    ),
                  SizedBox(width: 16),
                  if (projects.length > 2)
                    InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        if (onTapProject != null) {
                          onTapProject!(projects[2].data);
                        }
                      },
                      child: AvatarRect(
                        image: projects[2].profileImage,
                        size: _boxSize,
                        markNew: projects[2].hasNew,
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final crntProject =
        projects.length > 0 ? projects[0] : ProjectViewData.dummy;

    return Consumer<ProjectProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.all(16),
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  crntProject.data != null
                      ? !crntProject.data!.isPublic
                          ? SvgPicture.asset('assets/svg/Lock.svg')
                          : Container()
                      : Container(),
                  Text(
                    crntProject.name,
                    style: const TextStyle(
                      color: AppColor.textMain,
                      fontSize: 18,
                      height: 1.44,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              AppSpacing.sq8,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    crntProject.categoryDetail.isEmpty
                        ? "${provider.selectedCatLabel}"
                        : "${crntProject.categoryDetail}",
                    style: const TextStyle(
                      color: AppColor.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppSpacing.sq8,
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.grey, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                      child: Text(
                        "${crntProject.dDayText}",
                        style: const TextStyle(
                          color: AppColor.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              AppSpacing.sq4,
              ReadMoreText(
                crntProject.desc,
                trimLines: 3,
                colorClickableText: const Color(0xff888888),
                trimMode: TrimMode.Line,
                trimCollapsedText: ' 더보기',
                trimExpandedText: '접기',
                delimiter: '',
                style: const TextStyle(
                  color: AppColor.textMain,
                  fontSize: 14,
                  height: 1.57,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AvatarBigCircle extends StatelessWidget {
  final double size;
  final String? emoji;
  final ImageProvider image;

  const AvatarBigCircle({
    Key? key,
    this.size = 100,
    this.emoji,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 12),
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image(image: this.image, fit: BoxFit.cover),
              ),
            ),
          ),
          if (emoji != null && emoji != '')
            Positioned(
              left: size - 22,
              child: Container(
                width: 38,
                height: 40,
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/icon/bubble_icon.png').image,
                  ),
                ),
                child: Center(
                  child: Text(emoji!, style: TextStyle()),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class AvatarRect extends StatelessWidget {
  final double size;
  final ImageProvider image;
  final bool markNew;

  const AvatarRect({
    Key? key,
    required this.size,
    this.markNew = false,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 3),
              blurRadius: 3,
            )
          ]),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(size / 2.5),
                color: Colors.grey[200],
                image: DecorationImage(
                  image: this.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (markNew)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: size / 5,
                height: size / 5,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            )
        ],
      ),
    );
  }
}
