import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_buttom.dart';

class PendingPhotoUpload extends StatefulWidget {
  final String? lId, lName, vDate, applicantId, applicantname;

  const PendingPhotoUpload(
      {Key? key,
      this.lId,
      this.lName,
      this.vDate,
      this.applicantId,
      this.applicantname})
      : super(key: key);

  @override
  State<PendingPhotoUpload> createState() => _PendingPhotoUploadState();
}

class _PendingPhotoUploadState extends State<PendingPhotoUpload> {
  double? _height, _width;
  File? image;

  List photos = [
    {"name": "Photo 1", "image_base64": "", "image_name": ""},
    {"name": "Photo 2", "image_base64": "", "image_name": ""},
    {"name": "Photo 3", "image_base64": "", "image_name": ""},
    {"name": "Photo 4", "image_base64": "", "image_name": ""},
    {"name": "Photo 5", "image_base64": "", "image_name": ""},
    {"name": "Photo 6", "image_base64": "", "image_name": ""},
    {"name": "Photo 7", "image_base64": "", "image_name": ""},
    {"name": "Photo 8", "image_base64": "", "image_name": ""},
    {"name": "Photo 9", "image_base64": "", "image_name": ""},
    {"name": "Photo 10", "image_base64": "", "image_name": ""},
    {"name": "Photo 11", "image_base64": "", "image_name": ""},
    {"name": "Photo 12", "image_base64": "", "image_name": ""}
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.txtLECPhotoUpload,
          style: AppTextStyle.font12OpenSansBoldOrangeTextStyle,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            )),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // height: _height,
          width: _width,
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                elevation: 8,
                color: AppColors.lightGreen,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  // color: AppColors.appGrey,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${AppStrings.txtLocationID}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${AppStrings.txtLocationName}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${AppStrings.txtLECVisitDate}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${AppStrings.txtApplicantID}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${AppStrings.txtApplicantName}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.lId}",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${widget.lName}",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${widget.vDate}",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${widget.applicantId}",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${widget.applicantname}",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              photoUpload(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
            buttonColor: AppColors.orange,
            onClick: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ReportUpload(
                            lId: widget.lId,
                            lName: widget.lName,
                            vDate: widget.vDate,
                            applicantId: widget.applicantId,
                            applicantname: widget.applicantname,
                          ))));
            },
            text: Text(
              AppStrings.txtSubmit,
              style: AppTextStyle.font14OpenSansBoldWhiteTextStyle,
            )),
      ),
    ));
  }

  Widget photoUpload() {
    return SizedBox(
      height: _height! * .55,
      child: ListView.builder(
          itemCount: photos.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: Text(photos[index]['name']),
              title: Container(
                height: 50,
                width: 30,
                color: AppColors.appGrey.withOpacity(0.9),
                padding: const EdgeInsets.all(10),
                child: Text(
                  photos[index]['image_name'].toString(),
                  style: AppTextStyle.font8OpenSansRegularBlackTextStyle,
                ),
              ),
              trailing: CustomButton(
                buttonColor: AppColors.orange,
                onClick: () {
                  // getCurrentLocation();
                  getLocation();
                  openBottomSheet(context, index);
                },
                text: Text(
                  AppStrings.txtUpload,
                  style: AppTextStyle.font14OpenSansRegularWhiteTextStyle,
                ),
                buttonHeight: 30,
                buttonWidth: 100,
              ),
            );
          })),
    );
  }

  Future openBottomSheet(BuildContext context, index) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(AppStrings.txtPleaseChooseMode),
                CustomButton(
                    onClick: () {
                      pickImage(ImageSource.camera, index);
                    },
                    buttonHeight: 40,
                    text: const Text(AppStrings.txtCamera)),
                CustomButton(
                    onClick: () {
                      pickImage(ImageSource.gallery, index);
                    },
                    buttonHeight: 40,
                    text: const Text(AppStrings.txtGallery)),
              ],
            ),
          ),
        );
      },
    );
  }

  Future pickImage(ImageSource src, index) async {
    try {
      final image = await ImagePicker().pickImage(source: src);
      if (image == null) return;
      final imageTemp = File(image.path);

      photos[index]['image_base64'] = imageTemp.toString();
      if (src == ImageSource.camera) {
        photos[index]['image_name'] = image.path.split("-").last;
      } else {
        photos[index]['image_name'] = image.path.split("/").last;
      }

      setState(() {});
      Navigator.pop(context);
      // setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  // Future<void> getCurrentLocation() async {
  // Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high);
  // double lat = position.latitude;
  // double long = position.longitude;
  // print("Latitude: $lat and Longitude: $long");
  // }
  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    debugPrint("-------------Position-----------------");
    debugPrint(position.latitude.toString());
    double lat = position.latitude;
    double long = position.longitude;
    debugPrint("Latitude: $lat and Longitude: $long");

    debugPrint(position.toString());
  }
}
