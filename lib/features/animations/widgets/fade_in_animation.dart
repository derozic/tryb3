import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final bool autoStart;

  const FadeInAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
    this.autoStart = true,
  }) : super(key: key);

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    if (widget.autoStart) {
      _startAnimation();
    }
  }

  Future<void> _startAnimation() async {
    if (widget.delay != Duration.zero) {
      await Future.delayed(widget.delay);
    }
    if (mounted) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

class FadeInSlideAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final Offset begin;
  final Offset end;
  final bool autoStart;

  const FadeInSlideAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay = Duration.zero,
    this.curve = Curves.easeOutCubic,
    this.begin = const Offset(0, 0.3),
    this.end = Offset.zero,
    this.autoStart = true,
  }) : super(key: key);

  @override
  State<FadeInSlideAnimation> createState() => _FadeInSlideAnimationState();
}

class _FadeInSlideAnimationState extends State<FadeInSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _slideAnimation = Tween<Offset>(
      begin: widget.begin,
      end: widget.end,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    if (widget.autoStart) {
      _startAnimation();
    }
  }

  Future<void> _startAnimation() async {
    if (widget.delay != Duration.zero) {
      await Future.delayed(widget.delay);
    }
    if (mounted) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: widget.child,
      ),
    );
  }
}

class ScaleInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final double begin;
  final double end;
  final bool autoStart;

  const ScaleInAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.curve = Curves.elasticOut,
    this.begin = 0.0,
    this.end = 1.0,
    this.autoStart = true,
  }) : super(key: key);

  @override
  State<ScaleInAnimation> createState() => _ScaleInAnimationState();
}

class _ScaleInAnimationState extends State<ScaleInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: widget.begin,
      end: widget.end,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    if (widget.autoStart) {
      _startAnimation();
    }
  }

  Future<void> _startAnimation() async {
    if (widget.delay != Duration.zero) {
      await Future.delayed(widget.delay);
    }
    if (mounted) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}

class StaggeredListAnimation extends StatelessWidget {
  final List<Widget> children;
  final Duration itemDelay;
  final Duration itemDuration;
  final Curve curve;
  final Axis axis;

  const StaggeredListAnimation({
    Key? key,
    required this.children,
    this.itemDelay = const Duration(milliseconds: 100),
    this.itemDuration = const Duration(milliseconds: 600),
    this.curve = Curves.easeOutCubic,
    this.axis = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(children.length, (index) {
        return FadeInSlideAnimation(
          delay: Duration(milliseconds: index * itemDelay.inMilliseconds),
          duration: itemDuration,
          curve: curve,
          begin: axis == Axis.vertical 
              ? const Offset(0, 0.3) 
              : const Offset(0.3, 0),
          child: children[index],
        );
      }),
    );
  }
}

class AnimatedCounter extends StatefulWidget {
  final int value;
  final Duration duration;
  final TextStyle? style;
  final String prefix;
  final String suffix;

  const AnimatedCounter({
    Key? key,
    required this.value,
    this.duration = const Duration(milliseconds: 1200),
    this.style,
    this.prefix = '',
    this.suffix = '',
  }) : super(key: key);

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _previousValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _startAnimation();
  }

  @override
  void didUpdateWidget(AnimatedCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _previousValue = oldWidget.value;
      _controller.reset();
      _startAnimation();
    }
  }

  void _startAnimation() {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final currentValue = _previousValue + 
            (_animation.value * (widget.value - _previousValue));
        
        return Text(
          '${widget.prefix}${currentValue.toInt()}${widget.suffix}',
          style: widget.style,
        );
      },
    );
  }
}