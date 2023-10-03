import 'dart:math';

import 'package:flutter/material.dart';

class WaveSlider extends StatefulWidget {
  @override
  _WaveSliderState createState() => _WaveSliderState();
}

class _WaveSliderState extends State<WaveSlider> {
  double bar2Position = 180.0;
  List<int> bars = [];
  final double barWidth = 5.0;

  void _onTapDown(TapDownDetails details) {
    var x = details.globalPosition.dx;
    setState(() {
      bar2Position = x;
    });
  }

  @override
  void initState() {
    super.initState();
    Random r = Random();
    for (var i = 0; i < 100; i++) {
      bars.add(r.nextInt(40) + 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    int barItem = 0;
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            GestureDetector(
              onTapDown: (TapDownDetails details) => _onTapDown(details),
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  bar2Position = details.globalPosition.dx;
                });
              },
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: bars.map((int height) {
                    Color color = barItem + 1 < bar2Position / barWidth
                        ? Colors.blue
                        : Colors.grey;
                    barItem++;
                    return Container(
                      width: barWidth,
                      height: height.toDouble(),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Positioned(
              left: bar2Position - 10,
              top: 0.0,
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
