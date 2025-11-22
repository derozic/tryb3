import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';

enum TuxToastType { info, success, warning, error }
enum TuxToastPosition { top, bottom }

class TuxToast extends StatefulWidget {
  final String message;
  final TuxToastType type;
  final Duration duration;
  final VoidCallback? onDismiss;
  final Widget? action;
  final bool showCloseButton;
  final IconData? icon;

  const TuxToast({
    super.key,
    required this.message,
    this.type = TuxToastType.info,
    this.duration = const Duration(seconds: 4),
    this.onDismiss,
    this.action,
    this.showCloseButton = true,
    this.icon,
  });

  @override
  State<TuxToast> createState() => _TuxToastState();

  static void show({
    required BuildContext context,
    required String message,
    TuxToastType type = TuxToastType.info,
    Duration duration = const Duration(seconds: 4),
    VoidCallback? onDismiss,
    Widget? action,
    bool showCloseButton = true,
    IconData? icon,
    TuxToastPosition position = TuxToastPosition.bottom,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => _TuxToastOverlay(
        toast: TuxToast(
          message: message,
          type: type,
          duration: duration,
          onDismiss: () {
            onDismiss?.call();
            overlayEntry.remove();
          },
          action: action,
          showCloseButton: showCloseButton,
          icon: icon,
        ),
        position: position,
        onRemove: () => overlayEntry.remove(),
      ),
    );

    overlay.insert(overlayEntry);
  }

  static void showSuccess({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onDismiss,
    Widget? action,
    TuxToastPosition position = TuxToastPosition.bottom,
  }) {
    show(
      context: context,
      message: message,
      type: TuxToastType.success,
      duration: duration,
      onDismiss: onDismiss,
      action: action,
      position: position,
      icon: Icons.check_circle,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 5),
    VoidCallback? onDismiss,
    Widget? action,
    TuxToastPosition position = TuxToastPosition.bottom,
  }) {
    show(
      context: context,
      message: message,
      type: TuxToastType.error,
      duration: duration,
      onDismiss: onDismiss,
      action: action,
      position: position,
      icon: Icons.error,
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
    VoidCallback? onDismiss,
    Widget? action,
    TuxToastPosition position = TuxToastPosition.bottom,
  }) {
    show(
      context: context,
      message: message,
      type: TuxToastType.warning,
      duration: duration,
      onDismiss: onDismiss,
      action: action,
      position: position,
      icon: Icons.warning,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
    VoidCallback? onDismiss,
    Widget? action,
    TuxToastPosition position = TuxToastPosition.bottom,
  }) {
    show(
      context: context,
      message: message,
      type: TuxToastType.info,
      duration: duration,
      onDismiss: onDismiss,
      action: action,
      position: position,
      icon: Icons.info,
    );
  }
}

class _TuxToastState extends State<TuxToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();

    if (widget.duration != Duration.zero) {
      Future.delayed(widget.duration, () {
        _dismiss();
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _dismiss() {
    _animationController.reverse().then((_) {
      widget.onDismiss?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: TuxSpacing.md,
                  vertical: TuxSpacing.xs,
                ),
                padding: const EdgeInsets.all(TuxSpacing.md),
                decoration: BoxDecoration(
                  color: _getBackgroundColor(),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    if (widget.icon != null) ...[
                      Icon(
                        widget.icon,
                        color: _getIconColor(),
                        size: 20,
                      ),
                      const SizedBox(width: TuxSpacing.sm),
                    ],
                    Expanded(
                      child: Text(
                        widget.message,
                        style: TextStyle(
                          color: _getTextColor(),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (widget.action != null) ...[
                      const SizedBox(width: TuxSpacing.sm),
                      widget.action!,
                    ],
                    if (widget.showCloseButton) ...[
                      const SizedBox(width: TuxSpacing.sm),
                      InkWell(
                        onTap: _dismiss,
                        borderRadius: BorderRadius.circular(4),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: _getTextColor().withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getBackgroundColor() {
    switch (widget.type) {
      case TuxToastType.success:
        return const Color(0xFF10B981);
      case TuxToastType.error:
        return const Color(0xFFEF4444);
      case TuxToastType.warning:
        return const Color(0xFFF59E0B);
      case TuxToastType.info:
        return TuxColors.primary;
    }
  }

  Color _getTextColor() {
    return Colors.white;
  }

  Color _getIconColor() {
    return Colors.white;
  }
}

class _TuxToastOverlay extends StatefulWidget {
  final TuxToast toast;
  final TuxToastPosition position;
  final VoidCallback onRemove;

  const _TuxToastOverlay({
    required this.toast,
    required this.position,
    required this.onRemove,
  });

  @override
  State<_TuxToastOverlay> createState() => _TuxToastOverlayState();
}

class _TuxToastOverlayState extends State<_TuxToastOverlay> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: widget.position == TuxToastPosition.top
          ? MediaQuery.of(context).padding.top + TuxSpacing.lg
          : null,
      bottom: widget.position == TuxToastPosition.bottom
          ? MediaQuery.of(context).padding.bottom + TuxSpacing.lg
          : null,
      child: Material(
        color: Colors.transparent,
        child: TuxToast(
          message: widget.toast.message,
          type: widget.toast.type,
          duration: widget.toast.duration,
          onDismiss: widget.onRemove,
          action: widget.toast.action,
          showCloseButton: widget.toast.showCloseButton,
          icon: widget.toast.icon,
        ),
      ),
    );
  }
}

class TuxSnackBar extends StatelessWidget {
  final String message;
  final TuxToastType type;
  final Widget? action;
  final Duration duration;

  const TuxSnackBar({
    super.key,
    required this.message,
    this.type = TuxToastType.info,
    this.action,
    this.duration = const Duration(seconds: 4),
  });

  static void show({
    required BuildContext context,
    required String message,
    TuxToastType type = TuxToastType.info,
    Widget? action,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TuxSnackBar(
          message: message,
          type: type,
          action: action,
          duration: duration,
        ),
        duration: duration,
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TuxSpacing.md),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            _getIcon(),
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: TuxSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (action != null) ...[
            const SizedBox(width: TuxSpacing.sm),
            action!,
          ],
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case TuxToastType.success:
        return const Color(0xFF10B981);
      case TuxToastType.error:
        return const Color(0xFFEF4444);
      case TuxToastType.warning:
        return const Color(0xFFF59E0B);
      case TuxToastType.info:
        return TuxColors.primary;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case TuxToastType.success:
        return Icons.check_circle;
      case TuxToastType.error:
        return Icons.error;
      case TuxToastType.warning:
        return Icons.warning;
      case TuxToastType.info:
        return Icons.info;
    }
  }
}