import 'package:boongg/model/field.dart';
import '../model/field.dart';
import 'field_event.dart';

class SetField extends FieldEvent {
  List<Field> fieldList;

  SetField(List<Field> field) {
    fieldList = field;
  }
}
