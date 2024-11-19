class Definition {
  final String? partOfSpeech; // Jenis kata (noun, verb, dll)
  final String? definition;  // Definisi
  final String? example;     // Contoh penggunaan
  final List<String>? synonyms; // Daftar sinonim
  final List<String>? antonyms; // Daftar antonim

  Definition({
    this.partOfSpeech,
    this.definition,
    this.example,
    this.synonyms,
    this.antonyms,
  });

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      partOfSpeech: json['partOfSpeech'] as String?,
      definition: json['definition'] as String?,
      example: json['example'] as String?,
      synonyms: (json['synonyms'] as List?)?.map((e) => e as String).toList(),
      antonyms: (json['antonyms'] as List?)?.map((e) => e as String).toList(),
    );
  }
}
