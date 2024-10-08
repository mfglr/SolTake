enum ActiveLoginPage{
  loginPage,
  registerPage
}


class LoginState {
  final ActiveLoginPage activeLoginPage;
  final String language;
  const LoginState({required this.activeLoginPage, required this.language});

  LoginState changeActiveLoginPage(ActiveLoginPage page) =>
    LoginState(
      activeLoginPage: page,
      language: language
    );
  
  LoginState changeLanguage(String language) =>
    LoginState(
      activeLoginPage: activeLoginPage,
      language: language
    );
}