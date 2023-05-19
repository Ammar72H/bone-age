class ReportsModel {
  ReportsModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
  late final int count;
  late final Null next;
  late final Null previous;
  late final List<Results> results;

  ReportsModel.fromJson(Map<String, dynamic> json){
    count = json['count'];
    next = null;
    previous = null;
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['next'] = next;
    _data['previous'] = previous;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.patientName,
    required this.image,
    required this.date,
    required this.result,
  });
  late final int id;
  late final String patientName;
  late final String image;
  late final String date;
  late final String? result;

  Results.fromJson(Map<String, dynamic> json){
    id = json['id'];
    patientName = json['patient_name'];
    image = json['image'];
    date = json['date'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['patient_name'] = patientName;
    _data['image'] = image;
    _data['date'] = date;
    _data['result'] = result;
    return _data;
  }
}