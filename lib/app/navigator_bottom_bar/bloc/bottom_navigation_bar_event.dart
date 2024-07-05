abstract class NavigationEvent {}

class ChangePageEvent extends NavigationEvent {
  final int pageIndex;

  ChangePageEvent(this.pageIndex);
}

class VerifyEmail extends NavigationEvent {
  final String code;
  VerifyEmail({required this.code});
}

class SignInWithGoogle extends NavigationEvent {
  final String email;
  final String name;

  SignInWithGoogle({
    required this.email,
    required this.name,
  });
}
