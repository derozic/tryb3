import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';

enum TuxInputSize { small, medium, large }

class TuxInput extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final bool enabled;
  final bool readOnly;
  final TuxInputSize size;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int? maxLength;
  final bool autofocus;

  const TuxInput({
    super.key,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.prefix,
    this.suffix,
    this.enabled = true,
    this.readOnly = false,
    this.size = TuxInputSize.medium,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.maxLines = 1,
    this.maxLength,
    this.autofocus = false,
  });

  @override
  State<TuxInput> createState() => _TuxInputState();
}

class _TuxInputState extends State<TuxInput> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    _hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: TuxColors.textPrimary,
            ),
          ),
          const SizedBox(height: TuxSpacing.xs),
        ],
        Container(
          height: _getHeight(),
          decoration: BoxDecoration(
            color: widget.enabled
                ? (_isFocused ? Colors.white : TuxColors.gray50)
                : TuxColors.gray100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _getBorderColor(),
              width: _isFocused ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              if (widget.prefix != null) ...[
                Padding(
                  padding: const EdgeInsets.only(left: TuxSpacing.sm),
                  child: widget.prefix,
                ),
              ],
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  enabled: widget.enabled,
                  readOnly: widget.readOnly,
                  obscureText: widget.obscureText,
                  keyboardType: widget.keyboardType,
                  maxLines: widget.maxLines,
                  maxLength: widget.maxLength,
                  autofocus: widget.autofocus,
                  onChanged: widget.onChanged,
                  onEditingComplete: widget.onEditingComplete,
                  validator: widget.validator,
                  style: TextStyle(
                    fontSize: _getFontSize(),
                    color: widget.enabled ? TuxColors.textPrimary : TuxColors.textTertiary,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    hintStyle: TextStyle(
                      fontSize: _getFontSize(),
                      color: TuxColors.textTertiary,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: TuxSpacing.sm,
                      vertical: _getVerticalPadding(),
                    ),
                    counterText: '',
                  ),
                ),
              ),
              if (widget.suffix != null) ...[
                Padding(
                  padding: const EdgeInsets.only(right: TuxSpacing.sm),
                  child: widget.suffix,
                ),
              ],
            ],
          ),
        ),
        if (widget.helperText != null && !_hasError) ...[
          const SizedBox(height: TuxSpacing.xs),
          Text(
            widget.helperText!,
            style: TextStyle(
              fontSize: 12,
              color: TuxColors.textSecondary,
            ),
          ),
        ],
        if (_hasError) ...[
          const SizedBox(height: TuxSpacing.xs),
          Text(
            widget.errorText!,
            style: TextStyle(
              fontSize: 12,
              color: TuxColors.error,
            ),
          ),
        ],
      ],
    );
  }

  double _getHeight() {
    switch (widget.size) {
      case TuxInputSize.small:
        return 32;
      case TuxInputSize.medium:
        return 40;
      case TuxInputSize.large:
        return 48;
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case TuxInputSize.small:
        return 14;
      case TuxInputSize.medium:
        return 16;
      case TuxInputSize.large:
        return 18;
    }
  }

  double _getVerticalPadding() {
    switch (widget.size) {
      case TuxInputSize.small:
        return 4;
      case TuxInputSize.medium:
        return 8;
      case TuxInputSize.large:
        return 12;
    }
  }

  Color _getBorderColor() {
    if (_hasError) {
      return TuxColors.error;
    }
    if (_isFocused) {
      return TuxColors.primary;
    }
    if (!widget.enabled) {
      return TuxColors.gray200;
    }
    return TuxColors.borderLight;
  }
}