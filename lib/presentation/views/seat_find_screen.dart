//KARKALA SRINIVASA VENKATARAMANA
//OM JAI DURGE MAA

import 'package:flutter/material.dart';
import 'package:rail_book/data/data_source.dart';
import 'package:rail_book/data/seat_model.dart';
import 'package:rail_book/presentation/widgets/matrix_view.dart';
import 'package:rail_book/presentation/widgets/search_bar.dart';

class FindScreen extends StatelessWidget {
  const FindScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataSourceObj = SeatDataSource();
    SeatMatrixModel seatMatrix = dataSourceObj.getSeatMatrix();

    ValueNotifier<int> selSeat = ValueNotifier<int>(0);
    ValueNotifier<List<bool>> glow =
        ValueNotifier<List<bool>>(List.generate(32, (index) => false));

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "RailSearch",
              style: TextStyle(
                color: Colors.blue[200],
                fontSize: 80,
                letterSpacing: 1.5,
              ),
            ),
            SearchBar(
              inputValNotifier: selSeat,
              glowArray: glow,
            ),
            ValueListenableBuilder(
              valueListenable: glow,
              builder: ((context, value, child) => MatrixView(
                    glowArray: glow,
                    inpVal: selSeat,
                    seatMatrix: seatMatrix,
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
