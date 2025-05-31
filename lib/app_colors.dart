import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color? homeActive;
  final Color? homeInactive;
  final Color? navBarBg;
  final Color? navBarShadow;
  // Add more custom colors as needed

  const AppColors({
    this.homeActive,
    this.homeInactive,
    this.navBarBg,
    this.navBarShadow,
  });

  @override
  AppColors copyWith({
    Color? homeActive,
    Color? homeInactive,
    Color? navBarBg,
    Color? navBarShadow,
  }) {
    return AppColors(
      homeActive: homeActive ?? this.homeActive,
      homeInactive: homeInactive ?? this.homeInactive,
      navBarBg: navBarBg ?? this.navBarBg,
      navBarShadow: navBarShadow ?? this.navBarShadow,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      homeActive: Color.lerp(homeActive, other.homeActive, t),
      homeInactive: Color.lerp(homeInactive, other.homeInactive, t),
      navBarBg: Color.lerp(navBarBg, other.navBarBg, t),
      navBarShadow: Color.lerp(navBarShadow, other.navBarShadow, t),
    );
  }
}
