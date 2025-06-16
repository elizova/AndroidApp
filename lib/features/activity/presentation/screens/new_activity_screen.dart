import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NewActivityScreen extends StatefulWidget {
  const NewActivityScreen({super.key});

  @override
  State<NewActivityScreen> createState() => _NewActivityScreenState();
}

class _NewActivityScreenState extends State<NewActivityScreen> {
  final _formKey = GlobalKey<FormState>();
  ActivityType _selectedType = ActivityType.running;
  final _distanceController = TextEditingController();
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now().add(const Duration(hours: 1));

  @override
  void dispose() {
    _distanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Activity'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildActivityTypeSelector(),
            const SizedBox(height: 24),
            _buildDistanceField(),
            const SizedBox(height: 24),
            _buildTimeSelector(
              label: 'Start Time',
              value: _startTime,
              onChanged: (time) {
                setState(() {
                  _startTime = time;
                  if (_endTime.isBefore(_startTime)) {
                    _endTime = _startTime.add(const Duration(hours: 1));
                  }
                });
              },
            ),
            const SizedBox(height: 16),
            _buildTimeSelector(
              label: 'End Time',
              value: _endTime,
              onChanged: (time) {
                setState(() {
                  if (time.isAfter(_startTime)) {
                    _endTime = time;
                  }
                });
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Save Activity'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activity Type',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: ActivityType.values.map((type) {
            return ChoiceChip(
              label: Text(type.toString().split('.').last),
              selected: _selectedType == type,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedType = type;
                  });
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDistanceField() {
    return TextFormField(
      controller: _distanceController,
      decoration: const InputDecoration(
        labelText: 'Distance (km)',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildTimeSelector({
    required String label,
    required DateTime value,
    required ValueChanged<DateTime> onChanged,
  }) {
    return InkWell(
      onTap: () async {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(value),
        );
        if (time != null) {
          final newDateTime = DateTime(
            value.year,
            value.month,
            value.day,
            time.hour,
            time.minute,
          );
          onChanged(newDateTime);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        child: Text(
          DateFormat('HH:mm').format(value),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  void _submitForm() {
    final activity = Activity(
      id: DateTime.now().millisecondsSinceEpoch,
      type: _selectedType,
      startTime: _startTime,
      endTime: _endTime,
    );

    context.read<ActivityBloc>().add(ActivityEvent.add(activity));
    Navigator.pop(context);
  }
}
