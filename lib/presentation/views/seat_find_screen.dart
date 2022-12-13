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

    ValueNotifier<List<bool>> glow =
        ValueNotifier<List<bool>>(List.generate(seatMatrix.allSeats.length - 1, (index) => false));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  height: constraints.maxHeight,
                  child: Center(
                    child: Text(
                      "RailSearch",
                      style: TextStyle(
                        color: Colors.blue[200],
                        fontSize: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 80
                            : 40,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SearchBar(
              glowArray: glow,
            ),
            Flexible(
              flex: 12,
              child: MatrixView(
                glowArray: glow,
                seatMatrix: seatMatrix,
              ),
            )
          ],
        ),
      ),
    );
  }
}
