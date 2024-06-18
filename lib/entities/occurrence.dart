class Occurrence {
  const Occurrence(
    this.date,
    this.description,
    this.id,
    this.place,
  );

  final String date;
  final String description;
  final String id;
  final String place;
}

enum Options { open, closed }
