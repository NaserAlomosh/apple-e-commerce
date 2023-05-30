import 'package:final_shop/view_model/theme/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitState());
  bool isDark = false;
  bool get isdark => isDark;
  void changeTheme() {
    isDark = !isDark;
    emit(ChangeTheme());
  }
}
