class Occurrence {
  const Occurrence(
    this.date,
    this.description,
    this.id,
    this.place,
      //this.imageCard
  );

  final String date;
  final String description;
  final String id;
  final String place;
  //final String? imageCard;
}

enum Options { open, closed }
