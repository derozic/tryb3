/// Spacing tokens for consistent layout spacing across the app
class TuxSpacing {
  // Base unit: 4px
  static const double unit = 4.0;
  
  // Spacing scale
  static const double xxs = unit * 1;   // 4px
  static const double xs = unit * 2;    // 8px
  static const double sm = unit * 3;    // 12px
  static const double md = unit * 4;    // 16px
  static const double lg = unit * 6;    // 24px
  static const double xl = unit * 8;    // 32px
  static const double xxl = unit * 12;  // 48px
  static const double xxxl = unit * 16; // 64px
  
  // Component-specific spacing
  static const double buttonPaddingX = md;
  static const double buttonPaddingY = sm;
  static const double cardPadding = md;
  static const double inputPadding = sm;
  static const double sectionSpacing = xl;
}