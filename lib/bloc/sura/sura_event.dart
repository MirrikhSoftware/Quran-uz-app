part of 'sura_bloc.dart';

@immutable
abstract class SuraEvent {}

class SuraSelectedEvent extends SuraEvent {
  final Sura sura;
  SuraSelectedEvent(this.sura);
}
