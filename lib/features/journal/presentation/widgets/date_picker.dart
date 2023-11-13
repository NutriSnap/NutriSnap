import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/features/journal/data/date_provider.dart';
import 'package:intl/intl.dart';

class DatePicker extends ConsumerWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref
                .read(dateProvider.notifier)
                .setDate(date.subtract(const Duration(days: 1)));
          },
        ),
        const SizedBox(width: 10),
        TextButton(
          child: Text(
          DateFormat.MMMEd().format(date),
          //"${date.toLocal()}".split(' ')[0],
          style: Theme.of(context).textTheme.titleLarge,
          ),
          onPressed: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              ref.read(dateProvider.notifier).setDate(pickedDate);
            }
          },

        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            ref
                .read(dateProvider.notifier)
                .setDate(date.add(const Duration(days: 1)));
          },
        ),
      ],
    );
  }
}