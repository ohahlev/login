// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpinningSquare(),
    );
  }
}

class SpinningSquare extends StatefulWidget {
  @override
  _SpinningSquareState createState() => _SpinningSquareState();
}

class _SpinningSquareState extends State<SpinningSquare>
    with SingleTickerProviderStateMixin {
  AnimationController _animation;

  @override
  void initState() {
    super.initState();
    // We use 3600 milliseconds instead of 1800 milliseconds because 0.0 -> 1.0
    // represents an entire turn of the square whereas in the other examples
    // we used 0.0 -> math.pi, which is only half a turn.
    _animation = AnimationController(
      duration: const Duration(milliseconds: 3600),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 100.0),
                child: RotationTransition(
                    turns: _animation,
                    child: Container(
                        width: 100.0,
                        height: 100.0,
                        child: Image.asset('assets/google-chrome.png'))
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Icon(
                        Icons.person,
                        size: 50.0,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Username'
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Icon(
                        Icons.lock,
                        size: 50.0,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Password'
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  child: RaisedButton(
                    child: const Text('Login'),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    elevation: 5.0,
                    onPressed: () {
                      // Perform some action
                    },
                  )
              )
            ]),

      );
  }
}

void main() {
  runApp(MyApp());
}
