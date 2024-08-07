import 'package:flutter/material.dart';

import 'validators.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Streams & RxDart")),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: validation.email,
              builder: (_, snapShot) => TextField(
                onChanged: (val) => validation.sinkEmail.add(val),
                decoration: InputDecoration(
                    hintText: 'Email',
                    errorText:
                        snapShot.hasError ? snapShot.error.toString() : null),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            StreamBuilder(
              stream: validation.message,
              builder: (_, snapShot) => TextFormField(
                onChanged: (val) => validation.sinkMessage.add(val),
                decoration: InputDecoration(
                    label:const Text('Mensagem'),
                    errorText:
                        snapShot.hasError ? snapShot.error.toString() : null),
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            StreamBuilder(
              stream: validation.submitValid,
              builder: (_, snapShot) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      snapShot.data != true ? Colors.grey[200] : Colors.red,
                ),
                onPressed: snapShot.data != true ? () {} : () {},
                child: const Text(
                  'Inscrever-se',
                  style: TextStyle(
                    letterSpacing: 1.4,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}