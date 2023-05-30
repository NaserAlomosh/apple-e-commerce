abstract class SigninStates {}

class SigninInitState extends SigninStates {}

class SigninErrorState extends SigninStates {}

class SigninEmailErrorState extends SigninStates {}

class SigninPasswordErrorState extends SigninStates {}

class SigninSuccessState extends SigninStates {}

class SigninLoadingState extends SigninStates {}
