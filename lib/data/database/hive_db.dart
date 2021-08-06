import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

const String _settings = 'Settings';

Future<void> initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox(_settings);
}

class LocalX {
  static Box<dynamic> getSettingBox() => Hive.box(_settings);
}
