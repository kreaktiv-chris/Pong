import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pong made by CS',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Pong made by CS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late final Ticker ticker;
  Duration lastTick = Duration.zero;
  bool firstTick = true;
  final FocusNode focusNode = FocusNode();





  double ballGeschwindigkeitX = Random().nextDouble() * -50;

  double ballGeschwindigkeitY = Random().nextDouble() * -50;


  // Aktuelle Position und Mittelpunkt des Balls
  double ballX = 0;
  double ballY = 0;
  double ballDurchmesser = 30;

  double schlaegerY = 300;


  // Größe des Spielfeld
  double spielfeldBreite = 0;
  double spielfeldHoehe = 0;

  double schlaegerHoehe = 130;
  double schlaegerBreite = 50;

  // Pfeiltaste gedrückt
  bool pfeilHoch = false;
  bool pfeilRunter = false;

  // ============================================================
  // HIER WIRD DAS SPIEL PROGRAMMIERT
  // Diese Funktion wird 10x pro Sekunde aufgerufen.
  // ============================================================

  void nextTick() {
    ballX = ballX + ballGeschwindigkeitX;
    ballY = ballY + ballGeschwindigkeitY;

  if(ballX > spielfeldBreite -ballDurchmesser /2) {
    ballGeschwindigkeitX = 0 -ballGeschwindigkeitX;
  }

  if(ballX < 0 + ballDurchmesser /2) {
     ballGeschwindigkeitX = 0 -ballGeschwindigkeitX;
  }

  if(ballY > spielfeldHoehe - ballDurchmesser /2) {
    ballGeschwindigkeitY = 0 - ballGeschwindigkeitY;
  }

  if(ballY < 0 + ballDurchmesser /2) {
    ballGeschwindigkeitY = - ballGeschwindigkeitY;
  }

  if(pfeilHoch == true) {
    schlaegerHoehe = schlaegerHoehe + 1;
  }
  }









  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
        focusNode: focusNode,
        autofocus: true,
        onKeyEvent: (event) {
          if (event.logicalKey == LogicalKeyboardKey.arrowDown)
            pfeilRunter = event is! KeyUpEvent;
          else if (event.logicalKey == LogicalKeyboardKey.arrowUp)
            pfeilHoch = event is! KeyUpEvent;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: IconButton(
                  onPressed: () { setState(() => reset());},
                  icon: const Icon(Icons.lock_reset),
                ),
              ),
            ],
          ),
          body: LayoutBuilder(
              builder: (context, constraints) {
                spielfeldBreite = constraints.maxWidth;
                spielfeldHoehe = constraints.maxHeight;
                if(firstTick) {
                  firstTick = false;
                  reset();
                }

                return  Stack(
                  children: [

                    // Dies ist der Ball
                    Positioned( // Gibt die aktuelle Position vor
                      left: ballX - ballDurchmesser / 2,
                      top: ballY - ballDurchmesser / 2,
                      child: Container( // Das ist der runde Kreis
                        width: ballDurchmesser,
                        height: ballDurchmesser,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            center: Alignment(-0.35, -0.35),
                            radius: 0.9,
                            colors: [
                              Color(0xFFB3E5FC),
                              Color(0xFF29B6F6),
                              Color(0xFF0277BD),
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.35),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    // Ende Ball


                     // Schläger <----------------------------------------------------------------------------------------------------------------

                    Positioned(
                      left: spielfeldBreite - 55,
                      top: schlaegerY,
                      child: Container(
                        width: schlaegerBreite,
                        height: schlaegerHoehe,
                        color: Colors.black
                      ),
                    ),


                  ],
                );
              }),
        )
    );
  }

  @override
  void initState() {
    super.initState();

    ticker = createTicker((Duration elapsed) {
      if((elapsed - lastTick).inMilliseconds >= 100) {
        lastTick += const Duration(milliseconds: 100);
        setState(() => nextTick());
      }
    });

    ticker.start();
  }

  @override
  void dispose() {
    ticker.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void reset() {
      ballX = spielfeldBreite / 2;
      ballY = spielfeldHoehe / 2;
  }
}