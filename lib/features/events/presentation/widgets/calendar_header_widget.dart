import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';

class CalendarHeaderWidget extends StatelessWidget {
  final DateTime selectedDay;
  final VoidCallback? onAddEvent;
  final VoidCallback? onProfileTap;

  const CalendarHeaderWidget({
    Key? key,
    required this.selectedDay,
    this.onAddEvent,
    this.onProfileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(TuxSpacing.lg),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calendar',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: TuxSpacing.xs),
                    Text(
                      _formatSelectedDate(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: onProfileTap,
                    icon: CircleAvatar(
                      radius: 16,
                      backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                      child: Icon(
                        Icons.person,
                        size: 18,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: TuxSpacing.sm),
                  TuxButton(
                    text: 'Add',
                    icon: Icons.add,
                    size: TuxButtonSize.small,
                    onPressed: onAddEvent,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: TuxSpacing.md),
          _buildQuickActions(theme),
        ],
      ),
    );
  }

  Widget _buildQuickActions(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: _buildQuickActionCard(
            theme,
            icon: Icons.today,
            label: 'Today',
            subtitle: _getTodayEventCount(),
          ),
        ),
        const SizedBox(width: TuxSpacing.md),
        Expanded(
          child: _buildQuickActionCard(
            theme,
            icon: Icons.upcoming,
            label: 'Upcoming',
            subtitle: 'This week',
          ),
        ),
        const SizedBox(width: TuxSpacing.md),
        Expanded(
          child: _buildQuickActionCard(
            theme,
            icon: Icons.groups,
            label: 'My Events',
            subtitle: 'Organized',
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(
    ThemeData theme, {
    required IconData icon,
    required String label,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(TuxSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 20,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: TuxSpacing.xs),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          Text(
            subtitle,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }

  String _formatSelectedDate() {
    final now = DateTime.now();
    
    if (isSameDay(selectedDay, now)) {
      return 'Today, ${DateFormat('MMMM d, y').format(selectedDay)}';
    } else if (isSameDay(selectedDay, now.add(const Duration(days: 1)))) {
      return 'Tomorrow, ${DateFormat('MMMM d, y').format(selectedDay)}';
    } else if (isSameDay(selectedDay, now.subtract(const Duration(days: 1)))) {
      return 'Yesterday, ${DateFormat('MMMM d, y').format(selectedDay)}';
    } else {
      return DateFormat('EEEE, MMMM d, y').format(selectedDay);
    }
  }

  String _getTodayEventCount() {
    // This would normally come from the provider
    // For now, return placeholder
    return '2 events';
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}