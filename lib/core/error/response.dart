import 'package:equatable/equatable.dart';

class ResponseI extends Equatable {
  final String message;
  const ResponseI({required this.message});

  @override
  List<Object?> get props => [message];
}
