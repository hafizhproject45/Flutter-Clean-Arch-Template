class DateParams {
  final DateTime? startDate;
  final DateTime? endDate;

  const DateParams({this.startDate, this.endDate});

  Map<String, dynamic> toJson() => {
    if (startDate != null) 'start': startDate!.toIso8601String(),
    if (endDate != null) 'end': endDate!.toIso8601String(),
  };
}
