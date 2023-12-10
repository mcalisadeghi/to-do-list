import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text editing controller to get acces to what the user typed
  final TextEditingController _controller = TextEditingController();

  // greeting message variable
  String greetingMesage = '';
  greetUser() {
    String userName = _controller.text;
    setState(
      () {
        greetingMesage = 'Hello,$userName';
      },
    );
  }

  reSetFild() {
    setState(
      () {
        greetingMesage = '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            25.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                greetingMesage,
              ),
              // textfield
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type your name...',
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: greetUser,
                    child: const Text(
                      'Tap',
                    ),
                    // greate user messet
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Back',
                    ),
                    // greate user messet
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => reSetFild(),
                    child: const Text(
                      'reset filde',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
