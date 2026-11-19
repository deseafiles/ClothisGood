import 'package:android/ui/cloth/cloth_list_screen.dart';
import 'package:android/ui/provider/outfit_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchAppBar extends ConsumerStatefulWidget {
  const SearchAppBar({super.key});

  @override
  ConsumerState<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends ConsumerState<SearchAppBar> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void searchOutfit() {
    final keyword = controller.text.trim();

    if (keyword.isEmpty) return;

    ref.read(searchKeywordProvider.notifier).state = keyword;
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: 'Search Outfit...',
      leading: const Icon(Icons.search),
      trailing: [
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: searchOutfit,
        ),
      ],
      onSubmitted: (_) => searchOutfit(),
    );
  }
}
