import 'package:audioplayers/audioplayers.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher(){
  Workmanager().executeTask((task,inputData){
    final ringtonePath = inputData?['ringtonePath'] as String?;
    if(ringtonePath != null){
      _playRingtone(ringtonePath);
    }
    return Future.value(true);
  });

}

void _playRingtone(String ringtonePath) async{
  final player = AudioPlayer();
  await player.play(DeviceFileSource(ringtonePath));
}