import 'package:testproject/api.dart';
import 'package:testproject/dio_provider.dart';
import 'package:testproject/irepository.dart';
import 'package:testproject/message_dto.dart';
import 'package:testproject/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewModelProvider =
    StateNotifierProvider<ViewModel, AsyncValue<MessageDTO>>(
  (ref) => ViewModel(Repository(Api(ref.watch(dioProvider)))),
);

class ViewModel extends StateNotifier<AsyncValue<MessageDTO>> {
  ViewModel(this._repository) : super(const AsyncLoading());

  final IRepository _repository;

  Future<void> retrieveMessage() async {
    state = const AsyncLoading();
    final MessageDTO message = await _repository.retrieveMessage();
    state = AsyncValue.data(message);
  }
}
