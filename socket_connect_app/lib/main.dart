import 'package:flutter/material.dart';

// import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    connectSocket();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print("btn clicked");
                    connectSocket();
                  },
                  child: const Text(
                    "Connect",
                  )),
              Row(
                children: [
                  const Expanded(
                    flex: 7,
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.send,
                            size: 40,
                          )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void connectSocket() {
    try{
      IO.Socket socket = IO.io('http://192.168.10.14:9000',  IO.OptionBuilder().setTransports(['websocket']).build());
      socket.onConnect((_) {
        print('connect');
        //socket.emit('msg', 'test');
      });
      socket.onConnectError((data) => print("Connection Error: $data"));
      socket.on('admin-notification', (data) => print(data));
      //socket.onDisconnect((_) => print('disconnect'));
      //socket.on('fromServer', (_) => print(_));
    }catch(e,s){
      print("exception: $e");
      print("stack tress: $s");
    }
  }
}
