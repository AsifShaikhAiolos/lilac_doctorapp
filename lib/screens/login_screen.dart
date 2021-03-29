import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lilac_doctorapp/provider/auth_provider.dart';
import 'package:lilac_doctorapp/screens/dashboard_screen.dart';
import 'package:lilac_doctorapp/screens/register_screen.dart';
import 'package:lilac_doctorapp/utils/app_constants.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  var message = '';

  static const appColor = Color(0xFF8e539c);
  bool _obscureText = true;
  AnimationController controller;
  Animation<double> animation;
  String _password;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    /*animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });*/

    controller.forward();
  }

  @override
  dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isVisible = true;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade50,
      ),
      body: FadeTransition(
        opacity: animation,
        child:
            // ListView(
            //   shrinkWrap: true,
            //   children: <Widget>[
            //     Positioned.fill(
            //       child: Image.asset(
            //         "assets/images/bg_splash_logo.jpeg",
            //         fit: BoxFit.fitWidth,
            //         alignment: Alignment.bottomLeft,
            //       ),
            //     ),
            Form(
                key: _formKey,
                child: Container(
                  child: ListView(
                    children: [
                      //   Container(
                      // constraints: BoxConstraints.expand(),
                      // // decoration: BoxDecoration(
                      // //     image: DecorationImage(
                      // //         image: ExactAssetImage(
                      // //           "assets/images/bg_2.png",
                      // //         ),
                      // //         fit: BoxFit.cover)
                      // // ),
                      // child:
                      Padding(
                          padding: const EdgeInsets.all(42),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'poppins_regular',
                                      color: kPrimaryColor),
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                                // autofocus: true,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Enter Email',
                                  // suffixIcon: Icon(Icons.email_outlined,
                                  //     color: appColor)
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                                controller: idController,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                    labelText: 'Enter Password',
                                    // icon: Padding(
                                    //   padding: const EdgeInsets.only(top: 15.0),
                                    //   child: GestureDetector(
                                    //       onTap: () => {
                                    //         _toggle()
                                    //       },
                                    //       child: Icon(Icons.lock)),
                                    // )
                                    suffixIcon: GestureDetector(
                                      onTap: () => {_toggle()},
                                        child: Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: appColor,
                                      ),
                                    ),
                                    ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter password';
                                  } else {
                                    if (value.length < 6) {
                                      return 'Password too short.';
                                    }
                                  }
                                  return null;
                                },
                                onSaved: (val) => _password = val,
                                controller: passwordController,
                              ),
                              // FlatButton(
                              //     onPressed: _toggle,
                              //     child:
                              //         new Text(_obscureText ? "Show" : "Hide")),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8, top: 4),
                                child: SizedBox(
                                    width: double.infinity,
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      onPressed: () {
                                        submit();
                                        // _loginToEnterApp();
                                        // Provider.of<AuthProvider>(context,listen: false).email;
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text('Login',
                                              style: TextStyle(
                                                  fontFamily: 'poppins_regular',
                                                  fontSize: 15))),
                                      textColor: Colors.white,
                                      color: kPrimaryColor,
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: 'Dont have account? ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'poppins_regular',
                                      color: Colors.black),
                                ),
                                TextSpan(
                                    text: ' SignUp',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'poppins_regular',
                                        decoration: TextDecoration.underline,
                                        color: kPrimaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) {
                                        //   return Register();
                                        // }));
                                      })
                              ])),
                              // )
                            ],
                          )),

                      // )
                    ],
                  ),
                )),
        // ])
      ),
    );
  }
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
   submit() async{
    // try{
      var email = idController.text;
      var password = passwordController.text;
      await Provider.of<AuthProvider>(context, listen: false).login(email,password).then((status) =>{
      if (status.isSuccess) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DashBoardScreen(),))
      }
      });
        // }
    // on HttpException catch(error){
    //   var errorMessage = 'Authentication failed';
    //   if(error.toString().contains('User Not Exist')){
    //     errorMessage='User Not Exist ';
    //   } else if(error.toString().contains('User Not Exist')){
    //   errorMessage='Email already exist';
    //   }
    //   _showErrorDialog(errorMessage);
    // } catch(error){
    //   const message='Connection failed';
    //   // _showErrorDialog(message);
    // }
  }



  // _loginToEnterApp() async {
  //   if (_formKey.currentState.validate()) {
  //     var email = idController.text;
  //     var password = passwordController.text;
  //     print("UserID: ${email} Password:${password}");
  //     //printing in logcat
  //     // print("UserID: ${email} Password:${password}");
  //
  //     //api calls
  //     var client = http.Client();
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //      var url =  Uri.http('65.1.45.74:8181', '/user/docLogin') ;
  //     var response ;
  //     try{
  //        response = await client.post(url, headers: {
  //   "Accept": "Application/json",
  // }, body: {
  //   'email': email,
  //   'password': password,
  // });
  //   print("API Success:- " + response.body);
  //   Map<String, dynamic> respMap;
  // bool isTokenSuccess = response.body.contains('data');
  // print("API Success:- " + isTokenSuccess.toString());
  // if (isTokenSuccess) {
  //   respMap = json.decode(response.body);
  //   String token = respMap['data'];
  //   // print("got token: -> $token");
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var encrypted = encryptAESCryptoJS(token, TOKEN);
  //   prefs.setString(TOKEN, encrypted);
  //
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //           return HomeScreen();
  //         }));
  //
  // } else {
  //   print("API Error:- ");
  //   return null;
  // }
  //     }catch(e){
  //        print("API Error Catch:- " + e.toString());
  //     }
  //     // print(rsp);
  //     // if (rsp.containsKey('status')) {
  //     //   setState(() {
  //     //     message = rsp['message'];
  //     //   });
  //     //   if (rsp['status'] == 'success') {
  //     //     // UserPreferences().saveUser(rsp);
  //     //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     //     prefs.setString('email', 'email');
  //     //     prefs.setString('data', 'data');
  //     //     final email = prefs.getString('email');
  //     //     final data = prefs.getString('token');
  //     //     // print(email);
  //     //     // print("TOKEN:-> $data");
  //     //     // Fluttertoast.showToast(
  //     //     //     msg: "Login Successfully",
  //     //     //     toastLength: Toast.LENGTH_SHORT,
  //     //     //     gravity: ToastGravity.BOTTOM,
  //     //     //     timeInSecForIosWeb: 1,
  //     //     //     backgroundColor: Colors.purple,
  //     //     //     textColor: Colors.white,
  //     //     //     fontSize: 15.0);
  //
  //     //      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //     //       return HomeScreen();
  //     //     }));
  //     //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     //     //   return HomeScreen();
  //     //     // }));
  //     //   }
  //     // } else {
  //     //   // Fluttertoast.showToast(
  //     //   //     msg: "Login Fail",
  //     //   //     toastLength: Toast.LENGTH_SHORT,
  //     //   //     gravity: ToastGravity.BOTTOM,
  //     //   //     timeInSecForIosWeb: 1,
  //     //   //     backgroundColor: Colors.purple,
  //     //   //     textColor: Colors.white,
  //     //   //     fontSize: 15.0);
  //     //   setState(() {
  //     //     message = 'login failed';
  //     //   });
  //     // }
  //   }
  // }
}
