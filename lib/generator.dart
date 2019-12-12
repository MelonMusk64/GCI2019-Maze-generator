import 'dart:math';

import 'package:flutter/material.dart';

class MazeGenerator extends CustomPainter {
  var dupa;
  var sizee;

  List<List<int>> maze() {
    var w = 1;
    var h = 1;
    final size = 29;
    final grid = List<List<int>>.generate(size,
        (i) => List<int>.generate(size, (j) => (j - 1) % 2 | (i - 1) % 2));
    for (; h < size - 1; h++) {
      if (h % 2 == 0) {
        h++;
      }
      for (; w < size - 1; w++) {
        if (w % 2 == 0) {
          w++;
        }
        Random random = new Random();
        var ran = random.nextInt(2);

        print(ran);
        if (ran == 0) /* right wall*/ {
          if (grid[h][w + 1] == 1) {
            if (w + 1 < size - 1) /*it wont delete edge line */ {
              grid[h][w + 1] = 0;
              print("d0psko");
            } else {
              ran = 1;
            }
          }
        } 
        if (ran == 1) /* top wall*/ {
          if (grid[h - 1][w] == 1) {
            if (h - 1 > 0) /*it wont delete edge line */ {
              grid[h - 1][w] = 0;
              print("d0pa");
            } else {
              if (w + 1 < size - 1) /*it wont delete edge line */ {
                grid[h][w + 1] = 0;
                print("dupa");
              }
            }
          }
        }
      }
      w = 0;
    }
    dupa = grid;
    sizee = size;
  }

  @override
  void paint(Canvas canvas, Size sizeee) {
    maze();
    var w = 0;
    var h = 0;

    const l = 12.0;

    final Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 3;

    print(dupa);

    for (; h < sizee; h++) {
      for (; w < sizee; w++) {
        var p11 = Offset(l * w, l * h);
        var p21 = Offset(l * (w + 1), l * h);
        if (h % 2 == 0) {
          if (dupa[h][w] % 2 == 1) {
            canvas.drawLine(p11, p21, paint);
          }
        }
        var p12 = Offset(l * (w + 0.5), l * (h - 1));
        var p22 = Offset(l * (w + 0.5), l * (h + 1));
        if (h % 2 == 1) {
          if (dupa[h][w] % 2 == 1) {
            canvas.drawLine(p12, p22, paint);
          }
        }
      }
      w = 0;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}