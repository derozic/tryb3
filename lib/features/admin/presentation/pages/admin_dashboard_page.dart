import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../tux/components/tux_card.dart';
import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../providers/admin_provider.dart';
import '../widgets/dashboard_stats_widget.dart';
import '../widgets/pending_users_widget.dart';
import '../widgets/system_health_widget.dart';

class AdminDashboardPage extends ConsumerWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final dashboardState = ref.watch(adminDashboardProvider);
    final pendingUsersState = ref.watch(pendingUsersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(adminDashboardProvider.notifier).refresh();
              ref.read(pendingUsersProvider.notifier).refresh();
              ref.read(systemHealthProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(adminDashboardProvider.notifier).refresh();
          ref.read(pendingUsersProvider.notifier).refresh();
          ref.read(systemHealthProvider.notifier).refresh();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(TuxSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quick Actions
              _QuickActionsSection(),
              const SizedBox(height: TuxSpacing.xl),

              // Dashboard Stats
              dashboardState.when(
                data: (stats) => DashboardStatsWidget(stats: stats),
                loading: () => const _LoadingCard('Loading dashboard stats...'),
                error: (error, stack) => _ErrorCard(
                  'Failed to load dashboard stats',
                  error.toString(),
                ),
              ),
              const SizedBox(height: TuxSpacing.xl),

              // Pending Users Quick View
              Text(
                'Pending User Approvals',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: TuxSpacing.md),
              pendingUsersState.when(
                data: (users) => PendingUsersWidget(
                  users: users.take(5).toList(),
                  showViewAll: users.length > 5,
                ),
                loading: () => const _LoadingCard('Loading pending users...'),
                error: (error, stack) => _ErrorCard(
                  'Failed to load pending users',
                  error.toString(),
                ),
              ),
              const SizedBox(height: TuxSpacing.xl),

              // System Health
              Text(
                'System Health',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: TuxSpacing.md),
              const SystemHealthWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionsSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return TuxCard(
      header: Text(
        'Quick Actions',
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Wrap(
        spacing: TuxSpacing.md,
        runSpacing: TuxSpacing.sm,
        children: [
          TuxButton(
            text: 'Manage Users',
            icon: Icons.people,
            size: TuxButtonSize.small,
            onPressed: () => context.go('/admin/users'),
          ),
          TuxButton(
            text: 'User Approvals',
            icon: Icons.approval,
            size: TuxButtonSize.small,
            variant: TuxButtonVariant.secondary,
            onPressed: () => context.go('/admin/approvals'),
          ),
          TuxButton(
            text: 'Analytics',
            icon: Icons.analytics,
            size: TuxButtonSize.small,
            variant: TuxButtonVariant.ghost,
            onPressed: () => context.go('/admin/analytics'),
          ),
          TuxButton(
            text: 'System Settings',
            icon: Icons.settings,
            size: TuxButtonSize.small,
            variant: TuxButtonVariant.ghost,
            onPressed: () => context.go('/admin/settings'),
          ),
        ],
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  final String message;

  const _LoadingCard(this.message);

  @override
  Widget build(BuildContext context) {
    return TuxCard(
      body: Padding(
        padding: const EdgeInsets.all(TuxSpacing.lg),
        child: Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: TuxSpacing.md),
            Text(message),
          ],
        ),
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  final String title;
  final String message;

  const _ErrorCard(this.title, this.message);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TuxCard(
      variant: TuxCardVariant.outlined,
      body: Padding(
        padding: const EdgeInsets.all(TuxSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.error,
                  color: theme.colorScheme.error,
                ),
                const SizedBox(width: TuxSpacing.sm),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: TuxSpacing.sm),
            Text(
              message,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}