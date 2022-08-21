import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sura_event.dart';
part 'sura_state.dart';

class SuraBloc extends Bloc<SuraEvent, SuraState> {
  SuraBloc() : super(SuraInitial()) {
    on<SuraEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
