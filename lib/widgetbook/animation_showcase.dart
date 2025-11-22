import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import '../features/animations/widgets/fade_in_animation.dart';
import '../tux/components/tux_card.dart';
import '../tux/components/tux_button.dart';
import '../tux/theme/tux_spacing.dart';

@UseCase(
  name: 'Fade In Animation',
  type: FadeInAnimation,
  description: 'Basic fade in animation widget',
)
Widget fadeInAnimationUseCase(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Fade In Animation')),
    body: Padding(
      padding: const EdgeInsets.all(TuxSpacing.lg),
      child: Column(
        children: [
          FadeInAnimation(
            duration: const Duration(milliseconds: 800),
            child: TuxCard(
              header: const Text('Animated Card'),
              body: const Text('This card fades in when the page loads.'),
            ),
          ),
          const SizedBox(height: TuxSpacing.lg),
          FadeInAnimation(
            delay: const Duration(milliseconds: 400),
            duration: const Duration(milliseconds: 600),
            child: TuxButton(
              text: 'Delayed Button',
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
  );
}

@UseCase(
  name: 'Fade In Slide Animation',
  type: FadeInSlideAnimation,
  description: 'Combined fade and slide animation',
)
Widget fadeInSlideAnimationUseCase(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Fade In Slide Animation')),
    body: Padding(
      padding: const EdgeInsets.all(TuxSpacing.lg),
      child: Column(
        children: [
          FadeInSlideAnimation(
            begin: const Offset(0, 0.5),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutBack,
            child: TuxCard(
              header: const Text('Slide from Bottom'),
              body: const Text('This card slides up while fading in.'),
            ),
          ),
          const SizedBox(height: TuxSpacing.lg),
          FadeInSlideAnimation(
            begin: const Offset(-0.3, 0),
            delay: const Duration(milliseconds: 300),
            child: TuxCard(
              header: const Text('Slide from Left'),
              body: const Text('This card slides from the left.'),
            ),
          ),
          const SizedBox(height: TuxSpacing.lg),
          FadeInSlideAnimation(
            begin: const Offset(0.3, 0),
            delay: const Duration(milliseconds: 600),
            child: TuxCard(
              header: const Text('Slide from Right'),
              body: const Text('This card slides from the right.'),
            ),
          ),
        ],
      ),
    ),
  );
}

@UseCase(
  name: 'Scale In Animation',
  type: ScaleInAnimation,
  description: 'Scale animation with elastic effect',
)
Widget scaleInAnimationUseCase(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Scale In Animation')),
    body: Padding(
      padding: const EdgeInsets.all(TuxSpacing.lg),
      child: Column(
        children: [
          ScaleInAnimation(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.elasticOut,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.star,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: TuxSpacing.lg),
          ScaleInAnimation(
            delay: const Duration(milliseconds: 300),
            curve: Curves.bounceOut,
            child: TuxCard(
              header: const Text('Bouncy Card'),
              body: const Text('This card bounces in with a scale animation.'),
            ),
          ),
        ],
      ),
    ),
  );
}

@UseCase(
  name: 'Staggered List Animation',
  type: StaggeredListAnimation,
  description: 'Animated list with staggered item animations',
)
Widget staggeredListAnimationUseCase(BuildContext context) {
  final items = List.generate(6, (index) => 'Item ${index + 1}');

  return Scaffold(
    appBar: AppBar(title: const Text('Staggered List Animation')),
    body: Padding(
      padding: const EdgeInsets.all(TuxSpacing.lg),
      child: StaggeredListAnimation(
        itemDelay: const Duration(milliseconds: 150),
        children: items.map((item) => 
          Padding(
            padding: const EdgeInsets.only(bottom: TuxSpacing.md),
            child: TuxCard(
              body: Padding(
                padding: const EdgeInsets.all(TuxSpacing.md),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        item.split(' ').last,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: TuxSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: TuxSpacing.xs),
                          Text(
                            'This is the description for $item',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ).toList(),
      ),
    ),
  );
}

@UseCase(
  name: 'Animated Counter',
  type: AnimatedCounter,
  description: 'Number animation with custom formatting',
)
Widget animatedCounterUseCase(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Animated Counter')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TuxCard(
            header: const Text('User Statistics'),
            body: Column(
              children: [
                _StatRow(
                  label: 'Total Users',
                  value: 1247,
                  icon: Icons.people,
                ),
                const SizedBox(height: TuxSpacing.md),
                _StatRow(
                  label: 'Active Sessions',
                  value: 89,
                  icon: Icons.wifi,
                ),
                const SizedBox(height: TuxSpacing.md),
                _StatRow(
                  label: 'Messages Sent',
                  value: 15623,
                  suffix: '+',
                  icon: Icons.message,
                ),
                const SizedBox(height: TuxSpacing.md),
                _StatRow(
                  label: 'Storage Used',
                  value: 73,
                  suffix: '%',
                  icon: Icons.storage,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class _StatRow extends StatelessWidget {
  final String label;
  final int value;
  final String suffix;
  final IconData icon;

  const _StatRow({
    required this.label,
    required this.value,
    this.suffix = '',
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        const SizedBox(width: TuxSpacing.md),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        AnimatedCounter(
          value: value,
          suffix: suffix,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
          duration: const Duration(milliseconds: 2000),
        ),
      ],
    );
  }
}

@UseCase(
  name: 'Combined Animations Demo',
  type: Widget,
  description: 'Showcase multiple animations together',
)
Widget combinedAnimationsUseCase(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Combined Animations')),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(TuxSpacing.lg),
      child: Column(
        children: [
          // Header with scale animation
          ScaleInAnimation(
            curve: Curves.elasticOut,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(TuxSpacing.lg),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Welcome to Animations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          
          const SizedBox(height: TuxSpacing.xl),
          
          // Stats section with counters
          FadeInSlideAnimation(
            delay: const Duration(milliseconds: 400),
            child: TuxCard(
              header: const Text('Live Statistics'),
              body: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _AnimatedStat(
                        label: 'Users',
                        value: 2847,
                        icon: Icons.people,
                        delay: 500,
                      ),
                      _AnimatedStat(
                        label: 'Posts',
                        value: 1523,
                        icon: Icons.article,
                        delay: 700,
                      ),
                      _AnimatedStat(
                        label: 'Likes',
                        value: 9876,
                        icon: Icons.favorite,
                        delay: 900,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: TuxSpacing.xl),
          
          // Staggered feature list
          StaggeredListAnimation(
            itemDelay: const Duration(milliseconds: 200),
            children: [
              _FeatureCard(
                title: 'Real-time Updates',
                description: 'Get instant notifications and live data updates.',
                icon: Icons.flash_on,
                color: Colors.orange,
              ),
              _FeatureCard(
                title: 'Secure & Private',
                description: 'Your data is encrypted and protected.',
                icon: Icons.security,
                color: Colors.green,
              ),
              _FeatureCard(
                title: 'Beautiful Design',
                description: 'Enjoy a modern and intuitive interface.',
                icon: Icons.palette,
                color: Colors.purple,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class _AnimatedStat extends StatelessWidget {
  final String label;
  final int value;
  final IconData icon;
  final int delay;

  const _AnimatedStat({
    required this.label,
    required this.value,
    required this.icon,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaleInAnimation(
      delay: Duration(milliseconds: delay),
      child: Column(
        children: [
          Icon(
            icon,
            size: 32,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: TuxSpacing.sm),
          AnimatedCounter(
            value: value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: TuxSpacing.xs),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: TuxSpacing.md),
      child: TuxCard(
        body: Padding(
          padding: const EdgeInsets.all(TuxSpacing.md),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(width: TuxSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: TuxSpacing.xs),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}