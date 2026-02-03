import 'package:bermudez_mobileprog/constants.dart';
import 'package:bermudez_mobileprog/widgets/custom_font.dart';
import 'package:bermudez_mobileprog/widgets/custom_inkwell_button.dart';
import 'package:bermudez_mobileprog/widgets/custom_textformfield.dart';
import 'package:bermudez_mobileprog/widgets/custom_dialogs.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobilenumController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  // 1. Existing variable for Password
  bool _isObscure = true;
  // 2. NEW: Variable for Confirm Password
  bool _isConfirmObscure = true; 

  void register() {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        mobilenumController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmpasswordController.text.isEmpty) {
      customDialog(context,
          title: "Registration Error",
          content: "Please fill out all required fields.");
      return;
    }

    if (mobilenumController.text.length != 11) {
      customDialog(context,
          title: "Invalid Mobile Number",
          content: "Mobile number must be exactly 11 digits.");
      return;
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(passwordController.text)) {
      customDialog(context,
          title: "Weak Password",
          content:
              "Password must be at least 8 characters, include an uppercase letter, lowercase letter, number, and a special character.");
      return;
    }

    if (passwordController.text != confirmpasswordController.text) {
      customDialog(context,
          title: "Password Mismatch",
          content: "The passwords you entered do not match.");
      return;
    }

    customDialog(context,
        title: "Success", content: "Account successfully registered!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(25),
            ScreenUtil().setHeight(40),
            ScreenUtil().setWidth(25),
            ScreenUtil().setHeight(10),
          ),
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(25)),
              CustomFont(
                text: 'Register Here',
                fontSize: ScreenUtil().setSp(50),
                fontWeight: FontWeight.bold,
                color: FB_DARK_PRIMARY,
                maxLines: 1,
              ),
              SizedBox(height: ScreenUtil().setHeight(25)),
              
              // ... [First Name, Last Name, Mobile, Username fields remain the same] ...
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'First name',
                validator: (value) => null, 
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: firstnameController,
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Last name',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: lastnameController,
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomTextFormField(
                maxLength: 11,
                keyboardType: TextInputType.number,
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Mobile Number',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: mobilenumController,
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Username', 
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: usernameController,
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),

              // PASSWORD FIELD
              CustomTextFormField(
                isObscure: _isObscure,
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Password',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: passwordController,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              Text(
                  '(Password should be 8 characters, a mixture of letter and numbers consisting of at least one special character with Uppercase and Lowercase letters.)',
                  style: TextStyle(
                      color: Colors.black45, fontSize: ScreenUtil().setSp(10))),
              SizedBox(height: ScreenUtil().setHeight(10)),

              // 3. UPDATED: CONFIRM PASSWORD FIELD
              CustomTextFormField(
                // Use the new variable here
                isObscure: _isConfirmObscure, 
                hintText: 'Confirm Password',
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: confirmpasswordController,
                // Add the toggle button
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmObscure = !_isConfirmObscure;
                    });
                  },
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You have an account? ',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: ScreenUtil().setSp(15))),
                  GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(context, '/login'),
                    child: Text(
                      'Login here',
                      style: TextStyle(
                        color: FB_DARK_PRIMARY,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomInkwellButton(
                onTap: () => register(),
                height: ScreenUtil().setHeight(45),
                width: ScreenUtil().screenWidth,
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.bold,
                buttonName: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}         