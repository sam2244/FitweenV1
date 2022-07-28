import 'package:fitweenV1/global/config/theme.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// 메인 페이지의 위젯 모음

// 메인 페이지 AppBar
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('Fitween'),
      ),
      leadingWidth: 600.0,
      actions: const [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: MainPresenter.searchButtonPressed,
        ),
      ],
    );
  }
}

class CrewCard extends StatelessWidget {
  const CrewCard({Key? key, required this.crew}) : super(key: key);

  final Crew crew;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 250.0,
              color: FWTheme.grey.withOpacity(.3),
              child: crew.imageUrl == null
                  ? const Center(
                child: Icon(Icons.photo, color: FWTheme.grey, size: 40.0),
              ) : Image.network(crew.imageUrl!),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(crew.title!,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: crew.tags.map((tag) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text('#$tag'),
                          );
                        }).toList(),
                      ),
                      Text('${DateFormat('yyyy.MM.dd').format(crew.startDate!)}~'
                        '${DateFormat('yyyy.MM.dd').format(crew.endDate!)}',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                      Row(
                        children: crew.categories.map((category) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: FWTheme.dark),
                              ),
                              child: Text(category, textAlign: TextAlign.center),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  color: FWTheme.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person),
                      Text('${crew.memberLimit}명'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddCrewButton extends StatelessWidget {
  const AddCrewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: MainPresenter.addCrewButtonPressed,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: const Icon(Icons.add, size: 38, color: Colors.white),
    );
  }
}

// class MainCard extends StatefulWidget {
//   MainCard({required Key key, required this.imageUrl, required this.category, required this.title, required this.hashtag, required this.srtDate, required this.endDate, required this.memberNum}) : super(key: key);
//
//   String imageUrl;
//   String category;
//   String title;
//   String hashtag;
//   String srtDate;
//   String endDate;
//   num memberNum;
//
//   @override
//   State<MainCard> createState() => _MainCardState();
// }
//
// class _MainCardState extends State<MainCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 32.w, right: 32.w),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(widget.imageUrl),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(widget.title,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold
//                 ,)
//               ),
//               Container(
//                 width: 63.w,
//                 height: 25.h,
//                 color: Colors.grey,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.person),
//                     Text("${widget.memberNum}명")
//                   ],
//                 ),
//               )
//             ],
//           ),
//           Text(widget.hashtag),
//           Text("기간 ${widget.srtDate} ~ ${widget.endDate}"),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton.icon(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary,),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.zero,
//                       )
//                   )
//                 ),
//                 label: const Icon(Icons.chevron_right,
//                   color: Colors.white,
//                 ),
//                 icon: const Text("자세히 보기",
//                     style: TextStyle(
//                         color: Colors.white
//                     )
//                 ),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ],
//       )
//     );
//   }
// }
