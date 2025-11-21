import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';

enum TuxButtonVariant { primary, secondary, ghost, danger }
enum TuxButtonSize { small, medium, large }

class TuxButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final TuxButtonVariant variant;
  final TuxButtonSize size;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool isLoading;
  final bool isFullWidth;
  final bool isDisabled;

  const TuxButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = TuxButtonVariant.primary,
    this.size = TuxButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = !isDisabled && !isLoading && onPressed != null;
    
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: _getHeight(),
      child: Material(
        color: _getBackgroundColor(isEnabled),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          borderRadius: BorderRadius.circular(8),
          splashColor: _getSplashColor(),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: _getHorizontalPadding(),
              vertical: _getVerticalPadding(),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: _getBorder(),
            ),
            child: Row(
              mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) ...[
                  SizedBox(
                    width: _getIconSize(),
                    height: _getIconSize(),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getTextColor(isEnabled),
                      ),
                    ),
                  ),
                  const SizedBox(width: TuxSpacing.xs),
                ] else if (leadingIcon != null) ...[
                  Icon(
                    leadingIcon,
                    size: _getIconSize(),
                    color: _getTextColor(isEnabled),
                  ),
                  const SizedBox(width: TuxSpacing.xs),
                ],
                Text(
                  label,
                  style: TextStyle(
                    fontSize: _getFontSize(),
                    fontWeight: FontWeight.w600,
                    color: _getTextColor(isEnabled),
                  ),
                ),
                if (trailingIcon != null && !isLoading) ...[
                  const SizedBox(width: TuxSpacing.xs),
                  Icon(
                    trailingIcon,
                    size: _getIconSize(),
                    color: _getTextColor(isEnabled),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case TuxButtonSize.small:
        return 32;
      case TuxButtonSize.medium:
        return 40;
      case TuxButtonSize.large:
        return 48;
    }
  }

  double _getHorizontalPadding() {
    switch (size) {
      case TuxButtonSize.small:
        return TuxSpacing.sm;
      case TuxButtonSize.medium:
        return TuxSpacing.md;
      case TuxButtonSize.large:
        return TuxSpacing.lg;
    }
  }

  double _getVerticalPadding() {
    switch (size) {
      case TuxButtonSize.small:
        return TuxSpacing.xs;
      case TuxButtonSize.medium:
        return TuxSpacing.sm;
      case TuxButtonSize.large:
        return TuxSpacing.md;
    }
  }

  double _getFontSize() {
    switch (size) {
      case TuxButtonSize.small:
        return 14;
      case TuxButtonSize.medium:
        return 16;
      case TuxButtonSize.large:
        return 18;
    }
  }

  double _getIconSize() {
    switch (size) {
      case TuxButtonSize.small:
        return 16;
      case TuxButtonSize.medium:
        return 20;
      case TuxButtonSize.large:
        return 24;
    }
  }

  Color _getBackgroundColor(bool isEnabled) {
    if (!isEnabled) {
      return TuxColors.gray200;
    }
    
    switch (variant) {
      case TuxButtonVariant.primary:
        return TuxColors.primary;
      case TuxButtonVariant.secondary:
        return TuxColors.secondary;
      case TuxButtonVariant.ghost:
        return Colors.transparent;
      case TuxButtonVariant.danger:
        return TuxColors.error;
    }
  }

  Color _getTextColor(bool isEnabled) {
    if (!isEnabled) {
      return TuxColors.gray400;
    }
    
    switch (variant) {
      case TuxButtonVariant.primary:
      case TuxButtonVariant.secondary:
      case TuxButtonVariant.danger:
        return Colors.white;
      case TuxButtonVariant.ghost:
        return TuxColors.primary;
    }
  }

  Color _getSplashColor() {
    switch (variant) {
      case TuxButtonVariant.primary:
        return TuxColors.primaryLight.withOpacity(0.2);
      case TuxButtonVariant.secondary:
        return TuxColors.secondaryLight.withOpacity(0.2);
      case TuxButtonVariant.ghost:
        return TuxColors.primary.withOpacity(0.1);
      case TuxButtonVariant.danger:
        return TuxColors.errorLight.withOpacity(0.2);
    }
  }

  Border? _getBorder() {
    if (variant == TuxButtonVariant.ghost) {
      return Border.all(color: TuxColors.borderDefault, width: 1);
    }
    return null;
  }
}