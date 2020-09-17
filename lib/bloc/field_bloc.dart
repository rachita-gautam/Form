import 'package:boongg/events/field_event.dart';
import 'file:///C:/Users/91856/AndroidStudioProjects/boongg/lib/model/field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldBloc extends Bloc<FieldEvent, List<Field>> {
  FieldBloc(List<Field> initialState) : super(initialState);

  @override
  List<Field> get initialState => List<Field>();

  @override
  Stream<List<Field>> mapEventToState(FieldEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        List<Field> newState = List.from(state);
        if (event.field != null) {
          newState.add(event.field);
        }
        yield newState;
        break;
      case EventType.delete:
        List<Field> newState = List.from(state);
        print(newState.length);
        newState.removeAt(event.fieldIndex);
        yield newState;
        break;
      default:
        throw Exception('Event not found $event');
    }
  }
}
