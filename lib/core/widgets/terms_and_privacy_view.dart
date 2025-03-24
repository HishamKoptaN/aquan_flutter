import 'package:flutter/material.dart';

class TermsAndPrivacyView extends StatelessWidget {
  const TermsAndPrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("شروط الاستخدام وسياسة الخصوصية"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle("سياسة الخصوصية"),
            _buildParagraph(
                "في محفظة أكوان، نحن ملتزمون بحماية خصوصيتك وضمان أمان معلوماتك الشخصية. باستخدامك لتطبيقنا، فإنك توافق على جمع واستخدام معلوماتك وفقًا للشروط التالية:"),
            _buildBulletPoint(
                "نقوم بجمع المعلومات الشخصية التي تقدمها أثناء التسجيل مثل الاسم، البريد الإلكتروني، ورقم الهاتف."),
            _buildBulletPoint(
                "يتم جمع معلومات الاستخدام مثل بيانات المعاملات، وسجل التصفح داخل التطبيق لتحسين خدماتنا."),
            _buildSectionTitle("استخدام المعلومات"),
            _buildBulletPoint(
                "تُستخدم المعلومات لتقديم الخدمات المطلوبة، تحسين تجربة المستخدم، ودعم العملاء."),
            _buildBulletPoint(
                "لا نشارك بياناتك الشخصية مع أطراف ثالثة إلا إذا كان ذلك مطلوبًا قانونيًا أو لتحسين الخدمات المقدمة."),
            _buildSectionTitle("حقوق المستخدم"),
            _buildBulletPoint(
                "يجب على المستخدم تقديم معلومات دقيقة وكاملة عند التسجيل."),
            _buildBulletPoint(
                "يتحمل المستخدم مسؤولية حماية بيانات الدخول الخاصة به."),
            _buildBulletPoint(
                "يمكن للمستخدم معرفة البيانات التي نجمعها وكيفية استخدامها وطلب تعديل أو حذف بياناته الشخصية."),
            _buildSectionTitle("ملفات تعريف الارتباط (Cookies)"),
            _buildBulletPoint(
                "يستخدم التطبيق ملفات تعريف الارتباط لتحسين تجربة الاستخدام."),
            _buildBulletPoint(
                "يمكنك تعطيل ملفات تعريف الارتباط من خلال إعدادات المتصفح الخاص بك."),
            Divider(),
            _buildSectionTitle("شروط الاستخدام"),
            _buildBulletPoint(
                "يحق لك استخدام المحفظة والخدمات المتوفرة فيها فقط للأغراض القانونية."),
            _buildBulletPoint(
                "يمنع استخدام المحفظة لأي أنشطة غير مشروعة أو تنتهك حقوق الآخرين."),
            _buildSectionTitle("تفاصيل المعاملات"),
            _buildBulletPoint(
                "يتحمل المستخدم مسؤولية قراءة كافة التفاصيل المتعلقة بالمعاملات."),
            _buildBulletPoint("يتم حظر الحساب في حال حدوث أي محاولة احتيال."),
            _buildBulletPoint("لا يمكن إلغاء الاشتراك في أي خطة."),
            Divider(),
            _buildSectionTitle("اتصل بنا"),
            _buildParagraph(
                "إذا كان لديك أي استفسار، يرجى التواصل معنا عبر البريد الإلكتروني: support@aquan.info"),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
