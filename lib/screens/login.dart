import 'package:culmyca_app/Extra/toast/toast.dart';
import 'package:culmyca_app/animation/FadeAnimation.dart';
import 'package:culmyca_app/screens/register.dart';
import 'package:culmyca_app/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _name = "", _email = "", _password = "";

  bool isLoading = false;
  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? AlertDialog(
            title: Center(
              child: Text(
                "Loading",
              ),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 6,
              child: Center(
                child: SpinKitWave(
                  color: Colors.red[700],
                ),
              ),
            ),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            FadeAnimation(
                                1,
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                                1.2,
                                Text(
                                  "Login to your account",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[700]),
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: <Widget>[
                              FadeAnimation(
                                  1.2,
                                  TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person),
                                        border: OutlineInputBorder(),
                                        labelText: "Name"),
                                    onChanged: (value) {
                                      _name = value;
                                    },
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              FadeAnimation(
                                  1.2,
                                  TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
                                        border: OutlineInputBorder(),
                                        labelText: "Email"),
                                    onChanged: (value) {
                                      _email = value;
                                    },
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              FadeAnimation(
                                  1.3,
                                  TextField(
                                    obscureText: !passwordVisibility,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(!passwordVisibility
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          onPressed: () {
                                            setState(() {
                                              passwordVisibility =
                                                  !passwordVisibility;
                                            });
                                          },
                                        ),
                                        prefixIcon: Icon(Icons.lock),
                                        border: OutlineInputBorder(),
                                        labelText: "Password"),
                                    onChanged: (value) {
                                      _password = value;
                                    },
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              FadeAnimation(
                                  1.4,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 10),
                                      FlatButton(
                                          onPressed: () {
                                            fotgetPassword();
                                          },
                                          child: Text(
                                            "Forget password",
                                            style: TextStyle(
                                              color: Colors.redAccent[400],
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ))
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        FadeAnimation(
                            1.4,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Container(
                                padding: EdgeInsets.only(top: 3, left: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                      top: BorderSide(color: Colors.black),
                                      left: BorderSide(color: Colors.black),
                                      right: BorderSide(color: Colors.black),
                                    )),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 50,
                                  onPressed: () {
                                    if (_email == "" || _password == "") {
                                      showToast("Credentials Empty");
                                    } else {
                                      setState(() => isLoading = true);

                                      //LOGIN
                                      loginUser(_name, _email, _password);
                                    }
                                  },
                                  color: Colors.redAccent[400],
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            )),
                        FadeAnimation(
                            1.5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Don't have an account?"),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Register();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      color: Colors.redAccent[400],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  //Login
  void loginUser(String name, String email, String password) {
    AuthService().login(name, email, password).then((response) {
      if (response['dio_error'] != null) {
        showToast(response['dio_error']);
        setState(() => isLoading = false);
        return;
      }
      var token = response.data['token'];
    });
  }

  void fotgetPassword() {
    AuthService().forgetPassword("token").then((response) {});
  }
}
