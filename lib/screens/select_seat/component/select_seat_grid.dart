import 'package:flutter/material.dart';
import 'package:tentwenty_test/config/extensions/height_width_extension.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';

class ChairGrid extends StatefulWidget {
  @override
  _ChairGridState createState() => _ChairGridState();
}

class _ChairGridState extends State<ChairGrid> {
  List<List<String>> seatingChart = [
    [
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray'
    ],
    [
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray'
    ],
    [
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray'
    ],
    [
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray'
    ],
    [
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray'
    ],
    [
      'blue',
      'gray',
      'gray',
      'blue',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'blue',
      'blue',
      'blue',
      'gray',
      'gray',
      'gray'
    ],
    [
      'blue',
      'gray',
      'blue',
      'gray',
      'blue',
      'gray',
      'blue',
      'gray',
      'blue',
      'gray',
      'blue',
      'gray',
      'blue',
      'gray',
      'blue',
      'gray',
      'blue',
      'gray'
    ],
    [
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      ' gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray'
    ],
    [
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray',
      'gray'
    ],
    [
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple',
      'purple'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 18,
      ),
      itemCount: seatingChart.length * seatingChart[0].length,
      itemBuilder: (context, index) {
        int row = index ~/ seatingChart[0].length;
        int col = index % seatingChart[0].length;

        if (col == 4 || col == 13) {
          return Container(
            height: 20,
            color: Colors.transparent,
          );
        }

        if (row == 0 && (col < 2 || col >= seatingChart[0].length - 2)) {
          return Container(
            color: Colors.transparent,
          );
        }

        if ((row == 1 || row == 2 || row == 3) &&
            (col == 0 || col == seatingChart[0].length - 1)) {
          return Container(
            color: Colors.transparent,
          );
        }

        return GestureDetector(
          onTap: () {
            setState(() {
              if (seatingChart[row][col] == 'purple') {
                seatingChart[row][col] = 'umber';
              } else if (seatingChart[row][col] == 'gray') {
                // Do nothing
              } else if (seatingChart[row][col] == 'blue') {
                seatingChart[row][col] = 'umber';
              } else if (seatingChart[row][col] == 'umber') {
                seatingChart[row][col] = 'blue';
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Center(
              child: Icon(
                Icons.chair,
                size: 12,
                color: seatingChart[row][col] == 'purple'
                    ? ColorPalette.purple
                    : seatingChart[row][col] == 'gray'
                        ? Colors.grey
                        : seatingChart[row][col] == 'blue'
                            ? ColorPalette.blue
                            : ColorPalette.amber,
              ),
            ),
          ),
        );
      },
    );
  }
}
