String namesFormatter(String? names) {
  if (names == null || names.isEmpty) {
    return "";
  }

  List<String> words = names.split(RegExp(r'(?<=[\s-_])|(?=[\s-_])'));

  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    if (word.isNotEmpty) {
      words[i] = word[0].toUpperCase() + word.substring(1).toLowerCase();
    }
  }

  return words.join();
}