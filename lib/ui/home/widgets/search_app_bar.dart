import 'package:android/data/provider/outfit_provider.dart';
import 'package:android/ui/cloth/cloth_card.dart';
import 'package:android/ui/cloth/cloth_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchAppBar extends ConsumerStatefulWidget {
  const SearchAppBar({super.key});

  @override
  ConsumerState<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends ConsumerState<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          hintText: 'Search Outfit...',
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16),
          ),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
        );
      },
      suggestionsBuilder: (
        BuildContext context,
        SearchController controller,
      ) {
        final keyword = controller.text.trim();

        if (keyword.isEmpty) {
          return [
            const ListTile(
              title: Text('Search your favorite outfit'),
            ),
          ];
        }

        final clothAsync = ref.watch(
          searchOutfitProvider(keyword),
        );

        return clothAsync.when(
          loading: () => [
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
          error: (error, stackTrace) => [
            ListTile(
              title: Text('Error: $error'),
            ),
          ],
          data: (cloth) {
            return [
              ClothListScreen()
            ];
          },
        );
      },
    );
  }
}
