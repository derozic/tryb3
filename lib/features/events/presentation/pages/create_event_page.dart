import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../../../features/animations/widgets/fade_in_animation.dart';
import '../../models/event_model.dart';
import '../../providers/events_provider.dart';

class CreateEventPage extends ConsumerStatefulWidget {
  final String? eventId; // For editing existing events

  const CreateEventPage({Key? key, this.eventId}) : super(key: key);

  @override
  ConsumerState<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends ConsumerState<CreateEventPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _meetingLinkController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1);
  EventType _selectedEventType = EventType.meeting;
  bool _isPublic = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.eventId != null) {
      // Load existing event data for editing
      _loadEventData();
    }
  }

  void _loadEventData() {
    // This would load the event data when editing
    // For now, we'll just handle creation
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.eventId == null ? 'Create Event' : 'Edit Event'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(TuxSpacing.lg),
          child: FadeInAnimation(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBasicInfoSection(theme),
                  const SizedBox(height: TuxSpacing.xl),
                  _buildDateTimeSection(theme),
                  const SizedBox(height: TuxSpacing.xl),
                  _buildEventTypeSection(theme),
                  const SizedBox(height: TuxSpacing.xl),
                  _buildLocationSection(theme),
                  const SizedBox(height: TuxSpacing.xl),
                  _buildSettingsSection(theme),
                  const SizedBox(height: TuxSpacing.xl * 2),
                  _buildActionButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBasicInfoSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Event Details',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: TuxSpacing.lg),
        TextFormField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Event Title',
            hintText: 'Enter event title',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an event title';
            }
            return null;
          },
        ),
        const SizedBox(height: TuxSpacing.md),
        TextFormField(
          controller: _descriptionController,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Description',
            hintText: 'Describe your event...',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a description';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDateTimeSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date & Time',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: TuxSpacing.lg),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: _selectDate,
                child: Container(
                  padding: const EdgeInsets.all(TuxSpacing.md),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.colorScheme.outline),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      const SizedBox(height: TuxSpacing.xs),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: TuxSpacing.sm),
                          Text(
                            DateFormat('MMM d, y').format(_selectedDate),
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: TuxSpacing.md),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: _selectStartTime,
                child: Container(
                  padding: const EdgeInsets.all(TuxSpacing.md),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.colorScheme.outline),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      const SizedBox(height: TuxSpacing.xs),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 18,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: TuxSpacing.sm),
                          Text(
                            _startTime.format(context),
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: TuxSpacing.md),
            Expanded(
              child: InkWell(
                onTap: _selectEndTime,
                child: Container(
                  padding: const EdgeInsets.all(TuxSpacing.md),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.colorScheme.outline),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      const SizedBox(height: TuxSpacing.xs),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            size: 18,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: TuxSpacing.sm),
                          Text(
                            _endTime.format(context),
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEventTypeSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Event Type',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: TuxSpacing.lg),
        Wrap(
          spacing: TuxSpacing.sm,
          runSpacing: TuxSpacing.sm,
          children: EventType.values.map((type) {
            final isSelected = type == _selectedEventType;
            return ChoiceChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(type.icon),
                  const SizedBox(width: TuxSpacing.xs),
                  Text(type.displayName),
                ],
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedEventType = type;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLocationSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: TuxSpacing.lg),
        TextFormField(
          controller: _locationController,
          decoration: const InputDecoration(
            labelText: 'Location (Optional)',
            hintText: 'Enter event location',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.location_on),
          ),
        ),
        const SizedBox(height: TuxSpacing.md),
        TextFormField(
          controller: _meetingLinkController,
          decoration: const InputDecoration(
            labelText: 'Meeting Link (Optional)',
            hintText: 'Enter video meeting link',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.video_call),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: TuxSpacing.lg),
        SwitchListTile(
          title: const Text('Public Event'),
          subtitle: const Text('Anyone can discover and join this event'),
          value: _isPublic,
          onChanged: (value) {
            setState(() {
              _isPublic = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: TuxButton(
            text: widget.eventId == null ? 'Create Event' : 'Update Event',
            icon: Icons.check,
            onPressed: _isLoading ? null : _handleSubmit,
            isLoading: _isLoading,
          ),
        ),
        const SizedBox(height: TuxSpacing.md),
        SizedBox(
          width: double.infinity,
          child: TuxButton(
            text: 'Cancel',
            variant: TuxButtonVariant.secondary,
            onPressed: () => context.pop(),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  Future<void> _selectStartTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (time != null) {
      setState(() {
        _startTime = time;
        // Adjust end time if it's before start time
        if (_endTime.hour < _startTime.hour || 
            (_endTime.hour == _startTime.hour && _endTime.minute <= _startTime.minute)) {
          _endTime = TimeOfDay(
            hour: (_startTime.hour + 1) % 24,
            minute: _startTime.minute,
          );
        }
      });
    }
  }

  Future<void> _selectEndTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (time != null) {
      setState(() {
        _endTime = time;
      });
    }
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final startDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _startTime.hour,
        _startTime.minute,
      );

      final endDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _endTime.hour,
        _endTime.minute,
      );

      final request = CreateEventRequest(
        title: _titleController.text,
        description: _descriptionController.text,
        eventDate: _selectedDate,
        startTime: startDateTime,
        endTime: endDateTime,
        location: _locationController.text.isEmpty ? null : _locationController.text,
        eventType: _selectedEventType,
        meetingLink: _meetingLinkController.text.isEmpty ? null : _meetingLinkController.text,
        isPublic: _isPublic,
      );

      await ref.read(eventsProvider.notifier).createEvent(request);
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Event created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create event: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _meetingLinkController.dispose();
    super.dispose();
  }
}