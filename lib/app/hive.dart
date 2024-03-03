import 'package:finance_app/app/info.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveSetup {
  static Future<void> setup() async {
    var appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(ExpensesAdapter()); // Register the Expenses adapter
    await Hive.openBox<List<Expenses>>('expenses');
  }
}

class ExpensesAdapter extends TypeAdapter<Expenses> {
  @override
  int get typeId => 0;

  @override
  Expenses read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expenses(
      sum: fields[0] as int,
      theme: fields[1] as String,
      description: fields[2] as String,
      dateTime: DateTime.parse(fields[3] as String),
    );
  }

  @override
  void write(BinaryWriter writer, Expenses obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..writeInt(obj.sum)
      ..writeByte(1)
      ..write(obj.theme)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.dateTime.toIso8601String());
  }
}
