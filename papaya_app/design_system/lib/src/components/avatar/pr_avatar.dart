import 'package:flutter/material.dart';

class PRAvatar extends StatelessWidget {
  final String? name;
  final String? imageUrl;

  const PRAvatar({super.key, this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null ? Text(name?.substring(0, 1) ?? "") : null,
    );
  }
}
