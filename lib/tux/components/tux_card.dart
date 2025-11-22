import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';

enum TuxCardVariant { elevated, outlined, filled }

class TuxCard extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final List<Widget>? actions;
  final TuxCardVariant variant;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final bool showDividers;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;

  const TuxCard({
    super.key,
    this.header,
    this.body,
    this.footer,
    this.actions,
    this.variant = TuxCardVariant.elevated,
    this.padding,
    this.onTap,
    this.showDividers = false,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final effectivePadding = padding ?? const EdgeInsets.all(TuxSpacing.md);
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(12);
    
    Widget cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (header != null) ...[
          Padding(
            padding: effectivePadding.copyWith(bottom: 0),
            child: header!,
          ),
          if (showDividers && (body != null || footer != null)) 
            const Divider(height: 1),
        ],
        if (body != null) ...[
          Padding(
            padding: effectivePadding.copyWith(
              top: header != null ? TuxSpacing.sm : effectivePadding.top,
              bottom: footer != null || actions != null ? TuxSpacing.sm : effectivePadding.bottom,
            ),
            child: body!,
          ),
        ],
        if (footer != null) ...[
          if (showDividers && (header != null || body != null))
            const Divider(height: 1),
          Padding(
            padding: effectivePadding.copyWith(
              top: body != null ? TuxSpacing.sm : effectivePadding.top,
              bottom: actions != null ? TuxSpacing.sm : effectivePadding.bottom,
            ),
            child: footer!,
          ),
        ],
        if (actions != null) ...[
          if (showDividers && (header != null || body != null || footer != null))
            const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(TuxSpacing.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions!.map((action) => 
                Padding(
                  padding: const EdgeInsets.only(left: TuxSpacing.xs),
                  child: action,
                )
              ).toList(),
            ),
          ),
        ],
      ],
    );

    return Material(
      color: _getBackgroundColor(),
      elevation: _getElevation(),
      borderRadius: effectiveBorderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: effectiveBorderRadius,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: effectiveBorderRadius,
            border: _getBorder(),
          ),
          child: cardContent,
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;
    
    switch (variant) {
      case TuxCardVariant.elevated:
        return Colors.white;
      case TuxCardVariant.outlined:
        return Colors.white;
      case TuxCardVariant.filled:
        return TuxColors.gray50;
    }
  }

  double _getElevation() {
    if (elevation != null) return elevation!;
    
    switch (variant) {
      case TuxCardVariant.elevated:
        return 2;
      case TuxCardVariant.outlined:
        return 0;
      case TuxCardVariant.filled:
        return 0;
    }
  }

  Border? _getBorder() {
    switch (variant) {
      case TuxCardVariant.elevated:
        return null;
      case TuxCardVariant.outlined:
        return Border.all(color: TuxColors.borderLight);
      case TuxCardVariant.filled:
        return null;
    }
  }
}