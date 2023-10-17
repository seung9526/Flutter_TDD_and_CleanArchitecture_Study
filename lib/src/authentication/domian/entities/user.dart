import 'package:equatable/equatable.dart';

class User extends Equatable {

  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avater,
  });

  const User.empty() :
        this(id: 1,
          createdAt: '_empty.createdAt',
          name: '_empty.name',
          avater: '_empty.avater',
      );

  final int id;
  final String createdAt;
  final String name;
  final String avater;

  @override
  List<Object?> get props => [id];
}