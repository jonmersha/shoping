class SubTask {
  List<Data>? data;

  SubTask({this.data});

  SubTask.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? iD;
  int? parentId;
  String? taskName;
  String? descriptions;
  int? isCompleted;
  String? dateCreated;
  String? taskStartDate;
  String? dateStarted;
  String? taskEndDate;
  String? dateComplete;
  double? currentProgress;
  int? isProgressive;

  Data(
      {this.iD,
        this.parentId,
        this.taskName,
        this.descriptions,
        this.isCompleted,
        this.dateCreated,
        this.taskStartDate,
        this.dateStarted,
        this.taskEndDate,
        this.dateComplete,
        this.currentProgress,
        this.isProgressive});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    parentId = json['parent_id'];
    taskName = json['task_name'];
    descriptions = json['descriptions'];
    isCompleted = json['is_completed'];
    dateCreated = json['date_created'];
    taskStartDate = json['task_start_date'];
    dateStarted = json['date_started'];
    taskEndDate = json['task_end_date'];
    dateComplete = json['date_complete'];
    currentProgress = json['current_progress'];
    isProgressive = json['is_progressive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['parent_id'] = parentId;
    data['task_name'] = taskName;
    data['descriptions'] = descriptions;
    data['is_completed'] = isCompleted;
    data['date_created'] = dateCreated;
    data['task_start_date'] = taskStartDate;
    data['date_started'] = dateStarted;
    data['task_end_date'] = taskEndDate;
    data['date_complete'] = dateComplete;
    data['current_progress'] = currentProgress;
    data['is_progressive'] = isProgressive;
    return data;
  }
}
