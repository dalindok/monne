part of 'language_bloc.dart';

class LanguageState extends Equatable {
  const LanguageState({
    this.selectLanguage = const Locale('km'),
  });

  final Locale selectLanguage;

  LanguageState copyWith({
    Locale? selectLanguage,
  }) {
    return LanguageState(
      selectLanguage: selectLanguage ?? this.selectLanguage,
    );
  }

  @override
  List<Object?> get props => [selectLanguage];
}
