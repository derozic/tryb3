import 'package:flutter/material.dart';

/// Tailwind-inspired color system with P3 gamut support
/// These colors work on all platforms and degrade gracefully on non-P3 displays
class TailwindColors {
  // P3 Gamut Enhanced Colors - More vibrant on supported displays
  static const p3Orange = Color.fromARGB(255, 255, 107, 53); // Enhanced orange
  static const p3Cyan = Color.fromARGB(255, 78, 205, 196);   // Enhanced cyan
  static const p3Pink = Color.fromARGB(255, 255, 20, 147);   // Vivid pink
  static const p3Lime = Color.fromARGB(255, 132, 255, 0);    // Electric lime
  
  // Slate (Neutral)
  static const slate50 = Color(0xFFF8FAFC);
  static const slate100 = Color(0xFFF1F5F9);
  static const slate200 = Color(0xFFE2E8F0);
  static const slate300 = Color(0xFFCBD5E1);
  static const slate400 = Color(0xFF94A3B8);
  static const slate500 = Color(0xFF64748B);
  static const slate600 = Color(0xFF475569);
  static const slate700 = Color(0xFF334155);
  static const slate800 = Color(0xFF1E293B);
  static const slate900 = Color(0xFF0F172A);
  static const slate950 = Color(0xFF020617);

  // Orange (Primary)
  static const orange50 = Color(0xFFFFF7ED);
  static const orange100 = Color(0xFFFFEDD5);
  static const orange200 = Color(0xFFFED7AA);
  static const orange300 = Color(0xFFFDBA74);
  static const orange400 = Color(0xFFFB923C);
  static const orange500 = Color(0xFFF97316);
  static const orange600 = Color(0xFFEA580C);
  static const orange700 = Color(0xFFC2410C);
  static const orange800 = Color(0xFF9A3412);
  static const orange900 = Color(0xFF7C2D12);
  static const orange950 = Color(0xFF431407);

  // Cyan (Secondary)
  static const cyan50 = Color(0xFFECFEFF);
  static const cyan100 = Color(0xFFCFFAFE);
  static const cyan200 = Color(0xFFA5F3FC);
  static const cyan300 = Color(0xFF67E8F9);
  static const cyan400 = Color(0xFF22D3EE);
  static const cyan500 = Color(0xFF06B6D4);
  static const cyan600 = Color(0xFF0891B2);
  static const cyan700 = Color(0xFF0E7490);
  static const cyan800 = Color(0xFF155E75);
  static const cyan900 = Color(0xFF164E63);
  static const cyan950 = Color(0xFF083344);

  // Emerald (Success)
  static const emerald50 = Color(0xFFECFDF5);
  static const emerald100 = Color(0xFFD1FAE5);
  static const emerald200 = Color(0xFFA7F3D0);
  static const emerald300 = Color(0xFF6EE7B7);
  static const emerald400 = Color(0xFF34D399);
  static const emerald500 = Color(0xFF10B981);
  static const emerald600 = Color(0xFF059669);
  static const emerald700 = Color(0xFF047857);
  static const emerald800 = Color(0xFF065F46);
  static const emerald900 = Color(0xFF064E3B);

  // Rose (Error/Danger)
  static const rose50 = Color(0xFFFFF1F2);
  static const rose100 = Color(0xFFFFE4E6);
  static const rose200 = Color(0xFFFECDD3);
  static const rose300 = Color(0xFFFDA4AF);
  static const rose400 = Color(0xFFFB7185);
  static const rose500 = Color(0xFFF43F5E);
  static const rose600 = Color(0xFFE11D48);
  static const rose700 = Color(0xFFBE123C);
  static const rose800 = Color(0xFF9F1239);
  static const rose900 = Color(0xFF881337);

  // Amber (Warning)
  static const amber50 = Color(0xFFFFFBEB);
  static const amber100 = Color(0xFFFEF3C7);
  static const amber200 = Color(0xFFFDE68A);
  static const amber300 = Color(0xFFFCD34D);
  static const amber400 = Color(0xFFFBBF24);
  static const amber500 = Color(0xFFF59E0B);
  static const amber600 = Color(0xFFD97706);
  static const amber700 = Color(0xFFB45309);
  static const amber800 = Color(0xFF92400E);
  static const amber900 = Color(0xFF78350F);
}

