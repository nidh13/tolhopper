part of 'vignette_bloc.dart';

@immutable
abstract class VignetteEvent extends Equatable {}

class GetVignettesHistory extends VignetteEvent {
  final String language;

  GetVignettesHistory({required this.language});

  @override
  List<Object?> get props => [language];
}
