/* 검색 페이지 위젯 */

import 'package:fitweenV1/view/page/search/search.dart';
import 'package:flutter/material.dart';
/*
class SearchAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(110.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
*/
class CrewSearch{
  final String title;
  final String urlImage;

  const CrewSearch({
    required this.title,
    required this.urlImage,
  });
}

const allCrews = [
  CrewSearch(
      title: '잠수교 달리기',
      urlImage: 'https://www.lottehotelmagazine.com/resources/a695633d-c984-4b00-bb2b-54a065abb9bc_img_travel_running_detail05.jpg'
  ),
  CrewSearch(
      title: '싸이클',
      urlImage: 'https://cdn.pixabay.com/photo/2016/11/18/10/36/road-1833925__480.jpg'
  ),
  CrewSearch(
      title: '헬린이모음',
      urlImage: 'https://cdn.ppomppu.co.kr/zboard/data3/2019/0220/m_20190220211652_pkyqgual.jpeg'
  ),
];

class SearchBar extends SearchDelegate{
  List<CrewSearch> searchResults = allCrews;

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
    List<CrewSearch> suggestions = allCrews.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final book = suggestions[index];

        return ListTile(
          leading: Image.network(
            book.urlImage,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          title: Text(book.title),
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

/*
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
*/
