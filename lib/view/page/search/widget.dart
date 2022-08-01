import 'package:fitweenV1/presenter/page/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(110.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Search'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: SearchBar(),
            );
          },
        )
      ],

    );
  }
}

class SearchBar extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {if (query.isEmpty) {
          close(context, null); //close searchbar
        } else {
          query = '';
        }
      },
    ),
  ];

  @override
  Widget? buildLeading(BuildContext context) =>
      IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => close(context, null),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      '매일 10 푸쉬업',
      '아이유',
      '김계란',
      '심으뜸',
      '러닝'
    ];

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

}

class RecentSearchPageView extends StatelessWidget {
  const RecentSearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPresenter>(
      builder: (controller) {
        return Column(
          children: controller.searchedCrews.map((crew) =>
              Text(crew.title!)).toList(),
        );
      },
    );
  }
}
