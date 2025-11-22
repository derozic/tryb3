import 'package:flutter/material.dart';

import '../../../../tux/theme/tux_spacing.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey[300],
          child: Icon(
            Icons.person,
            size: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(width: TuxSpacing.sm),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: TuxSpacing.md,
            vertical: TuxSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomRight: Radius.circular(18),
              bottomLeft: Radius.circular(4),
            ),
            border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildDot(0),
                      const SizedBox(width: 4),
                      _buildDot(0.2),
                      const SizedBox(width: 4),
                      _buildDot(0.4),
                    ],
                  );
                },
              ),
              const SizedBox(width: TuxSpacing.sm),
              Text(
                'typing...',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDot(double delay) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final value = (_animation.value - delay).clamp(0.0, 1.0);
        final opacity = (Curves.easeInOut.transform(value) * 2 - 1).abs();
        
        return Opacity(
          opacity: 0.3 + (opacity * 0.7),
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}