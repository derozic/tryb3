import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidePageTransition extends CustomTransitionPage<void> {
  final Offset begin;
  final Offset end;
  final Curve curve;

  SlidePageTransition({
    required Widget child,
    required String name,
    Object? arguments,
    String? restorationId,
    this.begin = const Offset(1.0, 0.0),
    this.end = Offset.zero,
    this.curve = Curves.easeInOutCubic,
  }) : super(
          child: child,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: begin,
                end: end,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: curve,
              )),
              child: child,
            );
          },
        );
}

class FadePageTransition extends CustomTransitionPage<void> {
  final Curve curve;

  FadePageTransition({
    required Widget child,
    required String name,
    Object? arguments,
    String? restorationId,
    this.curve = Curves.easeInOut,
  }) : super(
          child: child,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
              child: child,
            );
          },
        );
}

class ScalePageTransition extends CustomTransitionPage<void> {
  final double begin;
  final double end;
  final Curve curve;

  ScalePageTransition({
    required Widget child,
    required String name,
    Object? arguments,
    String? restorationId,
    this.begin = 0.0,
    this.end = 1.0,
    this.curve = Curves.elasticOut,
  }) : super(
          child: child,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
          transitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: Tween<double>(
                begin: begin,
                end: end,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: curve,
              )),
              child: child,
            );
          },
        );
}

class SharedAxisTransition extends CustomTransitionPage<void> {
  final SharedAxisTransitionType transitionType;
  final bool fillColor;

  SharedAxisTransition({
    required Widget child,
    required String name,
    Object? arguments,
    String? restorationId,
    this.transitionType = SharedAxisTransitionType.horizontal,
    this.fillColor = true,
  }) : super(
          child: child,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisPageTransitionsBuilder(
              transitionType: transitionType,
              fillColor: fillColor ? Theme.of(context).scaffoldBackgroundColor : null,
            ).buildTransitions(
              null, // PageRoute not needed for this implementation
              context,
              animation,
              secondaryAnimation,
              child,
            );
          },
        );
}

// Custom implementation of shared axis transition
class SharedAxisPageTransitionsBuilder extends PageTransitionsBuilder {
  final SharedAxisTransitionType transitionType;
  final Color? fillColor;

  const SharedAxisPageTransitionsBuilder({
    required this.transitionType,
    this.fillColor,
  });

  @override
  Widget buildTransitions<T extends Object?>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: transitionType,
      fillColor: fillColor,
      child: child,
    );
  }
}

class _SharedAxisTransition extends StatelessWidget {
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final SharedAxisTransitionType transitionType;
  final Color? fillColor;
  final Widget child;

  const _SharedAxisTransition({
    required this.animation,
    required this.secondaryAnimation,
    required this.transitionType,
    this.fillColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DualTransitionBuilder(
      animation: animation,
      forwardBuilder: (context, animation, child) {
        return _buildForwardTransition(animation, child!);
      },
      reverseBuilder: (context, animation, child) {
        return _buildReverseTransition(animation, child!);
      },
      child: child,
    );
  }

  Widget _buildForwardTransition(Animation<double> animation, Widget child) {
    switch (transitionType) {
      case SharedAxisTransitionType.horizontal:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.3, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          )),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      case SharedAxisTransitionType.vertical:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.3),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          )),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      case SharedAxisTransitionType.scaled:
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.8,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          )),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
    }
  }

  Widget _buildReverseTransition(Animation<double> animation, Widget child) {
    switch (transitionType) {
      case SharedAxisTransitionType.horizontal:
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-0.3, 0),
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          )),
          child: FadeTransition(
            opacity: ReverseAnimation(animation),
            child: child,
          ),
        );
      case SharedAxisTransitionType.vertical:
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(0, -0.3),
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          )),
          child: FadeTransition(
            opacity: ReverseAnimation(animation),
            child: child,
          ),
        );
      case SharedAxisTransitionType.scaled:
        return ScaleTransition(
          scale: Tween<double>(
            begin: 1.0,
            end: 1.1,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          )),
          child: FadeTransition(
            opacity: ReverseAnimation(animation),
            child: child,
          ),
        );
    }
  }
}

enum SharedAxisTransitionType {
  horizontal,
  vertical,
  scaled,
}

class ModalPageTransition extends CustomTransitionPage<void> {
  ModalPageTransition({
    required Widget child,
    required String name,
    Object? arguments,
    String? restorationId,
  }) : super(
          child: child,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
          opaque: false,
          barrierColor: Colors.black54,
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}