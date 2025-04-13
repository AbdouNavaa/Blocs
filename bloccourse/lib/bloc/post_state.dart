import 'package:equatable/equatable.dart';

sealed class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PostLoading extends PostState {}

final class PostLoaded extends PostState {
  final List<dynamic> posts;
  PostLoaded(this.posts);
  @override
  List<Object?> get props => [posts];
}

final class PostError extends PostState {
  final String message;
  PostError(this.message);
  @override
  List<Object?> get props => [message];
}
