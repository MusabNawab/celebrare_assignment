import 'package:celebrare/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/imagepickercontainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Constants.theme,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          "Add Image / Icon",
          style: Constants.getFont(fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => SystemNavigator.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: const ImagePickerContainer(),
    );
  }
}
