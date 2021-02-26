
import 'file:///C:/Users/Admin/AndroidStudioProjects/culmyca_app/lib/Extra/toast/toast.dart';
import 'package:culmyca_app/animation/FadeAnimation.dart';
import 'package:culmyca_app/services/authService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'login.dart';


class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _name = "", _email = "", _password = "", _branch = "";
  String _collegename = "";
  String _choosedYear = "1st Year";
  List years = ["1st Year", "2nd Year", "3rd Year" , "4th Year" ];

  bool isLoading = false;
  var selectedImage=null;

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
      body: SingleChildScrollView(
        child: Container(
            //height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                 Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          FadeAnimation(
                              1,
                              Text(
                                "Register",
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
                                "Register to your account",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[700]),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                          children: [Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: <Widget>[
                                FadeAnimation(
                                  1.1,
                                  FlatButton(onPressed: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: ((builder) => bottomSheet()));
                                  }, child: Container(
                                    height: MediaQuery.of(context).size.width/3,
                                    width: MediaQuery.of(context).size.width/3,
                                    child: selectedImage==null?Icon(Icons.person,size: MediaQuery.of(context).size.width/3.5,):Image.file(selectedImage)
                                  )),
                                ),
                                SizedBox(height: 20,),
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

                                      keyboardType: TextInputType.numberWithOptions(decimal: false),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.phone),
                                          border: OutlineInputBorder(),
                                          labelText: "Phone Number"),
                                      onChanged: (value) {
                                        _password = value;
                                      },
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                FadeAnimation(
                                    1.3,
                                    TextField(

                                     //keyboardType: TextInputType.numberWithOptions(decimal: false),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.school_outlined),
                                          border: OutlineInputBorder(),
                                          labelText: "College Name"),
                                      onChanged: (value) {
                                        _collegename = value;
                                      },
                                    )),




                                SizedBox(
                                  height: 20,
                                ),

                                  DropdownButton(

                                    value: _choosedYear,
                                    dropdownColor: Colors.white,
                                    onChanged: (newvaue){
                                      setState(() {
                                        _choosedYear = newvaue;
                                      });
                                    },
                                    hint: Text("Select your Year"),
                                    isExpanded: true,
                                    icon: Icon(Icons.arrow_drop_down_sharp),
                                    items: years.map((valueItem) {

                                      return DropdownMenuItem(value: valueItem,child: Text(valueItem));
                                    }).toList(),
                                    ),
                                SizedBox(
                                  height: 20,
                                ),
                                FadeAnimation(
                                    1.3,
                                    TextField(

                                      //keyboardType: TextInputType.numberWithOptions(decimal: false),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.school_outlined),
                                          border: OutlineInputBorder(),
                                          labelText: "Branch Name"),
                                      onChanged: (value) {
                                        _branch = value;
                                      },
                                    )),




                                SizedBox(
                                  height: 10,
                                ),
                                FadeAnimation(
                                    1.4,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: 10),
                                        FlatButton(
                                            onPressed: () {
                                              forgetPassword();
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
          ]
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
                                  if (_email == "" || _password == "" || _collegename == "" || _choosedYear == "" || _branch == "") {
                                    showToast("Credentials Empty");
                                  } else {
                                    setState(() => isLoading = true);

                                    //REGISTER
                                   registerUser(_name, _email, _password);


                                  }
                                },
                                color: Colors.redAccent[400],
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Register",
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
                              Text("Already have an account ?"),
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Login();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.redAccent[400],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 30,)
                    ],
                  ),
             //   ),
              ],
            ),
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



  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text("Choose picture"),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.redAccent[700],
                ),
                onPressed: () {
                  upLoadImageFromCamera();
                },
              ),
              IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.image,
                  color: Colors.redAccent[700],
                ),
                onPressed: () {
                  upLoadImageFromGallery();
                },
              )
            ],
          )
        ],
      ),
    );
  }

  upLoadImageFromGallery() async {
    await Permission.photos.request();
    var permissionState = await Permission.photos.status;
    if (permissionState.isGranted) {
      //Select Image
      var image = await ImagePicker().getImage(source: ImageSource.gallery);
      if (image != null) {
        var croppedImage = await ImageCropper.cropImage(
            aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
            sourcePath: image.path,
            compressQuality: 70,
            maxHeight: 700,
            maxWidth: 700,
            compressFormat: ImageCompressFormat.jpg,
            androidUiSettings: AndroidUiSettings(
              toolbarColor: Colors.redAccent[700],
              toolbarWidgetColor: Colors.white,
              toolbarTitle: "Cropper",
              statusBarColor: Colors.red[900],
              backgroundColor: Colors.white,
            ));
        if (croppedImage != null) {
          setState(() {
            selectedImage=croppedImage;
          });
        } else
          showToast("No Path");
      }
    } else {
      showToast("Grant Permission");
    }
  }

  upLoadImageFromCamera() async {
    await Permission.camera.request();

    var image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image != null) {
      var croppedImage = await ImageCropper.cropImage(
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          sourcePath: image.path,
          compressQuality: 70,
          maxHeight: 700,
          maxWidth: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.redAccent[700],
            toolbarTitle: "Cropper",
            toolbarWidgetColor: Colors.white,
            statusBarColor: Colors.red[900],
            backgroundColor: Colors.white,
          ));
      if (croppedImage != null) {
        setState(() {
        selectedImage=croppedImage;
      });

      } else
        showToast("No Path");
    } else
      showToast("Grant Permission");
  }




  //Login
  void registerUser(String name, String email, String password) {
    AuthService().register(name, email, password).then((response) {
      if(response['dio_error']!=null){
        showToast(response['dio_error']);
        setState(() => isLoading = false);
        return;
      }
      var token = response.data['token'];
    });
  }

  void forgetPassword() {
    AuthService().forgetPassword("token").then((response) {});
  }





}
