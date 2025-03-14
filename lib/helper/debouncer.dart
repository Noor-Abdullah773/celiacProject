import 'dart:async';

class Debouncer {
  final int milliseconds; // مدة التأخير
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(Function action) {
    // إذا كان هناك مؤقت نشط، يتم إلغاؤه
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }

    // إنشاء مؤقت جديد مع تنفيذ الإجراء بعد انتهاء المدة
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      action(); // تنفيذ الإجراء
    });
  }

  // دالة لإلغاء المؤقت النشط
  void cancel() {
    _timer?.cancel();
  }
}