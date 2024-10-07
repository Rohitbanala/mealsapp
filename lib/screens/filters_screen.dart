import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changedData = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: changedData[Filter.gluttenFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.gluttenFree, value);
            },
            title: Text(
              "Glutten-Free.",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              'only include glutten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: changedData[Filter.lactoseFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
            title: Text(
              "Lactose-Free.",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              'only include lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: changedData[Filter.vegetarian]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, value);
            },
            title: Text(
              "Vegitarian",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              'only include Vegitarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: changedData[Filter.vegan]!,
            onChanged: (value) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, value);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              'only include Vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
