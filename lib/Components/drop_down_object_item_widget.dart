/*
* Created By Mirai Devs.
* On 24/6/2022.
*/

import 'package:flutter/material.dart';
import 'package:pub_transport_01/Components/constants.dart';

import '../Models/trips_model.dart';
import 'mirai_container_widget.dart';

class DropDownItemWidget extends StatelessWidget {
  const DropDownItemWidget({
    Key? key,
    required this.trip,
    this.firstSpace = 30,
    this.padding,
    this.fontSize,
  }) : super(key: key);

  final Trip trip;
  final double firstSpace;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
      child: Row(
        children: <Widget>[
          MiraiContainerWidget(color: mainColor),
          SizedBox(width: firstSpace),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${trip.name}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.black,
                        fontSize: fontSize,
                      ),
                ),
                Text(
                  '${trip.name}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: fontSize,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
