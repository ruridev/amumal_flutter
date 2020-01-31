import 'package:flutter/material.dart';
import 'package:amumal_app/constrants.dart';
class TextInputBox extends StatelessWidget {
  final textFieldcontroller = TextEditingController();
  final FocusNode textFieldFocus = FocusNode();
  final Function addAmumal;

  TextInputBox({this.addAmumal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Colors.black,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              focusNode: textFieldFocus,
              controller: textFieldcontroller,
              decoration: InputDecoration(
                //Add th Hint text here.
                hintText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onSubmitted: (v) {
                addAmumal(v);
                FocusScope.of(context)
                    .requestFocus(textFieldFocus);
                textFieldcontroller.clear();
              },
            ),
          ),
          SizedBox(width: 24.0),
          InkWell(
            child: Icon(Icons.send),
            onTap: () {
              addAmumal(textFieldcontroller.text);
              FocusScope.of(context)
                  .requestFocus(textFieldFocus);
              textFieldcontroller.clear();
            },
          )
        ],
      ),
    );
  }
}