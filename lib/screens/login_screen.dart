import 'package:bermudez_mobileprog/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bermudez_mobileprog/constants.dart';
import 'package:bermudez_mobileprog/widgets/custom_inkwell_button.dart';
import 'home_screen.dart'; 

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(25),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/NUCCITLogo_Black.png',
                        height: ScreenUtil().setHeight(200),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
                      CustomTextFormField(
                          height: ScreenUtil().setHeight(10),
                          width: ScreenUtil().setWidth(10),
                          controller: usernameController,
                          onSaved: (value) => null,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your Username' : null,
                          fontSize: ScreenUtil().setSp(15),
                          fontColor: FB_DARK_PRIMARY,
                          hintTextSize: ScreenUtil().setSp(15),
                          hintText: 'Username'),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      CustomTextFormField(
                          height: ScreenUtil().setHeight(10),
                          width: ScreenUtil().setWidth(10),
                          controller: passwordController,
                        
                          isObscure: _isObscure, 
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your password' : null,
                          onSaved: (value) => passwordController.text = value!,
                          fontSize: ScreenUtil().setSp(15),
                          fontColor: FB_DARK_PRIMARY,
                          hintTextSize: ScreenUtil().setSp(15),
                          hintText: 'Password',
                        
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
                      SizedBox(height: ScreenUtil().setHeight(50)),
                      CustomInkwellButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                           
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                  userName: usernameController.text, 
                                ),
                              ),
                            );
                          }
                        },
                        height: ScreenUtil().setHeight(40),
                        width: ScreenUtil().screenWidth,
                        buttonName: 'Login',
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('You do not have an account?',
                          style: TextStyle(
                              color: Colors.grey.shade200,
                              fontSize: ScreenUtil().setSp(15))),
                      GestureDetector(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, '/register'),
                        child: Text(
                          'Register here',
                          style: TextStyle(
                            color: FB_LIGHT_PRIMARY,
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}