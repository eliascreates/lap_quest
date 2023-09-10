part of 'ticket_bloc.dart';

abstract class TicketState extends Equatable {
  const TicketState();  

  @override
  List<Object> get props => [];
}
class TicketInitial extends TicketState {}
