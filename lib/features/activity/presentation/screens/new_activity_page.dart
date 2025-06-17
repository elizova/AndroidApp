import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:android_app/features/activity/ui_activity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewActivityPage extends StatelessWidget {
  const NewActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Stack(
        children: [
          const Center(
            child: Text('Здесь должна быть карта'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0).copyWith(top: 25),
                  child: Column(
                    children: [
                      Text(
                        'Погнали? :)',
                        style: TextTheme.of(context).headlineSmall,
                      ),
                      const SizedBox(height: 24),
                      const _OptionChips(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _OptionChips extends StatefulWidget {
  const _OptionChips();

  @override
  State<_OptionChips> createState() => _OptionChipsState();
}

class _OptionChipsState extends State<_OptionChips> {
  ActivityType _selectedType = ActivityType.bicycle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              for (final type in ActivityType.values)
                ChoiceChip(
                  selected: type == _selectedType,
                  onSelected: (selected) {
                    if (!selected) return;
                    setState(() => _selectedType = type);
                  },
                  label: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(type.label),
                      ),
                      Icon(type.icon),
                    ],
                  ),
                ),
            ].addBetween(const SizedBox(width: 8)),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text('Начать'),
        )
      ],
    );
  }

  void _submitForm() {
    final activity = Activity(
      id: DateTime.now().millisecondsSinceEpoch,
      type: _selectedType,
      startTime: DateTime.now(),
      endTime: null,
    );

    context.read<ActivityBloc>().add(ActivityEvent.add(activity));
    Navigator.pop(context);
  }
}
