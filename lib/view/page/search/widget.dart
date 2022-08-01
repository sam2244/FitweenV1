/* 검색 페이지 위젯 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presenter/page/search.dart';
//
// class CrewSearch{
//   final String title;
//   final String urlImage;
//
//   const CrewSearch({
//     required this.title,
//     required this.urlImage,
//   });
// }
//
// const allCrews = [
//   CrewSearch(
//       title: '잠수교 달리기',
//       urlImage: 'https://www.lottehotelmagazine.com/resources/a695633d-c984-4b00-bb2b-54a065abb9bc_img_travel_running_detail05.jpg'
//   ),
//   CrewSearch(
//       title: '싸이클',
//       urlImage: 'https://cdn.pixabay.com/photo/2016/11/18/10/36/road-1833925__480.jpg'
//   ),
//   CrewSearch(
//       title: '헬린이모음',
//       urlImage: 'https://cdn.ppomppu.co.kr/zboard/data3/2019/0220/m_20190220211652_pkyqgual.jpeg'
//   ),
// ];

// class SearchBar extends SearchDelegate{
//   // List<CrewSearch> searchResults = allCrews;
//
//   SearchBar()
//   : super(
//     searchFieldLabel: "크루, 채팅, 친구 검색",
//     searchFieldDecorationTheme: InputDecorationTheme(
//       hintStyle: textTheme.labelMedium,
//     ),
//     keyboardType: TextInputType.text,
//     textInputAction: TextInputAction.search,
//   );
//
//   @override
//   List<Widget>? buildActions(BuildContext context) => [
//     IconButton(
//       icon: const Icon(Icons.clear),
//       onPressed: controller.clearButtonPressed,
//     ),
//   ];
//
//   @override
//   Widget? buildLeading(BuildContext context) =>
//       IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => close(context, null),
//       );
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     /*
//     final Iterable<String> suggestions = query.isEmpty
//           ? _history
//         : allCrews.where((crewSearch);
//      */
//
//     List<CrewSearch> suggestions = allCrews.where((crewSearch) {
//       final crewTitle = crewSearch.title.toLowerCase();
//       final input = query.toLowerCase();
//
//       return crewTitle.contains(input);
//     }).toList();
//
//     return GetBuilder<SearchPresenter>(
//       builder: (controller) {
//         return ListView.builder(
//           itemCount: suggestions.length,
//           itemBuilder: (context, index) {
//             final crewSearch = suggestions[index];
//
//             return ListTile(
//               leading: Image.network(
//                 crewSearch.urlImage,
//                 fit: BoxFit.cover,
//                 width: 50,
//                 height: 50,
//               ),
//               title: Text(crewSearch.title),
//               onTap: () => controller.searchButtonPressed,
//             );
//           },
//         );
//       }
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }
// }

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        onPressed: Get.back,
        icon: const Icon(Icons.arrow_back_ios),
      ),
      actions: const [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: SearchPresenter.clearButtonPressed,
        ),
      ],
      title: GetBuilder<SearchPresenter>(
        builder: (controller) {
          return TextFormField(
            controller: SearchPresenter.queryCont,
            onChanged: controller.search,
            // onFieldSubmitted: controller.search,
            decoration: InputDecoration(
              hintText: '크루, 채팅, 친구 검색',
              hintStyle: textTheme.labelMedium?.apply(color: FWTheme.grey),
            ),
          );
        }
      ),
    );
  }
}

class SearchedView extends StatelessWidget {
  const SearchedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPresenter>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.searchedCrews.length,
          itemBuilder: (_, index) {
            return ListTile(
              leading: Container(
                width: 50.0,
                height: 50.0,
                child: controller.searchedCrews[index].imageUrl == null ? const Center(
                  child: Icon(Icons.photo, color: FWTheme.grey, size: 40.0),
                ) : Image.network(
                  controller.searchedCrews[index].imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(controller.searchedCrews[index].title!),
              onTap: () => ChatPresenter.toChat(controller.searchedCrews[index]),
            );
          },
        );
      }
    );
  }
}
