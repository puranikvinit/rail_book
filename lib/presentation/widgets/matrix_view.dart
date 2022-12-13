import 'package:flutter/material.dart';
import 'package:rail_book/data/seat_model.dart';
import 'package:rail_book/presentation/widgets/seat_box.dart';

class MatrixView extends StatelessWidget {
  final ValueNotifier<List<bool>> glowArray;
  final SeatMatrixModel seatMatrix;

  const MatrixView({
    required this.glowArray,
    required this.seatMatrix,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: glowArray,
        builder: (context, value, child) =>
            LayoutBuilder(builder: (context, dimens) {
              int maxHeight = 700; //Fixed so as to make seat_box height constant
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: (glowArray.value.length ~/ 8),
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: dimens.maxWidth * 0.5,
                          height: maxHeight / 4,
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: ((dimens.maxWidth * 0.1667) /
                                (maxHeight / 9)),
                            crossAxisCount: 3,
                            children: List.generate(6, (i) {
                              return SeatBox(
                                glow: glowArray.value[(8 * index) + i],
                                number: ((8 * index) + i + 1),
                                berthType: seatMatrix
                                    .allSeats[(8 * index) + i + 1].seatBerth
                                    .toString(),
                                revert: i > 2 ? true : false,
                                berthName: seatMatrix
                                    .allSeats[(8 * index) + i + 1].berthName
                                    .toString(),
                              );
                            }),
                          ),
                        ),
                        SizedBox(
                          width: dimens.maxWidth * 0.1667,
                          height: maxHeight / 4,
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: ((dimens.maxWidth * 0.1667) /
                                (maxHeight / 9)),
                            crossAxisCount: 1,
                            children: List.generate(2, (i) {
                              return SeatBox(
                                glow: glowArray.value[(8 * index) + i + 6],
                                number: ((8 * index) + i + 7),
                                berthType: seatMatrix
                                    .allSeats[(8 * index) + i + 7].seatBerth
                                    .toString(),
                                berthName: seatMatrix
                                    .allSeats[(8 * index) + i + 7].berthName
                                    .toString(),
                                revert: i == 1 ? true : false,
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
