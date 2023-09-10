import 'dart:io';
import 'package:celebrare/constants/constants.dart';
import 'package:celebrare/presentation/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerContainer extends StatefulWidget {
  const ImagePickerContainer({super.key});

  @override
  State<ImagePickerContainer> createState() => _ImagePickerContainerState();
}

class _ImagePickerContainerState extends State<ImagePickerContainer> {
  File? image; //for saving picked image
  CroppedFile? croppedImg; // for saving cropped image
  Widget? finalImage; //for saving final image with frame or without it

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Choose image container
        Container(
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text
              Text(
                "Upload Image",
                style: Constants.getFont(fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),

              //choose image button
              ElevatedButton(
                  onPressed: pickImage, child: const Text("Choose From Device"))
            ],
          ),
        ),

        //show image only when image is picked,cropped and frame is selected
        image == null || finalImage == null
            ? Container() // else show blank container
            : Container(
                margin: const EdgeInsets.only(top: 30),
                height: 450,
                width: double.infinity,
                child: finalImage,
              ),
      ],
    );
  }

  //method for picking image using image_picker package
  void pickImage() async {
    final pickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImg == null) {
      return;
    }

    await cropImage(pickedImg);
  }

  //method for picking image using image_cropper package
  Future<void> cropImage(XFile imagePath) async {
    final tempCroppedImg = await ImageCropper().cropImage(
      sourcePath: imagePath.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );
    if (tempCroppedImg == null) {
      return;
    }
    image = File(tempCroppedImg.path);
    await showFrameDialog();
  }

  //Getting data from dialog widget after user chooses a frame and taps on use this image button
  Future<void> showFrameDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          image: image,
        );
      },
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        finalImage = value;
      });
    });
  }
}
