import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:go_router/go_router.dart';
import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../../../features/animations/widgets/fade_in_animation.dart';
import '../../../shared/models/user_model.dart';
import '../../providers/events_provider.dart';
import '../widgets/event_card_widget.dart';
import '../widgets/calendar_header_widget.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    
    // Load events for current month
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadEventsForMonth(_focusedDay);
    });
  }

  void _loadEventsForMonth(DateTime month) {
    final startOfMonth = DateTime(month.year, month.month, 1);
    final endOfMonth = DateTime(month.year, month.month + 1, 0);
    
    ref.read(eventsProvider.notifier).loadEvents(
      startDate: startOfMonth,
      endDate: endOfMonth,
    );
  }

  List<EventModel> _getEventsForDay(DateTime day) {
    final events = ref.watch(eventsProvider).value ?? [];
    return events.where((event) {
      return isSameDay(event.eventDate, day);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final eventsState = ref.watch(eventsProvider);
    final selectedDayEvents = _selectedDay != null 
        ? _getEventsForDay(_selectedDay!)
        : <EventModel>[];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
            CalendarHeaderWidget(
              selectedDay: _selectedDay ?? _focusedDay,
              onAddEvent: () => context.push('/events/create'),
              onProfileTap: () => context.push('/profile'),
            ),
            
            // Calendar Widget
            FadeInAnimation(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: TuxSpacing.md),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TableCalendar<EventModel>(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  calendarFormat: _calendarFormat,
                  eventLoader: _getEventsForDay,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                    });
                    _loadEventsForMonth(focusedDay);
                  },
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    weekendTextStyle: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    holidayTextStyle: TextStyle(
                      color: theme.colorScheme.error,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    todayDecoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    markerDecoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    markersMaxCount: 3,
                    canMarkersOverflow: true,
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: true,
                    titleCentered: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    formatButtonTextStyle: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: theme.colorScheme.primary,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: theme.colorScheme.primary,
                    ),
                    titleTextStyle: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    weekdayStyle: TextStyle(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: TuxSpacing.lg),
            
            // Events List
            Expanded(
              child: eventsState.when(
                data: (events) {
                  if (selectedDayEvents.isEmpty) {
                    return _buildEmptyState();
                  }
                  
                  return _buildEventsList(selectedDayEvents);
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stack) => _buildErrorState(error.toString()),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/events/create'),
        icon: const Icon(Icons.add),
        label: const Text('Add Event'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
    );
  }

  Widget _buildEventsList(List<EventModel> events) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: TuxSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Events for ${_selectedDay != null ? _formatDate(_selectedDay!) : 'Today'}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: TuxSpacing.md),
          Expanded(
            child: ListView.separated(
              itemCount: events.length,
              separatorBuilder: (context, index) => const SizedBox(height: TuxSpacing.md),
              itemBuilder: (context, index) {
                final event = events[index];
                return FadeInAnimation(
                  delay: Duration(milliseconds: index * 100),
                  child: EventCardWidget(
                    event: event,
                    onTap: () => context.push('/events/${event.id}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    final theme = Theme.of(context);
    
    return Center(
      child: FadeInAnimation(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 64,
              color: theme.colorScheme.outline.withOpacity(0.5),
            ),
            const SizedBox(height: TuxSpacing.md),
            Text(
              'No events today',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.outline,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: TuxSpacing.sm),
            Text(
              'Start planning something amazing!',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.outline.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: TuxSpacing.lg),
            TuxButton(
              label: 'Create Event',
              leadingIcon: Icons.add,
              onPressed: () => context.push('/events/create'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String error) {
    final theme = Theme.of(context);
    
    return Center(
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
            'Something went wrong',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.error,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: TuxSpacing.sm),
          Text(
            error,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TuxSpacing.lg),
          TuxButton(
            label: 'Retry',
            leadingIcon: Icons.refresh,
            variant: TuxButtonVariant.secondary,
            onPressed: () {
              ref.read(eventsProvider.notifier).refresh();
            },
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));
    
    if (isSameDay(date, today)) {
      return 'Today';
    } else if (isSameDay(date, tomorrow)) {
      return 'Tomorrow';
    } else {
      return '${months[date.month - 1]} ${date.day}';
    }
  }
}