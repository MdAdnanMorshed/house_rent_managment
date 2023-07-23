
import 'package:flutter/material.dart';

class CustomTextFormat extends StatelessWidget {

  final String ctmKey;
  final String  ctmValue;

   CustomTextFormat({Key? key,required this.ctmKey,required this.ctmValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Text(ctmKey,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 3,
            child: Text(
              " : " + ctmValue,
              maxLines: 2,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
