class QexamTraineeMarkListModel {
  String? pno;
  String? name;
  Null? rank;
  String? indexNo;
  String? noOfAttempt;
  String? billet;
  String? navalFinancialManagement;
  String? underWaterWarfare;
  String? totalObtained;
  Null? totalMark;
  String? percentage;
  String? passStatus;

  QexamTraineeMarkListModel(
      {this.pno,
        this.name,
        this.rank,
        this.indexNo,
        this.noOfAttempt,
        this.billet,
        this.navalFinancialManagement,
        this.underWaterWarfare,
        this.totalObtained,
        this.totalMark,
        this.percentage,
        this.passStatus});

  QexamTraineeMarkListModel.fromJson(Map<String, dynamic> json) {
    pno = json['pno'];
    name = json['name'];
    rank = json['rank'];
    indexNo = json['indexNo'];
    noOfAttempt = json['noOfAttempt'];
    billet = json['billet'];
    navalFinancialManagement = json['naval Financial Management'];
    underWaterWarfare = json['under Water Warfare'];
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
    data['noOfAttempt'] = this.noOfAttempt;
    data['billet'] = this.billet;
    data['naval Financial Management'] = this.navalFinancialManagement;
    data['under Water Warfare'] = this.underWaterWarfare;
    data['total Obtained'] = this.totalObtained;
    data['total Mark'] = this.totalMark;
    data['percentage'] = this.percentage;
    data['pass Status'] = this.passStatus;
    return data;
  }
}
