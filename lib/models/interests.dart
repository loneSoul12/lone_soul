class Interest {
  Interest({this.id, this.interestName, this.isSelected});
  final int? id;
  final String? interestName;
  bool? isSelected;

  factory Interest.fromJson(Map<String, dynamic> interest) {
    return Interest(
      id: interest[''],
      interestName: interest[''],
      isSelected: false,
    );
  }
}
