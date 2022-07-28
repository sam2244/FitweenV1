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
      aspectRatio: 16/16,
      child: Image.network(title.imageUrl!, fit: BoxFit.fill,),
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

