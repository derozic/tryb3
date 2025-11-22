import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../tux/components/tux_card.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../models/admin_model.dart';
import '../../providers/admin_provider.dart';

class SystemHealthWidget extends ConsumerWidget {
  const SystemHealthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthState = ref.watch(systemHealthProvider);

    return healthState.when(
      data: (health) => _SystemHealthView(health: health),
      loading: () => const _SystemHealthLoading(),
      error: (error, stack) => _SystemHealthError(error: error.toString()),
    );
  }
}

class _SystemHealthView extends StatelessWidget {
  final SystemHealth health;

  const _SystemHealthView({required this.health});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TuxCard(
      header: Row(
        children: [
          Icon(
            health.isHealthy ? Icons.check_circle : Icons.error,
            color: health.isHealthy ? Colors.green : Colors.red,
          ),
          const SizedBox(width: TuxSpacing.sm),
          Text(
            'System Health',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            'Last checked: ${_formatTime(health.lastChecked)}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Overall Status
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(TuxSpacing.md),
            decoration: BoxDecoration(
              color: health.isHealthy 
                  ? Colors.green.withOpacity(0.1) 
                  : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              health.isHealthy ? 'All systems operational' : 'System issues detected',
              style: theme.textTheme.titleSmall?.copyWith(
                color: health.isHealthy ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: TuxSpacing.md),
          
          // Database Status
          _ServiceTile(
            title: 'Database',
            icon: Icons.storage,
            isHealthy: health.database.isConnected,
            details: [
              'Connections: ${health.database.connectionCount}',
              'Queries: ${health.database.queryCount}',
              'Avg Query Time: ${health.database.avgQueryTime.toStringAsFixed(2)}ms',
            ],
            error: health.database.error,
          ),
          
          // Cache Status
          _ServiceTile(
            title: 'Cache',
            icon: Icons.memory,
            isHealthy: health.cache.isConnected,
            details: [
              'Hit Rate: ${health.cache.hitRate}%',
              'Keys: ${health.cache.keyCount}',
              'Memory: ${health.cache.memoryUsage}',
            ],
            error: health.cache.error,
          ),
          
          // WebSocket Status
          _ServiceTile(
            title: 'WebSocket',
            icon: Icons.wifi,
            isHealthy: health.websocket.isRunning,
            details: [
              'Active Connections: ${health.websocket.activeConnections}',
              'Total Messages: ${health.websocket.totalMessages}',
              'Avg Latency: ${health.websocket.avgLatency.toStringAsFixed(2)}ms',
            ],
            error: health.websocket.error,
          ),
          
          // External Services
          ...health.services.entries.map(
            (entry) => _ServiceTile(
              title: entry.value.name,
              icon: Icons.cloud,
              isHealthy: entry.value.isUp,
              details: [
                'Response Time: ${entry.value.responseTimeMs}ms',
                'Last Checked: ${_formatTime(entry.value.lastChecked)}',
              ],
              error: entry.value.error,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else {
      return '${difference.inHours}h ago';
    }
  }
}

class _ServiceTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isHealthy;
  final List<String> details;
  final String? error;

  const _ServiceTile({
    required this.title,
    required this.icon,
    required this.isHealthy,
    required this.details,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: TuxSpacing.sm),
      padding: const EdgeInsets.all(TuxSpacing.md),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: isHealthy ? Colors.green : Colors.red,
              ),
              const SizedBox(width: TuxSpacing.sm),
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: TuxSpacing.sm,
                  vertical: TuxSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: isHealthy 
                      ? Colors.green.withOpacity(0.1) 
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isHealthy ? 'Healthy' : 'Error',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isHealthy ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TuxSpacing.sm),
          
          // Details
          Wrap(
            spacing: TuxSpacing.md,
            runSpacing: TuxSpacing.xs,
            children: details.map((detail) => 
              Text(
                detail,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ).toList(),
          ),
          
          // Error message
          if (error != null) ...[
            const SizedBox(height: TuxSpacing.sm),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(TuxSpacing.sm),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                error!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SystemHealthLoading extends StatelessWidget {
  const _SystemHealthLoading();

  @override
  Widget build(BuildContext context) {
    return TuxCard(
      body: Padding(
        padding: const EdgeInsets.all(TuxSpacing.lg),
        child: Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: TuxSpacing.md),
            Text(
              'Checking system health...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _SystemHealthError extends StatelessWidget {
  final String error;

  const _SystemHealthError({required this.error});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TuxCard(
      variant: TuxCardVariant.outlined,
      body: Padding(
        padding: const EdgeInsets.all(TuxSpacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.error,
              color: theme.colorScheme.error,
              size: 48,
            ),
            const SizedBox(height: TuxSpacing.md),
            Text(
              'Failed to check system health',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TuxSpacing.sm),
            Text(
              error,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}