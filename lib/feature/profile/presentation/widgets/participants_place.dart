import 'package:flutter/material.dart';

import 'network_avatar.dart';

class ParticipantsPlace extends StatelessWidget {
  final List<String> participantsAvatarLinks;

  const ParticipantsPlace({Key key, this.participantsAvatarLinks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buildListOfAvatars = List<Widget>.generate(
      participantsAvatarLinks.length,
      (i) => Padding(
        padding: EdgeInsets.fromLTRB(i.toDouble() * 27, 0, 0, 0),
        child: NetworkAvatar(
          radius: 22.5,
          url: participantsAvatarLinks[i],
        ),
      ),
    );
    return Stack(
      children: buildListOfAvatars,
    );
  }
}
