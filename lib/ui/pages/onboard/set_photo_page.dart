import 'dart:io';

import 'package:amora_mobile_app/ui/widgets/scaffold/onboard_scaffold.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotosPage extends StatefulWidget {
  const UploadPhotosPage({super.key});

  @override
  State<UploadPhotosPage> createState() => _UploadPhotosPageState();
}

class _UploadPhotosPageState extends State<UploadPhotosPage> {
  final ImagePicker _imagePicker = ImagePicker();

  final List<XFile?> _imageFileList = [];

  void selectImages({int index = 0}) async {
    // select all images at first time
    List<XFile> selectedImages = await _imagePicker.pickMultiImage();

    if (_imageFileList.isEmpty || _imageFileList.length < 6) {
      setState(() {
        _imageFileList.addAll(selectedImages);
      });
    } else if (_imageFileList.length == 6) {
      setState(() {
        _imageFileList.clear();
        _imageFileList.addAll(selectedImages);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnboardScaffoldPage(
        continueCallback: () {},
        title: "Upload Your Photo",
        description: "We'd love to see you. Upload a photo for your journey",
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: AddPhotoButton(
                          onPressed: selectImages,
                          imagePath: _imageFileList.isNotEmpty
                              ? _imageFileList[0]?.path
                              : null),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Flexible(
                            child: AddPhotoButton(
                              onPressed: selectImages,
                              imagePath: _imageFileList.isNotEmpty &&
                                      _imageFileList.length >= 2
                                  ? _imageFileList[1]?.path
                                  : null,
                            ),
                          ),
                          Flexible(
                            child: AddPhotoButton(
                              onPressed: selectImages,
                              imagePath: _imageFileList.isNotEmpty &&
                                      _imageFileList.length >= 3
                                  ? _imageFileList[2]?.path
                                  : null,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(
                  children: [
                    Flexible(
                      child: AddPhotoButton(
                        onPressed: selectImages,
                        imagePath: _imageFileList.isNotEmpty &&
                                _imageFileList.length >= 4
                            ? _imageFileList[3]?.path
                            : null,
                      ),
                    ),
                    Flexible(
                      child: AddPhotoButton(
                        onPressed: selectImages,
                        imagePath: _imageFileList.isNotEmpty &&
                                _imageFileList.length >= 5
                            ? _imageFileList[4]?.path
                            : null,
                      ),
                    ),
                    Flexible(
                      child: AddPhotoButton(
                        onPressed: selectImages,
                        imagePath: _imageFileList.isNotEmpty &&
                                _imageFileList.length >= 6
                            ? _imageFileList[5]?.path
                            : null,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class AddPhotoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? imagePath;

  const AddPhotoButton({
    super.key,
    required this.onPressed,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          margin: const EdgeInsets.all(5),
          child: imagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    File(imagePath!),
                    fit: BoxFit.cover,
                    height: double.maxFinite,
                  ),
                )
              : DottedBorder(
                  color: Theme.of(context).primaryColor,
                  dashPattern: const [5, 5, 5, 5],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(20),
                  borderPadding: EdgeInsets.zero,
                  child: Center(
                    child: SvgPicture.asset("assets/add_photo_icon.svg"),
                  ),
                ),
        ),
      ),
    );
  }
}


// DottedBorder(
//           color: Theme.of(context).primaryColor,
//           dashPattern: const [5, 5, 5, 5],
//           borderType: BorderType.RRect,
//           radius: const Radius.circular(12),
//           padding: EdgeInsets.all(size),
//           child: Container(
//             height: size,
//             width: size,
//             color: Colors.white,
//             child: SvgPicture.asset(
//               "assets/add_photo_icon.svg",
//               fit: BoxFit.cover,
//             ),
//           ),
//         )