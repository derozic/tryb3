import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../../../features/animations/widgets/fade_in_animation.dart';
import '../../models/event_model.dart';

class EventCardWidget extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;
  final bool showAttendeeCount;
  final bool compact;

  const EventCardWidget({
    Key? key,
    required this.event,
    this.onTap,
    this.showAttendeeCount = true,
    this.compact = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(compact ? TuxSpacing.md : TuxSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(TuxSpacing.xs),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      event.eventType.icon,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: TuxSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: compact ? 1 : 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (!compact) ...[
                          const SizedBox(height: TuxSpacing.xs),
                          Text(
                            event.eventType.displayName,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (event.status == EventStatus.cancelled)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: TuxSpacing.sm,
                        vertical: TuxSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.error.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Cancelled',
                        style: TextStyle(
                          color: theme.colorScheme.error,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              if (!compact) ...[
                const SizedBox(height: TuxSpacing.md),
                Text(
                  event.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: TuxSpacing.md),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: theme.colorScheme.outline,
                  ),
                  const SizedBox(width: TuxSpacing.xs),
                  Text(
                    _formatDateTime(event.startTime, event.endTime),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
              if (event.location != null) ...[
                const SizedBox(height: TuxSpacing.xs),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: theme.colorScheme.outline,
                    ),
                    const SizedBox(width: TuxSpacing.xs),
                    Expanded(
                      child: Text(
                        event.location!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
              if (showAttendeeCount) ...[
                const SizedBox(height: TuxSpacing.md),
                Row(
                  children: [
                    _buildAttendeeAvatars(),
                    const Spacer(),
                    if (event.maxAttendees != null)
                      Text(
                        '${event.attendeeIds.length}/${event.maxAttendees}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.outline,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    else
                      Text(
                        '${event.attendeeIds.length} attending',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.outline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttendeeAvatars() {
    const maxVisible = 3;
    final visibleAttendees = event.attendeeIds.take(maxVisible).toList();
    final remainingCount = event.attendeeIds.length - maxVisible;

    return Row(
      children: [
        ...visibleAttendees.asMap().entries.map((entry) {
          final index = entry.key;
          return Transform.translate(
            offset: Offset(-index * 8.0, 0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey[300],
              child: Text(
                '${index + 1}',
                style: const TextStyle(fontSize: 10),
              ),
            ),
          );
        }),
        if (remainingCount > 0)
          Transform.translate(
            offset: Offset(-visibleAttendees.length * 8.0, 0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey[600],
              child: Text(
                '+$remainingCount',
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  String _formatDateTime(DateTime startTime, DateTime endTime) {
    final dateFormat = DateFormat('MMM d');
    final timeFormat = DateFormat('h:mm a');
    
    final startDate = dateFormat.format(startTime);
    final startTimeStr = timeFormat.format(startTime);
    final endTimeStr = timeFormat.format(endTime);
    
    return '$startDate, $startTimeStr - $endTimeStr';
  }
}