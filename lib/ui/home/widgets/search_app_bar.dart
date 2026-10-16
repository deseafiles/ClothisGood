import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          hintText: "Cari Outfit..." ,
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
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

    suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                  setState(() {
                      controller.closeView(item);
                    });
                },
            );
          });
      });
  }
}
