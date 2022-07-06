import 'package:flutter/material.dart';
import 'package:pub_transport_01/Components/constants.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black54);
    final styleHint = TextStyle(color: Colors.grey);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: MediaQuery.of(context).size.height / 14,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: mainColor.withOpacity(0.3),
            offset: Offset(0.0, 3), //(x,y)
            blurRadius: 20,
          ),
        ],
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width / 18),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: mainColor.withOpacity(0.8)),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
