import 'package:boongg/model/field.dart';
import '../model/field.dart';
import 'field_event.dart';

class AddField extends FieldEvent {
  Field newField;

  AddField(Field field) {
    newField = field;
  }
}
