import 'package:bloc/bloc.dart';
import 'package:clot_app/core/utils/shared_pref_helper.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()) {
    initializeTheme();
  }

  // Internal cache to avoid async issues
  bool _isDarkMode = false;

  // Getter for current theme mode
  bool get isDarkMode => _isDarkMode;

  // Initialize theme from SharedPreferences
  Future<void> initializeTheme() async {
    emit(ThemeLoading());

    try {
      // Get theme from SharedPreferences
      final isDark = await SharedPrefHelper.getTheme();
      _isDarkMode = isDark;

      emit(ThemeLoaded(isDarkMode: isDark));
    } catch (e) {
      // If there's an error, default to light theme
      _isDarkMode = false;
      emit(const ThemeLoaded(isDarkMode: false));
    }
  }

  // Toggle between light and dark theme
  Future<void> toggleTheme() async {
    try {
      // Toggle the theme
      _isDarkMode = !_isDarkMode;

      // Save to SharedPreferences
      await SharedPrefHelper.setTheme(_isDarkMode);

      // Emit new state
      emit(ThemeLoaded(isDarkMode: _isDarkMode));
    } catch (e) {
      // If there's an error, revert to previous state
      _isDarkMode = !_isDarkMode;
      emit(ThemeLoaded(isDarkMode: _isDarkMode));
    }
  }
}
