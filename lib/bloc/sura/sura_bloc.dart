import 'dart:async';

import 'package:meta/meta.dart';
import 'package:quran/core/components/app_packages.dart';

part 'sura_event.dart';
part 'sura_state.dart';

class SuraBloc extends Bloc<SuraEvent, SuraState> {
  late Sura _sura;
  SuraBloc() : super(SuraInitial()) {
    on<SuraSelectedEvent>(_selectSura);
  }

  FutureOr<void> _selectSura(
    SuraSelectedEvent event,
    Emitter emit,
  ) {
    _sura = event.sura;
  }

  Sura get sura => _sura;
}
