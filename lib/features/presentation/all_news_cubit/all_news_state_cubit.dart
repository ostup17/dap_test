import 'package:equatable/equatable.dart';

import '../../domain/entity/all_news_entity.dart';

abstract class AllNewsState extends Equatable {
  const AllNewsState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AllNewsEmpty extends AllNewsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AllNewsLoading extends AllNewsState {
  final List<AllNewsEntity> oldAllNews;
  final bool isFirstFetch;

  AllNewsLoading(this.oldAllNews, {this.isFirstFetch = false});
  @override
  // TODO: implement props
  List<Object?> get props => [oldAllNews];
}

class AllNewsLoaded extends AllNewsState {
  final List<AllNewsEntity> allNewsList;
  AllNewsLoaded(this.allNewsList);

  @override
  // TODO: implement props
  List<Object?> get props => [allNewsList];
}

class AllNewsError extends AllNewsState {
  final String message;
  AllNewsError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}