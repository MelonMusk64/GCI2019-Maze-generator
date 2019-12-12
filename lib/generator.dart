import 'dart:math';

import 'package:flutter/material.dart';

class MazeGenerator extends CustomPainter {
  var labirynth;
  var sizee;

  List<List<int>> maze() {
    var c = 1; // column
    var r = 1; //row
    final size = 29;
    final grid = List<List<int>>.generate(size,
        (i) => List<int>.generate(size, (j) => (j - 1) % 2 | (i - 1) % 2));
    for (; r < size - 1; r++) {
      if (r % 2 == 0) {
        r++;
      }
      for (; c < size - 1; c++) {
        if (c % 2 == 0) {
          c++;
        }
        Random random = new Random();
        var ran = random.nextInt(2);

        print(ran);
        if (ran == 0) /* right wall*/ {
          if (grid[r][c + 1] == 1) /*is there wall or empty space*/{
            if (c + 1 < size - 1) /*it wont delete edge line */ {
              grid[r][c + 1] = 0;
              print("d0psko");
            } else {
              ran = 1;
            }
          }
        } 
        if (ran == 1) /* top wall*/ {
          if (grid[r - 1][c] == 1)/*is there wall or empty space*/ {
            if (r - 1 > 0) /*it wont delete edge line */ {
              grid[r - 1][c] = 0;
              print("d0pa");
            } else {
              if (c + 1 < size - 1) /*it wont delete edge line */ {
                grid[r][c + 1] = 0;
                print("dupa");
              }
            }
          }
        }
      }
      c = 0;
    }
    labirynth = grid;
    sizee = size;
  }

  @override
  void paint(Canvas canvas, Size size) {
    maze();
    var c = 0; //column
    var r = 0; //row

    const l = 12.0; //lenght of wall

    final Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 3;

    //print(labirynth);

    for (; r < sizee; r++) {
      for (; c < sizee; c++) {
        //horizontal walls
        var p11 = Offset(l * c, l * r); //start point of wall
        var p21 = Offset(l * (c + 1), l * r); //end point od wall
        if (r % 2 == 0) {
          if (labirynth[r][c] % 2 == 1) {
            canvas.drawLine(p11, p21, paint);
          }
        }
        //vertical walls
        var p12 = Offset(l * (c + 0.5), l * (r - 1));//start point of wall
        var p22 = Offset(l * (c + 0.5), l * (r + 1));//end point od wall
        if (r % 2 == 1) {
          if (labirynth[r][c] % 2 == 1) {
            canvas.drawLine(p12, p22, paint);
          }
        }
      }
      c = 0;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}