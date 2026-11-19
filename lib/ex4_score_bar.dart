import 'package:flutter/material.dart';

// EX 4 – Score bar (BONUS, free style: handout page EX 4)
// The design, the widgets and the data are up to you.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF9AC93E),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ScoreCard(title: 'My score in Flutter'),
              ScoreCard(title: 'My score in Dart'),
              ScoreCard(title: 'My score in React')
            ],
          ),
        )
      ),
    ),
  );
}

class ScoreCard extends StatefulWidget {
  final String title;
  final int initialScore;
  const ScoreCard({
    super.key,
    required this.title,
    this.initialScore = 1
  });

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  static const int minScore = 1;
  static const int maxScore = 10;

  late int _score;

  void initState() {
    super.initState();
    _score = widget.initialScore.clamp(minScore, maxScore);
  }

  void decrement() {
    if(_score > minScore){
      setState(() {
        _score--;
      });
    }
  }

  void increment(){
    if(_score < maxScore){
      setState(() {
        _score++;
      });
    }
  }

  Color get _progressColor {
    if(_score<=3) return Colors.green.shade400;
    if(_score<=7) return Colors.green.shade600;
    return Colors.green.shade900;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 26,
              color: Colors.grey
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: _score > minScore ? decrement : null, 
                icon: Icon(Icons.remove)
              ),
              IconButton(
                onPressed: _score < maxScore ? increment : null, 
                icon: Icon(Icons.add)
              )
            ],
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 36,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 1.5),
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              FractionallySizedBox(
                widthFactor: _score/maxScore,
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: _progressColor,
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
