import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import 'tux_button.dart';

enum TuxModalSize { small, medium, large, fullscreen }

class TuxModal extends StatefulWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final TuxModalSize size;
  final bool isDismissible;
  final bool showCloseButton;
  final VoidCallback? onClose;
  final Color? backgroundColor;
  final double? borderRadius;
  final bool isScrollable;

  const TuxModal({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.size = TuxModalSize.medium,
    this.isDismissible = true,
    this.showCloseButton = true,
    this.onClose,
    this.backgroundColor,
    this.borderRadius,
    this.isScrollable = true,
  });

  @override
  State<TuxModal> createState() => _TuxModalState();

  static Future<T?> show<T>({
    required BuildContext context,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    TuxModalSize size = TuxModalSize.medium,
    bool isDismissible = true,
    bool showCloseButton = true,
    VoidCallback? onClose,
    Color? backgroundColor,
    double? borderRadius,
    bool isScrollable = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => TuxModal(
        title: title,
        content: content,
        actions: actions,
        size: size,
        isDismissible: isDismissible,
        showCloseButton: showCloseButton,
        onClose: onClose,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
        isScrollable: isScrollable,
      ),
    );
  }
}

class _TuxModalState extends State<TuxModal> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleClose() {
    _animationController.reverse().then((_) {
      widget.onClose?.call();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: _getInsetPadding(mediaQuery),
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                constraints: _getConstraints(mediaQuery),
                decoration: BoxDecoration(
                  color: widget.backgroundColor ?? theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
                  child: _buildModalContent(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildModalContent() {
    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.title != null || widget.showCloseButton)
          _buildHeader(),
        if (widget.content != null)
          _buildBody(),
        if (widget.actions != null && widget.actions!.isNotEmpty)
          _buildActions(),
      ],
    );

    if (widget.isScrollable && widget.size != TuxModalSize.fullscreen) {
      content = SingleChildScrollView(child: content);
    }

    return content;
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(TuxSpacing.lg),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: TuxColors.borderLight,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          if (widget.title != null)
            Expanded(
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.headlineSmall!,
                child: widget.title!,
              ),
            ),
          if (widget.showCloseButton)
            IconButton(
              onPressed: widget.isDismissible ? _handleClose : null,
              icon: const Icon(Icons.close),
              tooltip: 'Close',
            ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(TuxSpacing.lg),
        child: widget.content!,
      ),
    );
  }

  Widget _buildActions() {
    return Container(
      padding: const EdgeInsets.all(TuxSpacing.lg),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: TuxColors.borderLight,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: widget.actions!.map((action) {
          final index = widget.actions!.indexOf(action);
          return Padding(
            padding: EdgeInsets.only(
              left: index > 0 ? TuxSpacing.sm : 0,
            ),
            child: action,
          );
        }).toList(),
      ),
    );
  }

  EdgeInsets _getInsetPadding(MediaQueryData mediaQuery) {
    switch (widget.size) {
      case TuxModalSize.small:
        return const EdgeInsets.symmetric(horizontal: 80, vertical: 120);
      case TuxModalSize.medium:
        return const EdgeInsets.symmetric(horizontal: 40, vertical: 80);
      case TuxModalSize.large:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 40);
      case TuxModalSize.fullscreen:
        return EdgeInsets.zero;
    }
  }

  BoxConstraints _getConstraints(MediaQueryData mediaQuery) {
    switch (widget.size) {
      case TuxModalSize.small:
        return const BoxConstraints(
          maxWidth: 400,
          maxHeight: 300,
        );
      case TuxModalSize.medium:
        return BoxConstraints(
          maxWidth: 600,
          maxHeight: mediaQuery.size.height * 0.8,
        );
      case TuxModalSize.large:
        return BoxConstraints(
          maxWidth: 800,
          maxHeight: mediaQuery.size.height * 0.9,
        );
      case TuxModalSize.fullscreen:
        return BoxConstraints(
          maxWidth: mediaQuery.size.width,
          maxHeight: mediaQuery.size.height,
        );
    }
  }
}

class TuxConfirmDialog extends StatelessWidget {
  final String? title;
  final String message;
  final String confirmText;
  final String cancelText;
  final Color? confirmColor;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const TuxConfirmDialog({
    super.key,
    this.title,
    required this.message,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.confirmColor,
    this.onConfirm,
    this.onCancel,
  });

  static Future<bool?> show({
    required BuildContext context,
    String? title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    Color? confirmColor,
  }) {
    return TuxModal.show<bool>(
      context: context,
      title: title != null ? Text(title) : null,
      content: Text(message),
      actions: [
        TuxButton(
          text: cancelText,
          variant: TuxButtonVariant.ghost,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TuxButton(
          text: confirmText,
          variant: TuxButtonVariant.primary,
          backgroundColor: confirmColor,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TuxModal(
      title: title != null ? Text(title!) : null,
      content: Text(message),
      actions: [
        TuxButton(
          text: cancelText,
          variant: TuxButtonVariant.ghost,
          onPressed: () {
            onCancel?.call();
            Navigator.of(context).pop(false);
          },
        ),
        TuxButton(
          text: confirmText,
          variant: TuxButtonVariant.primary,
          backgroundColor: confirmColor,
          onPressed: () {
            onConfirm?.call();
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}