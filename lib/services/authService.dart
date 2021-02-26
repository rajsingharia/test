import 'file:///C:/Users/Admin/AndroidStudioProjects/culmyca_app/lib/Extra/toast/toast.dart';
import 'package:dio/dio.dart';

class AuthService {
  Dio dio = new Dio();

   login(name, email, password) async {
    try {
      return await dio.post("/login",
          data: {"name": name, "email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      return{"dio_error":e.message};
    }
  }

   register(name, email, password) async {
    try {
      return await dio.post("/signup",
          data: {"name": name, "email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      return{"error":e.message};
    }
  }

  forgetPassword(token) async {
    try {
      return await dio.post("/forgetpassword", data: {"auth-token": token});
    } on DioError catch (e) {
      showToast(e.message);
    }
  }
}
