class AyaRecipe {
  const AyaRecipe({
    required this.title,
    required this.subtitle,
    required this.asset,
  });

  /// Заголовок баннера.
  final String title;

  /// Подзаголовок баннера.
  final String subtitle;

  /// Ссылка на изображение.
  final String asset;
}
