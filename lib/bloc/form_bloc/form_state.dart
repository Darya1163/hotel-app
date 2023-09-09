part of 'form_bloc.dart';

class TouristFormState extends Equatable {
  const TouristFormState({
    this.tourists = const <Widget>[
      SizedBox(height: 8),
      ExpansionForm(isExpanded: true, title: 'Первый турист '),
      SizedBox(height: 8),
      ExpansionForm(isExpanded: false, title: 'Второй турист '),
      SizedBox(height: 8),
    ],
  });
  final List<Widget> tourists;

  @override
  List<Object> get props => [tourists];
}
