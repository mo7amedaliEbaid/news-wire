import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wire/apikey.dart';

import '../../models/news.dart';

part 'state.dart';
part 'data_provider.dart';
part 'repository.dart';

class TopHeadlinesCubit extends Cubit<TopHeadlinesState> {
  static TopHeadlinesCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<TopHeadlinesCubit>(context, listen: listen);

  TopHeadlinesCubit() : super(const TopHeadlinesLoading());

  final repository = NewsRepository();

  Future<void> fetch(String category,String countrycode,String language) async {
    emit(const TopHeadlinesLoading());

    try {
      Duration? difference;
      final currentTime = DateTime.now();
      List<News?>? data = [];

      data = await repository.fetchHive(category);

      DateTime? categoryTime = Hive.box('app').get('categoryTime');
      if (categoryTime != null) {
        difference = currentTime.difference(categoryTime);
      }

      if (data == null || (difference != null && difference.inHours > 1)) {
        data = await repository.fetchApi(category,countrycode,language);
      }

      emit(
        TopHeadlinesSuccess(data: data),
      );
    } catch (e) {
      emit(
        TopHeadlinesFailure(e.toString()),
      );
    }
  }
}
