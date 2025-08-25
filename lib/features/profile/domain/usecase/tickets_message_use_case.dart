import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_message_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class TicketsMessageUseCase {
  final ProfileRepository repository;

  TicketsMessageUseCase(this.repository);

  Future<TicketsMessageResponse> call({required int ticketId}) {
    return repository.fetchTicketsMessage(ticketId: ticketId);
  }
}
