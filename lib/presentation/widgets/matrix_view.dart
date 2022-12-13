//KARKALA SRINIVASA VENKATARAMANA
//OM JAI DURGE MAA

import 'package:flutter/material.dart';
import 'package:rail_book/data/seat_model.dart';
import 'package:rail_book/presentation/widgets/seat_box.dart';

class MatrixView extends StatelessWidget {
  final ValueNotifier<int> inpVal;
  final ValueNotifier<List<bool>> glowArray;
  final SeatMatrixModel seatMatrix;

  const MatrixView({
    required this.inpVal,
    required this.glowArray,
    required this.seatMatrix,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: glowArray,
        builder: ((context, value, child) => Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              height: 700.0,
              // color: Colors.blue,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 170,
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        children: List.generate(6, (i) {
                          return SeatBox(
                            glow: glowArray.value[(8 * index) + i],
                            number: ((8 * index) + i + 1),
                            glowArr: glowArray,
                            berthType: seatMatrix
                                .allSeats[(8 * index) + i + 1].seatBerth
                                .toString(),
                            revert: i > 2 ? true : false,
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      width: 50.0,
                    ),
                    SizedBox(
                      width: 83,
                      height: 170,
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 1,
                        children: List.generate(2, (i) {
                          return SeatBox(
                            glow: glowArray.value[(8 * index) + i + 6],
                            number: ((8 * index) + i + 7),
                            glowArr: glowArray,
                            berthType: seatMatrix
                                .allSeats[(8 * index) + i + 7].seatBerth
                                .toString(),
                            revert: i == 1 ? true : false,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
