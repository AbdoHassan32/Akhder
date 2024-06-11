import 'package:akhder/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothScreen extends StatefulWidget {
  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  BluetoothConnection? connection;
  bool isReady = false;
  String moisturePercentage = '';

  @override
  void initState() {
    super.initState();
    // _initializeBluetooth();
    connect('00:22:12:02:4B:CC');
    // _startListening();

  }

  /********************* */
  void getData(String address) async {
    try {
      BluetoothConnection connection =
      await BluetoothConnection.toAddress(address);
      print('Connected to the device');

      connection.input!.listen((Uint8List data) {
        print('Data incoming: ${ascii.decode(data)}');
        connection.output.add(data); // Sending data

        if (ascii.decode(data).contains('!')) {
          connection.finish(); // Closing connection
          print('Disconnecting by local host');
        }
      }).onDone(() {
        print('Disconnected by remote request');
      });
    } catch (exception) {
      print(exception.toString());
      print('Cannot connect, exception occured');
    }
  }


// Connect to the selected Arduino device
  Future<void> _connectToDevice(String address) async {
    try {
      connection = await BluetoothConnection.toAddress(address);
      connection!.input!.listen((Uint8List data) {
        print('Data incoming: ${ascii.decode(data)}');
      }).onDone(() {
        print('Disconnected by remote request');
      });
      setState(() {
        isReady = true;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  // Initialize Bluetooth and start scanning for devices
  Future<void> _initializeBluetooth() async {
    FlutterBluetoothSerial.instance.state.then((state) {
      try {
        if (state == BluetoothState.STATE_ON) {
          setState(() {
            isReady = true;
          });
          print('connection 1 done');
        }
      } catch (e) {
        print('Error: $e');
      }
    });

    try {

      List<BluetoothDiscoveryResult> results = [];

      void startDiscovery() {
        var streamSubscription = FlutterBluetoothSerial.instance
            .startDiscovery().listen((r) {
          results.add(r);
        });

        streamSubscription.onDone(() {
          //Do something when the discovery process ends
        });
      }



      List<BluetoothDevice> devices =
      await FlutterBluetoothSerial.instance.getBondedDevices();
      print(results.length);
      print(devices.length);

      await _connectToDevice('00:22:12:02:4B:CC');
      getData('00:22:12:02:4B:CC');
      print('connection done');

    } catch (e) {
      print('Error: $e');
    }
  }

  // Start listening for Bluetooth data

  void _startListening() async {
    if (connection == null || connection!.isConnected == false) {
      print('Bluetooth connection is not established.');
      return;
    }

    connection!.input?.listen((Uint8List data) {
      print('Raw data incoming: $data');
      try {
        String decodedData = utf8.decode(data);
        print('Decoded data: $decodedData');
        send(data);

        setState(() {
          moisturePercentage = decodedData;
        });
      } catch (e) {
        print('Error decoding data: $e');
      }
    }).onDone(() {
      print('Bluetooth connection closed');
    });
  }


  connect(String address) async {
    try {
      connection = await BluetoothConnection.toAddress(address);
      print('Connected to the device');
      _startListening();
    } catch (exception) {
      print('booom boom ${exception.toString()}');

      print('Cannot connect, exception occured');
    }
  }

  Future send(Uint8List data) async {
    connection!.output.add(data);
    await connection!.output.allSent;
    print (connection!.output.allSent);

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'نسبة الرطوبة',
          style: Styles.textStyle20.copyWith(
              color:Colors.white
          ),
        ),
        Text(
          moisturePercentage.toString() == '' ? '%0':'%${moisturePercentage.toString()}',
          style:Styles.textStyle20.copyWith(
              color:Colors.white
          ),
        ),
      ],
    );
  }
}