import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class MP3Picker extends StatefulWidget {
  const MP3Picker({super.key});

  @override
  _MP3PickerState createState() => _MP3PickerState();
}

class _MP3PickerState extends State<MP3Picker> {
  static const platform =
      MethodChannel('com.example.ringtone_picker/ringtones');
  List<String> mp3Files = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _getMP3Files();
  }

  Future<void> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      // Permission granted, you can proceed
      _getMP3Files();
    } else {
      // Permission denied, handle appropriately
    }
  }

  Future<void> _playAudio(String filePath) async {
    try {
      await _audioPlayer.play(DeviceFileSource(filePath));
    } catch (e) {
      print("Failed to playe audio $e");
    }
  }

  Future<void> _getMP3Files() async {
    try {
      final List<dynamic> result = await platform.invokeMethod('getRingtones');
      setState(() {
        mp3Files = List<String>.from(result);
      });
    } on PlatformException catch (e) {
      print("Failed to get MP3 files: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select MP3')),
      body: ListView.builder(
        itemCount: mp3Files.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mp3Files[index]),
            onTap: () {
              // Handle MP3 selection
              _playAudio(mp3Files[index]);
            },
          );
        },
      ),
    );
  }
}
