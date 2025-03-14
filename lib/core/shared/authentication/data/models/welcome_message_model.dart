class WelcomeMessage {
  final String messageTitile;
  final String messageContent;

  WelcomeMessage({required this.messageTitile, required this.messageContent});
}

List<WelcomeMessage> listWelcomeMessage = [
  WelcomeMessage(
    messageTitile: 'مرحبًا! نحن جاهزون لخدمتك',
    messageContent:
        'سجل دخولك علشان تقدر تبلغ عن مشاكلك بسهولة، وتتابع حالة الطلبات، وتتواصل مع فريق الدعم',
  ),
  WelcomeMessage(
    messageTitile: 'مرحبًا بك في لوحة تحكم الإدارة',
    messageContent:
        'سجل دخولك علشان تدير طلبات الصيانة، وتوظف الفنيين، وتتابع أداء فريق العمل',
  ),
  WelcomeMessage(
    messageTitile: 'مرحبًا بك في نظام إدارة الصيانة',
    messageContent:
        'سجل دخولك علشان تبدأ يومك، وتتابع طلبات الصيانة، وتتواصل مع فريق العمل',
  ),
];
