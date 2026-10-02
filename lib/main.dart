import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HuertoPage(),
    );
  }
}
class HuertoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HuertoPageState();
}

class  _HuertoPageState extends State<HuertoPage>{
  final controller = TextEditingController();
  final List<String> cultivos = [];

  void agregar(){
    final texto = controller.text.trim();
    if(texto.isEmpty) return;
    setState(() {
      cultivos.add(texto);
      controller.clear();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title:  const Text('Mi huerto'),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Nombre del cultivo',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height:  10,),
            ElevatedButton(
              onPressed: agregar,
              child: const Text('Guardar')),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: cultivos.length,
                  itemBuilder: (_, i) =>
                  ListTile(
                    leading: const Icon(Icons.eco),
                    title:  Text(cultivos[i]),
                  )
                  ), 
              
              )

          ],
        ),
      ),
    );
  }

}