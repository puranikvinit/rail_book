import 'package:flutter/material.dart';

class SeatBox extends StatelessWidget {
  final bool glow;
  final int number;
  final String berthType;
  final String berthName;
  final bool revert;

  const SeatBox({
    required this.glow,
    required this.number,
    required this.berthType,
    required this.berthName,
    required this.revert,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        glow
            ? showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Seat Details",
                      style: TextStyle(color: Colors.deepPurple[600]),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Seat Number: $number"),
                        Text("Berth Type: $berthName"),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 10,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Center(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                })
            : null;
      },
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
                ),
              ),
              Text(
                berthType,
                style: TextStyle(
                  color: glow ? Colors.white : Colors.black,
                  fontFamily: "Dongle",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
