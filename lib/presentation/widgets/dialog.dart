import 'dart:io';

import 'package:celebrare/constants/constants.dart';
import 'package:celebrare/presentation/widgets/frames.dart';
import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../constants/enums.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({super.key, this.image});

  final File? image; //getting the cropped image
  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  String? maskImagePath; //defining the frames/mask image path
  @override
  Widget build(BuildContext context) {
    //widget that shows the final image
    Widget finalImage = maskImagePath == null
        ? Image.file(widget
            .image!) //if the mask path is null then original image is selected
        : WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            mask: Image.file(
              widget.image!,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            child: Image.asset(
              maskImagePath!,
            ),
          );

    //Dialog widget which shows text,image,mask options and submit button
    return Dialog(
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          //close button
          Positioned(
              top: 10,
              right: 10,
              child: IconButton.filled(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close))),

          //image preview
          Container(
            height: 380,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Uploaded Image",
                  style: Constants.getFont(fontSize: 18),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.only(top: 5),
                  child: finalImage,
                ),

                //Mask options
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Original Image option
                    InkWell(
                      onTap: () {
                        setState(() {
                          maskImagePath = getFramePath[Frames.og];
                        });
                      },
                      child: FramesWidget(
                        widget: Text(
                          "Original",
                          style: Constants.getFont(fontSize: 13),
                        ),
                        h: 50,
                        w: 70,
                        spacing: 3,
                      ),
                    ),

                    //Heart mask option
                    InkWell(
                      onTap: () {
                        setState(() {
                          maskImagePath = getFramePath[Frames.heart];
                        });
                      },
                      child: FramesWidget(
                        widget: Image.asset("asset/user_image_frame_1.png"),
                        h: 40,
                        w: 50,
                        spacing: 3,
                      ),
                    ),

                    //square mask option
                    InkWell(
                      onTap: () {
                        setState(() {
                          maskImagePath = getFramePath[Frames.square];
                        });
                      },
                      child: FramesWidget(
                        widget: Image.asset("asset/user_image_frame_2.png"),
                        h: 40,
                        w: 50,
                        spacing: 3,
                      ),
                    ),

                    //circle mask option
                    InkWell(
                      onTap: () {
                        setState(() {
                          maskImagePath = getFramePath[Frames.circle];
                        });
                      },
                      child: FramesWidget(
                        widget: Image.asset("asset/user_image_frame_3.png"),
                        h: 40,
                        w: 50,
                        spacing: 3,
                      ),
                    ),

                    //rectangle mask option
                    InkWell(
                      onTap: () {
                        setState(() {
                          maskImagePath = getFramePath[Frames.rectangle];
                        });
                      },
                      child: FramesWidget(
                        widget: Image.asset("asset/user_image_frame_4.png"),
                        h: 40,
                        w: 50,
                        spacing: 0,
                      ),
                    ),
                  ],
                ),

                //submit button
                ElevatedButton(
                  onPressed: () {
                    //return the final image back to screen
                    Navigator.of(context).pop(finalImage);
                  },
                  child: const Text("Use this Image"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
