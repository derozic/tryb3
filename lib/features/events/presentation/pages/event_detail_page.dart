import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../../../features/animations/widgets/fade_in_animation.dart';
import '../../models/event_model.dart';
import '../../providers/events_provider.dart';
import '../widgets/event_card_widget.dart';

class EventDetailPage extends ConsumerStatefulWidget {
  final String eventId;

  const EventDetailPage({Key? key, required this.eventId}) : super(key: key);

  @override
  ConsumerState<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends ConsumerState<EventDetailPage> {
  bool _isJoining = false;
  bool _isLeaving = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final eventState = ref.watch(eventDetailProvider(widget.eventId));
    final attendeesState = ref.watch(eventAttendeesProvider(widget.eventId));
    final commentsState = ref.watch(eventCommentsProvider(widget.eventId));

    return Scaffold(
      body: eventState.when(
        data: (event) {
          if (event == null) {
            return _buildNotFoundState(theme);
          }
          return _buildEventDetail(event, theme, attendeesState, commentsState);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildErrorState(error.toString(), theme),
      ),
    );
  }

  Widget _buildEventDetail(
    EventModel event, 
    ThemeData theme, 
    AsyncValue<List<EventAttendee>> attendeesState,
    AsyncValue<List<EventComment>> commentsState,
  ) {
    return CustomScrollView(
      slivers: [
        _buildAppBar(event, theme),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(TuxSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildEventHeader(event, theme),
                const SizedBox(height: TuxSpacing.xl),
                _buildEventDetails(event, theme),
                const SizedBox(height: TuxSpacing.xl),
                _buildActionButtons(event, theme),
                const SizedBox(height: TuxSpacing.xl),
                _buildAttendeesSection(attendeesState, theme),
                const SizedBox(height: TuxSpacing.xl),
                _buildCommentsSection(commentsState, theme),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(EventModel event, ThemeData theme) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () => _shareEvent(event),
        ),
        PopupMenuButton<String>(
          onSelected: (value) => _handleMenuAction(value, event),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Text('Edit Event'),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text('Delete Event'),
            ),
          ],
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.primary.withOpacity(0.8),
                theme.colorScheme.primary,
              ],
            ),
          ),
          child: event.imageUrl != null
              ? Image.network(
                  event.imageUrl!,
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Text(
                    event.eventType.icon,
                    style: const TextStyle(fontSize: 64),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildEventHeader(EventModel event, ThemeData theme) {
    return FadeInAnimation(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: TuxSpacing.sm,
                  vertical: TuxSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  event.eventType.displayName,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              const Spacer(),
              if (event.status == EventStatus.cancelled)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TuxSpacing.sm,
                    vertical: TuxSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Cancelled',
                    style: TextStyle(
                      color: theme.colorScheme.error,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: TuxSpacing.md),
          Text(
            event.title,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: TuxSpacing.sm),
          Text(
            'Organized by ${event.organizerName}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.outline,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventDetails(EventModel event, ThemeData theme) {
    return FadeInAnimation(
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: TuxSpacing.md),
          Text(
            event.description,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: TuxSpacing.lg),
          _buildDetailRow(
            icon: Icons.access_time,
            title: 'Date & Time',
            content: _formatEventDateTime(event),
            theme: theme,
          ),
          if (event.location != null) ...[
            const SizedBox(height: TuxSpacing.md),
            _buildDetailRow(
              icon: Icons.location_on,
              title: 'Location',
              content: event.location!,
              theme: theme,
            ),
          ],
          if (event.meetingLink != null) ...[
            const SizedBox(height: TuxSpacing.md),
            _buildDetailRow(
              icon: Icons.video_call,
              title: 'Meeting Link',
              content: event.meetingLink!,
              theme: theme,
              isLink: true,
            ),
          ],
          if (event.maxAttendees != null) ...[
            const SizedBox(height: TuxSpacing.md),
            _buildDetailRow(
              icon: Icons.group,
              title: 'Capacity',
              content: '${event.attendeeIds.length}/${event.maxAttendees} attendees',
              theme: theme,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String title,
    required String content,
    required ThemeData theme,
    bool isLink = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(width: TuxSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: TuxSpacing.xs),
              Text(
                content,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isLink ? theme.colorScheme.primary : null,
                  decoration: isLink ? TextDecoration.underline : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(EventModel event, ThemeData theme) {
    return FadeInAnimation(
      delay: const Duration(milliseconds: 400),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: TuxButton(
              text: _isUserAttending(event) ? 'Leave Event' : 'Join Event',
              icon: _isUserAttending(event) ? Icons.exit_to_app : Icons.check,
              variant: _isUserAttending(event) 
                  ? TuxButtonVariant.secondary 
                  : TuxButtonVariant.primary,
              onPressed: (_isJoining || _isLeaving || event.status == EventStatus.cancelled) 
                  ? null 
                  : () => _handleJoinLeave(event),
              isLoading: _isJoining || _isLeaving,
            ),
          ),
          const SizedBox(height: TuxSpacing.md),
          Row(
            children: [
              Expanded(
                child: TuxButton(
                  text: 'Add to Calendar',
                  icon: Icons.calendar_today,
                  variant: TuxButtonVariant.outlined,
                  onPressed: () => _addToCalendar(event),
                ),
              ),
              const SizedBox(width: TuxSpacing.md),
              Expanded(
                child: TuxButton(
                  text: 'Share Event',
                  icon: Icons.share,
                  variant: TuxButtonVariant.outlined,
                  onPressed: () => _shareEvent(event),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttendeesSection(AsyncValue<List<EventAttendee>> attendeesState, ThemeData theme) {
    return attendeesState.when(
      data: (attendees) => FadeInAnimation(
        delay: const Duration(milliseconds: 600),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Attendees (${attendees.length})',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to full attendees list
                  },
                  child: const Text('See all'),
                ),
              ],
            ),
            const SizedBox(height: TuxSpacing.md),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: attendees.take(10).length,
                itemBuilder: (context, index) {
                  final attendee = attendees[index];
                  return Container(
                    margin: const EdgeInsets.only(right: TuxSpacing.md),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                          child: Text(
                            attendee.username.substring(0, 1).toUpperCase(),
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: TuxSpacing.xs),
                        Text(
                          attendee.username,
                          style: theme.textTheme.labelSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error loading attendees: $error'),
    );
  }

  Widget _buildCommentsSection(AsyncValue<List<EventComment>> commentsState, ThemeData theme) {
    return commentsState.when(
      data: (comments) => FadeInAnimation(
        delay: const Duration(milliseconds: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comments (${comments.length})',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TuxSpacing.md),
            if (comments.isEmpty)
              Center(
                child: Text(
                  'No comments yet',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              )
            else
              ...comments.take(3).map((comment) => _buildCommentItem(comment, theme)),
            const SizedBox(height: TuxSpacing.md),
            TuxButton(
              text: 'Add Comment',
              icon: Icons.comment,
              variant: TuxButtonVariant.outlined,
              onPressed: () => _showCommentDialog(),
            ),
          ],
        ),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error loading comments: $error'),
    );
  }

  Widget _buildCommentItem(EventComment comment, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: TuxSpacing.md),
      padding: const EdgeInsets.all(TuxSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                child: Text(
                  comment.username.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(width: TuxSpacing.sm),
              Text(
                comment.username,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                _formatCommentDate(comment.createdAt),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ],
          ),
          const SizedBox(height: TuxSpacing.sm),
          Text(
            comment.content,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildNotFoundState(ThemeData theme) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Not Found'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 64,
              color: theme.colorScheme.outline,
            ),
            const SizedBox(height: TuxSpacing.md),
            Text(
              'Event not found',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: TuxSpacing.lg),
            TuxButton(
              text: 'Go Back',
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String error, ThemeData theme) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: TuxSpacing.md),
            Text(
              'Error loading event',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: TuxSpacing.sm),
            Text(
              error,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TuxSpacing.lg),
            TuxButton(
              text: 'Retry',
              onPressed: () => ref.refresh(eventDetailProvider(widget.eventId)),
            ),
          ],
        ),
      ),
    );
  }

  bool _isUserAttending(EventModel event) {
    // This would check if the current user is attending
    // For now, return false
    return false;
  }

  Future<void> _handleJoinLeave(EventModel event) async {
    try {
      if (_isUserAttending(event)) {
        setState(() => _isLeaving = true);
        await ref.read(eventsProvider.notifier).leaveEvent(event.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Left event successfully')),
          );
        }
      } else {
        setState(() => _isJoining = true);
        await ref.read(eventsProvider.notifier).joinEvent(event.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Joined event successfully')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isJoining = false;
          _isLeaving = false;
        });
      }
    }
  }

  void _shareEvent(EventModel event) {
    // Implement sharing functionality
  }

  void _addToCalendar(EventModel event) {
    // Implement add to calendar functionality
  }

  void _handleMenuAction(String action, EventModel event) {
    switch (action) {
      case 'edit':
        context.push('/events/create', extra: event.id);
        break;
      case 'delete':
        _showDeleteDialog(event);
        break;
    }
  }

  void _showDeleteDialog(EventModel event) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Event'),
        content: const Text('Are you sure you want to delete this event? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await ref.read(eventsProvider.notifier).deleteEvent(event.id);
                if (context.mounted) {
                  Navigator.of(context).pop(); // Close dialog
                  context.pop(); // Go back to previous screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Event deleted successfully')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error deleting event: $e')),
                  );
                }
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showCommentDialog() {
    final commentController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Comment'),
        content: TextField(
          controller: commentController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Write your comment...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (commentController.text.isNotEmpty) {
                try {
                  await ref.read(eventCommentsProvider(widget.eventId).notifier)
                      .addComment(widget.eventId, commentController.text);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Comment added successfully')),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error adding comment: $e')),
                    );
                  }
                }
              }
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }

  String _formatEventDateTime(EventModel event) {
    final dateFormat = DateFormat('EEEE, MMMM d, y');
    final timeFormat = DateFormat('h:mm a');
    
    final date = dateFormat.format(event.eventDate);
    final startTime = timeFormat.format(event.startTime);
    final endTime = timeFormat.format(event.endTime);
    
    return '$date\n$startTime - $endTime';
  }

  String _formatCommentDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 7) {
      return DateFormat('MMM d').format(date);
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}