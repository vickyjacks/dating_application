import 'package:flutter/material.dart';

import '../../views/hitmeup/screen/widgets/my_hitmeup_dialogs.dart';

class CommonDialog {
  Future showMyHitMeUpDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const MyHitMeUpDialog();
        });
  }
}
