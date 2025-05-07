part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {
  const ThemeState();
}

final class ThemeInitial extends ThemeState {}

final class ThemeLoading extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final bool isDarkMode;

  const ThemeLoaded({required this.isDarkMode});
}
