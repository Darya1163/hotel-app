part of 'form_bloc.dart';

class TouristFormState extends Equatable {
  const TouristFormState({
    this.tourists = const <Widget>[],
  });
  final List<Widget> tourists;

  @override
  List<Object> get props => [tourists];
}
