import 'package:flutter/material.dart';

class TagsUI extends StatelessWidget {
  final List<dynamic> tags;

  const TagsUI({Key key, this.tags}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: tags != null
          ? tags
              .map(
                (tag) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Chip(
                    label: Text(tag),
                  ),
                ),
              )
              .toList()
          : [SizedBox()],
    );
  }
}
