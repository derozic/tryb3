import 'package:flutter/material.dart';
import '../../../../tux/components/tux_card.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../models/admin_model.dart';

class DashboardStatsWidget extends StatelessWidget {
  final AdminDashboardStats stats;

  const DashboardStatsWidget({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: TuxSpacing.md),
        
        // User Stats Grid
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: _getCrossAxisCount(context),
          crossAxisSpacing: TuxSpacing.md,
          mainAxisSpacing: TuxSpacing.md,
          childAspectRatio: 1.5,
          children: [
            _StatCard(
              title: 'Total Users',
              value: stats.totalUsers.toString(),
              icon: Icons.people,
              color: theme.colorScheme.primary,
            ),
            _StatCard(
              title: 'Pending Approval',
              value: stats.pendingUsers.toString(),
              icon: Icons.schedule,
              color: Colors.orange,
              subtitle: _getPercentage(stats.pendingUsers, stats.totalUsers),
            ),
            _StatCard(
              title: 'Approved',
              value: stats.approvedUsers.toString(),
              icon: Icons.check_circle,
              color: Colors.green,
              subtitle: _getPercentage(stats.approvedUsers, stats.totalUsers),
            ),
            _StatCard(
              title: 'Rejected',
              value: stats.rejectedUsers.toString(),
              icon: Icons.cancel,
              color: Colors.red,
              subtitle: _getPercentage(stats.rejectedUsers, stats.totalUsers),
            ),
          ],
        ),
        
        const SizedBox(height: TuxSpacing.lg),
        
        // Additional Stats
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: _getCrossAxisCount(context),
          crossAxisSpacing: TuxSpacing.md,
          mainAxisSpacing: TuxSpacing.md,
          childAspectRatio: 1.5,
          children: [
            _StatCard(
              title: 'Total Posts',
              value: stats.totalPosts.toString(),
              icon: Icons.article,
              color: theme.colorScheme.secondary,
            ),
            _StatCard(
              title: 'Notifications',
              value: stats.totalNotifications.toString(),
              icon: Icons.notifications,
              color: Colors.purple,
            ),
            _StatCard(
              title: 'Active Devices',
              value: stats.activeDevices.toString(),
              icon: Icons.devices,
              color: Colors.teal,
            ),
            _StatCard(
              title: 'Suspended',
              value: stats.suspendedUsers.toString(),
              icon: Icons.block,
              color: Colors.orange.shade800,
              subtitle: _getPercentage(stats.suspendedUsers, stats.totalUsers),
            ),
          ],
        ),
      ],
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 4;
    if (width > 800) return 3;
    if (width > 600) return 2;
    return 1;
  }

  String _getPercentage(int value, int total) {
    if (total == 0) return '0%';
    final percentage = (value / total * 100).toStringAsFixed(1);
    return '$percentage%';
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String? subtitle;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TuxCard(
      variant: TuxCardVariant.elevated,
      body: Padding(
        padding: const EdgeInsets.all(TuxSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  icon,
                  color: color.withOpacity(0.7),
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: TuxSpacing.sm),
            Text(
              value,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: TuxSpacing.xs),
              Text(
                subtitle!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class UserActivityChart extends StatelessWidget {
  final Map<String, int> usersByDay;

  const UserActivityChart({
    Key? key,
    required this.usersByDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TuxCard(
      header: Text(
        'User Registration Trend (Last 7 Days)',
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TuxSpacing.md),
        child: SizedBox(
          height: 200,
          child: usersByDay.isEmpty
              ? Center(
                  child: Text(
                    'No data available',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                )
              : _buildSimpleChart(context),
        ),
      ),
    );
  }

  Widget _buildSimpleChart(BuildContext context) {
    final theme = Theme.of(context);
    final maxValue = usersByDay.values.isEmpty ? 1 : usersByDay.values.reduce((a, b) => a > b ? a : b);
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: usersByDay.entries.map((entry) {
        final height = maxValue > 0 ? (entry.value / maxValue) * 150 : 0.0;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              entry.value.toString(),
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TuxSpacing.xs),
            Container(
              width: 30,
              height: height,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: TuxSpacing.xs),
            Text(
              entry.key.split('-').last, // Show just day
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}