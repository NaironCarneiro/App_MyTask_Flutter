// import 'package:aula_flutter/entity/app_state.dart';
import 'package:mytasks/entity/task.dart';
// import 'package:aula_flutter/screens/product_details.dart';
// import 'package:aula_flutter/theme/colors.dart';
// import 'package:aula_flutter/theme/images.dart';
// import 'package:aula_flutter/util/messages.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class TaskPreview extends StatelessWidget {
  final Task task;

  const TaskPreview(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => ProductDetails(product),
        //   ),
        // );
      },
 );
  }
}