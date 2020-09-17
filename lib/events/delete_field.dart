import 'package:boongg/model/field.dart';
import 'field_event.dart';

class DeleteField extends FieldEvent {
  int fieldIndex;

  DeleteField(int index) {
    fieldIndex = index;
  }
}