/// Tailwind-inspired spacing system
class TailwindSpacing {
  static const double px = 1;
  static const double s0_5 = 2;
  static const double s1 = 4;
  static const double s1_5 = 6;
  static const double s2 = 8;
  static const double s2_5 = 10;
  static const double s3 = 12;
  static const double s3_5 = 14;
  static const double s4 = 16;
  static const double s5 = 20;
  static const double s6 = 24;
  static const double s7 = 28;
  static const double s8 = 32;
  static const double s9 = 36;
  static const double s10 = 40;
  static const double s11 = 44;
  static const double s12 = 48;
  static const double s14 = 56;
  static const double s16 = 64;
  static const double s20 = 80;
  static const double s24 = 96;
  static const double s28 = 112;
  static const double s32 = 128;
  static const double s36 = 144;
  static const double s40 = 160;
  static const double s44 = 176;
  static const double s48 = 192;
  static const double s52 = 208;
  static const double s56 = 224;
  static const double s60 = 240;
  static const double s64 = 256;
  static const double s72 = 288;
  static const double s80 = 320;
  static const double s96 = 384;
}

/// Tailwind-inspired text styles
class TailwindTextStyles {
  static const TextStyle textXs = TextStyle(fontSize: 12, height: 1.5);
  static const TextStyle textSm = TextStyle(fontSize: 14, height: 1.43);
  static const TextStyle textBase = TextStyle(fontSize: 16, height: 1.5);
  static const TextStyle textLg = TextStyle(fontSize: 18, height: 1.56);
  static const TextStyle textXl = TextStyle(fontSize: 20, height: 1.5);
  static const TextStyle text2xl = TextStyle(fontSize: 24, height: 1.33);
  static const TextStyle text3xl = TextStyle(fontSize: 30, height: 1.2);
  static const TextStyle text4xl = TextStyle(fontSize: 36, height: 1.11);
  static const TextStyle text5xl = TextStyle(fontSize: 48, height: 1);
  static const TextStyle text6xl = TextStyle(fontSize: 60, height: 1);
  static const TextStyle text7xl = TextStyle(fontSize: 72, height: 1);
  static const TextStyle text8xl = TextStyle(fontSize: 96, height: 1);
  static const TextStyle text9xl = TextStyle(fontSize: 128, height: 1);
}

/// Tailwind-inspired shadow system
class TailwindShadows {
  static const List<BoxShadow> shadowSm = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 2,
      color: Color.fromRGBO(0, 0, 0, 0.05),
    ),
  ];
  
  static const List<BoxShadow> shadow = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 3,
      color: Color.fromRGBO(0, 0, 0, 0.1),
    ),
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 2,
      color: Color.fromRGBO(0, 0, 0, 0.06),
    ),
  ];
  
  static const List<BoxShadow> shadowMd = [
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -1,
      color: Color.fromRGBO(0, 0, 0, 0.1),
    ),
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -1,
      color: Color.fromRGBO(0, 0, 0, 0.06),
    ),
  ];
  
  static const List<BoxShadow> shadowLg = [
    BoxShadow(
      offset: Offset(0, 10),
      blurRadius: 15,
      spreadRadius: -3,
      color: Color.fromRGBO(0, 0, 0, 0.1),
    ),
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -2,
      color: Color.fromRGBO(0, 0, 0, 0.05),
    ),
  ];
  
  static const List<BoxShadow> shadowXl = [
    BoxShadow(
      offset: Offset(0, 20),
      blurRadius: 25,
      spreadRadius: -5,
      color: Color.fromRGBO(0, 0, 0, 0.1),
    ),
    BoxShadow(
      offset: Offset(0, 10),
      blurRadius: 10,
      spreadRadius: -5,
      color: Color.fromRGBO(0, 0, 0, 0.04),
    ),
  ];
  
  static const List<BoxShadow> shadow2xl = [
    BoxShadow(
      offset: Offset(0, 25),
      blurRadius: 50,
      spreadRadius: -12,
      color: Color.fromRGBO(0, 0, 0, 0.25),
    ),
  ];
}

/// Tailwind-inspired border radius
class TailwindRadius {
  static const double none = 0;
  static const double sm = 2;
  static const double base = 4;
  static const double md = 6;
  static const double lg = 8;
  static const double xl = 12;
  static const double xl2 = 16;
  static const double xl3 = 24;
  static const double full = 9999;
}