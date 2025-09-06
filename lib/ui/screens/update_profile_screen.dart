import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hyip/ui/controllers/auth_controller.dart';
import 'package:hyip/ui/data/models/user_model.dart';
import 'package:hyip/ui/widgets/screen_background.dart';
import 'package:hyip/ui/widgets/tm_app_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/centered_circular_progress_indicator.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;

  bool _updatingInProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UserModel userModel = AuthController.userModel!;
    _emailTEController.text = userModel.email;
    _firstNameTEController.text = userModel.firstName;
    _lastNameTEController.text = userModel.lastName;
    _mobileTEController.text = userModel.mobile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(fromProfileScreen: true),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),

                  Text(
                    'Update Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  buildPhotoPickerWidget(),
                  SizedBox(height: 8),
                  SizedBox(height: 24),
                  TextFormField(
                    enabled: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTEController,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (String? value) {
                      String email = value?.trim() ?? '';
                      if (EmailValidator.validate(email) == false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _firstNameTEController,
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your First Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _lastNameTEController,
                    decoration: InputDecoration(hintText: 'Last Name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your Last Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    controller: _mobileTEController,
                    decoration: InputDecoration(hintText: 'Mobile'),
                    validator: (String? value) {
                      String phone = value?.trim() ?? '';
                      RegExp regExp = RegExp(r"^(?:\+?88|0088)?01[15-9]\d{8}$");
                      if (regExp.hasMatch(phone) == false) {
                        return 'Enter your valid phone';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordTEController,
                    decoration: InputDecoration(hintText: 'Password'),
                    // validator: (String? value) {
                    //   if ((value?.trim().isEmpty ?? true) ||
                    //       (value!.length < 6)) {
                    //     return 'Enter your Password more than 6 letters';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  Visibility(
                    visible: _updatingInProgress == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapSubmit,
                      child: Icon(Icons.arrow_circle_right_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(double.maxFinite),
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPhotoPickerWidget() {
    return GestureDetector(
      onTap: _onTapPhotoPicker,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              alignment: Alignment.center,
              child: Text('Photo', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 8),
            Text(_pickedImage?.name ?? 'Select Photo'),
          ],
        ),
      ),
    );
  }

  void _onTapSubmit() {}

  void _onTapPhotoPicker() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }
}
