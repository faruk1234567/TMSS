class StaffCMarkModel {
  String? pno;
  String? name;
  String? rank;
  String? indexNo;
  String? paperI;
  String? totalObtained;
  String? totalMark;
  String? percentage;
  String? passStatus;

  StaffCMarkModel(
      {this.pno,
        this.name,
        this.rank,
        this.indexNo,
        this.paperI,
        this.totalObtained,
        this.totalMark,
        this.percentage,
        this.passStatus});

  StaffCMarkModel.fromJson(Map<String, dynamic> json) {
    pno = json['pno'];
    name = json['name'];
    rank = json['rank'];
    indexNo = json['indexNo'];
    paperI = json['paper-I'];
    totalObtained = json['total Obtained'];
    totalMark = json['total Mark'];
    percentage = json['percentage'];
    passStatus = json['pass Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pno'] = this.pno;
    data['name'] = this.name;
    data['rank'] = this.rank;
    data['indexNo'] = this.indexNo;
    data['paper-I'] = this.paperI;
    data['total Obtained'] = this.totalObtained;
    data['total Mark'] = this.totalMark;
    data['percentage'] = this.percentage;
    data['pass Status'] = this.passStatus;
    return data;
  }
}
