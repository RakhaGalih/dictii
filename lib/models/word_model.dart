import 'package:dictii/models/definition_model.dart';

class Word {
  final String word;
  final String? phonetic; // Pronunciation
  final String? phonetics; // Link audio
  final List<Definition>? definitions; // List definisi

  Word({
    required this.word,
    this.phonetic,
    this.phonetics,
    this.definitions,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'] as String,
      phonetic: json['phonetic'] as String?,
      phonetics: json['phonetics'].isNotEmpty
          ? json['phonetics'][0]['audio'] as String?
          : null,
      definitions: (json['meanings'] as List)
          .map((meaning) => Definition.fromJson(
                {
                  'partOfSpeech': meaning['partOfSpeech'],
                  'definition': meaning['definitions'][0]['definition'],
                  'example': meaning['definitions'][0]['example'],
                  'synonyms': meaning['synonyms'],
                  'antonyms': meaning['antonyms'],
                },
              ))
          .toList(),
    );
  }
}
