// EX 2 – The best cards (handout page: EX 2). Start code for Part 1.
// Try Part 1 yourself first, then compare with ex2_part1_correction.dart.

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            Container(
                // YOUR CODE
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.grey)
                  )
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',  
                            style: TextStyle(
                              color: Colors.blue
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('description')
                        ],
                      )
                    ),
                    IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                  ],
                ),
                )
          ],
        ),
      ),
    ));
