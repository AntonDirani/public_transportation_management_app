/*
* Created By Mirai Devs.
* On 24/6/2022.
*/

import 'package:flutter/material.dart';
import 'package:pub_transport_01/Components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Models/trips_model.dart';
import 'mirai_container_widget.dart';

class DropDownObjectChildWidget extends StatelessWidget {
  const DropDownObjectChildWidget({
    Key? key,
    required this.projectValueNotifier,
    this.firstSpace = 12,
    this.secondSpace = 16,
    this.padding,
    this.fontSize,
    this.coloredContainerSize,
    this.height,
  }) : super(key: key);

  final ValueNotifier<Trip> projectValueNotifier;
  final double firstSpace;
  final double secondSpace;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final double? coloredContainerSize;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: GlobalKey(),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: const Color(0xFFECECEC),
          width: 1.0,
        ),
      ),
      height: height ?? 40,
      child: ValueListenableBuilder<Trip>(
        valueListenable: projectValueNotifier,
        builder: (_, Trip project, __) {
          return Row(
            children: <Widget>[
              MiraiContainerWidget(
                color: mainColor,
                size: coloredContainerSize,
              ),
              SizedBox(width: firstSpace),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: Text(
                      '${project.name}',
                      key: ValueKey<String>('${project.name}'.trim()),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: fontSize,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: secondSpace),
              const FaIcon(
                FontAwesomeIcons.chevronDown,
                color: Colors.amber,
                size: 12,
              ),
            ],
          );
        },
      ),
    );
  }
}
