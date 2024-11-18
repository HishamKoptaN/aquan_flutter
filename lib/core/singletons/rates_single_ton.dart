import '../../features/dash/data/model/dash_res_model.dart';

class DashResModelSingleton {
  // 1. إنشاء كائن وحيد خاص
  static final DashResModelSingleton _instance =
      DashResModelSingleton._internal();

  // 2. تعريف المتغير الذي سيحمل بيانات المودل
  DashResModel? _dashResModel;

  // 3. الإنشاء الداخلي الخاص لـ Singleton
  DashResModelSingleton._internal();

  // 4. توفير الوصول إلى الكائن الوحيد عبر get instance
  static DashResModelSingleton get instance => _instance;

  // 5. طريقة لإعداد قيمة dashResModel أو تحديثها
  void setDashResModel(DashResModel model) {
    _dashResModel = model;
  }

  // 6. طريقة لاسترجاع dashResModel المخزن
  DashResModel? get dashResModel => _dashResModel;

  // يمكنك إضافة طرق أخرى للتحديث أو التعديل أو الوصول للبيانات
}
