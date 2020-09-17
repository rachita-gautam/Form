import 'package:boongg/model/field.dart';
import 'field_event.dart';

class UpdateField extends FieldEvent {
  Field newField;
  int fieldIndex;

  UpdateField(int index, Field field) {
    newField = field;
    fieldIndex = index;
  }
}
