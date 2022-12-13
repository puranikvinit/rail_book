//KARKALA SRINIVASA VENKATARAMANA
//OM JAI DURGE MAA

import 'package:flutter/material.dart';

class SeatBox extends StatelessWidget {
  final bool glow;
  final int number;
  final ValueNotifier<List<bool>> glowArr;
  final String berthType;
  final bool revert;
  const SeatBox({
    required this.glow,
    required this.number,
    required this.glowArr,
    required this.berthType,
    required this.revert,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: glowArr,
      builder: (context, value, child) => GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: glow ? Colors.deepPurple[600] : Colors.blue[200],
              border: Border.all(color: Colors.black38),
              borderRadius: revert
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    number.toString(),
                    style: TextStyle(
                      color: glow ? Colors.white : Colors.black,
                      fontFamily: "Dongle",
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    berthType,
                    style: TextStyle(
                      color: glow ? Colors.white : Colors.black,
                      fontFamily: "Dongle",
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
