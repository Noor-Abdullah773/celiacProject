import 'package:dio/dio.dart';

class ApiException{
  //  void handleError(DioException e) {
  //   if (e.response != null) {
  //     final statusCode = e.response?.statusCode;
  //     final statusMessage = e.response?.statusMessage;
  //     final responseData = e.response?.data;

  //     if (responseData != null && responseData['errors'] != null) {
  //       final errors = List<String>.from(responseData['errors']);
  //       throw Exception(errors.join(', '));
  //     }

  //     // Handle specific status codes
  //     switch (statusCode) {
  //       case 400:
  //         throw Exception('Bad Request: $statusMessage');
  //       case 401:
  //         throw Exception('Unauthorized: Please check your credentials.');
  //       case 403:
  //         throw Exception(
  //             "Forbidden: You don't have permission to access this resource.");
  //       case 404:
  //         throw Exception('Not Found: $statusMessage');
  //       case 500:
  //         throw Exception('Internal Server Error: Please try again later.');
  //       default:
  //         throw Exception('$statusMessage');
  //     }
  //   } else {
  //     // Handle network errors
  //     throw 'There is no internet connection.';
  //   }
  // }
   handleError(DioException error) {
    if (error.response != null) {
      // إذا كانت هناك استجابة من الخادم (على سبيل المثال، بيانات اعتماد خاطئة)
      switch (error.response!.statusCode) {
        case 400:
          return "طلب غير صالح. يرجى التحقق من المدخلات.";
        case 401:
          return "غير مصرح. اسم المستخدم أو كلمة المرور غير صحيحة.";
        case 403:
          return "طلب مرفوض.";
        case 404:
          return "المورد غير موجود.";
        case 500:
          return "خطأ داخلي في الخادم. يرجى المحاولة لاحقاً.";
        default:
          return "استجابة غير صحيحة برمز الحالة: ${error.response!.statusCode}";
      }
    } else {
      // التعامل مع الأخطاء التي تحدث بسبب مشاكل الاتصال، انتهاء الوقت، وما إلى ذلك.
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "انتهاء مهلة الاتصال. يرجى المحاولة مرة أخرى.";
        case DioExceptionType.sendTimeout:
          return "انتهاء مهلة الإرسال. يرجى المحاولة مرة أخرى.";
        case DioExceptionType.receiveTimeout:
          return "انتهاء مهلة الاستلام. يرجى المحاولة مرة أخرى.";
        case DioExceptionType.connectionError:
          return "لا يوجد اتصال بالإنترنت. يرجى التحقق من الشبكة.";
        case DioExceptionType.cancel:
          return "تم إلغاء الطلب.";
        default:
          return "حدث خطأ غير معروف.";
      }
    }
  }
}