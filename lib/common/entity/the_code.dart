import 'package:equatable/equatable.dart';

class TheCode extends Equatable {
  final String theCode;
  final TheCodeSelectionSource source;

  const TheCode({
    required this.theCode,
    required this.source,
  });

  @override
  List<Object?> get props => [theCode, source];
}

enum TheCodeSelectionSource {
  fromScroll,
  fromButtonClick,
  fromBrowserAddressBar
}
