import 'package:flutter/material.dart';

/// Brand color tokens for Yeremchuk Dental, sourced from the Figma design
/// (teal accent, navy dark sections, light/white content backgrounds).
abstract class AppColors {
  // Sampled directly from the Figma export pixels (dominant-color extraction),
  // not eyeballed — keep these exact for 1:1 fidelity to the mockups.
  static const teal = Color(0xFF2EBCB5);
  static const tealDark = Color(0xFF1D8F89);
  static const tealSoft = Color(0xFFD7EEEE);

  static const navy = Color(0xFF202C3D);
  static const navySoft = Color(0xFF2B3C54);

  static const ink = Color(0xFF162132);
  static const inkSoft = Color(0xFF4B5A63);
  static const muted = Color(0xFF7C8B91);

  static const paper = Color(0xFFFFFFFF);
  static const paperDim = Color(0xFFF5F7F8);
  static const cardBg = Color(0xFFE6E8E9);

  static const line = Color(0xFFD7E0DF);

  static const danger = Color(0xFFC0392B);
  static const amber = Color(0xFF9A6A26);
}
