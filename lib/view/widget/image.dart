import 'package:fitweenV1/global/config/theme.dart';
import 'package:flutter/material.dart';
import '../../model/crew.dart';


class MyCrewImage extends StatelessWidget {
  const MyCrewImage({
    Key? key,
    required this.title,
    this.size = 90.0,
  }) : super(key: key);

  final Crew title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: title.imageUrl == null
          ? Container(
        color: FWTheme.grey.withOpacity(.3),
        child: const Center(
          child: Icon(Icons.photo,
            size: 20.0,
            color: FWTheme.grey,
          ),
        ),
      ) : Image.network(title.imageUrl!, fit: BoxFit.fill),
    );
  }
}

class MyCrewChatPreview extends StatelessWidget {
  const MyCrewChatPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

