class RedMateUpModel {
  List<Items>? items;
  int? totalPages;
  int? itemsFrom;
  int? itemsTo;
  int? totalItemsCount;

  RedMateUpModel(
      {this.items,
        this.totalPages,
        this.itemsFrom,
        this.itemsTo,
        this.totalItemsCount});

  RedMateUpModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
    itemsFrom = json['itemsFrom'];
    itemsTo = json['itemsTo'];
    totalItemsCount = json['totalItemsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = this.totalPages;
    data['itemsFrom'] = this.itemsFrom;
    data['itemsTo'] = this.itemsTo;
    data['totalItemsCount'] = this.totalItemsCount;
    return data;
  }
}

class Items {
  int? readingMaterialId;
  int? readingMaterialTitleId;
  int? courseNameId;
  int? baseSchoolNameId;
  int? documentTypeId;
  int? showRightId;
  int? downloadRightId;
  String? documentName;
  String? documentLink;
  bool? isApproved;
  String? approvedDate;
  dynamic? approvedUser;
  int? status;
  dynamic? menuPosition;
  bool? isActive;
  String? readingMaterialTitle;
  String? courseName;
  String? baseSchoolName;
  String? documentType;
  String? documentIcon;
  String? showRight;
  String? downloadRight;
  dynamic? aurhorName;
  dynamic? publisherName;

  Items(
      {this.readingMaterialId,
        this.readingMaterialTitleId,
        this.courseNameId,
        this.baseSchoolNameId,
        this.documentTypeId,
        this.showRightId,
        this.downloadRightId,
        this.documentName,
        this.documentLink,
        this.isApproved,
        this.approvedDate,
        this.approvedUser,
        this.status,
        this.menuPosition,
        this.isActive,
        this.readingMaterialTitle,
        this.courseName,
        this.baseSchoolName,
        this.documentType,
        this.documentIcon,
        this.showRight,
        this.downloadRight,
        this.aurhorName,
        this.publisherName});

  Items.fromJson(Map<String, dynamic> json) {
    readingMaterialId = json['readingMaterialId'];
    readingMaterialTitleId = json['readingMaterialTitleId'];
    courseNameId = json['courseNameId'];
    baseSchoolNameId = json['baseSchoolNameId'];
    documentTypeId = json['documentTypeId'];
    showRightId = json['showRightId'];
    downloadRightId = json['downloadRightId'];
    documentName = json['documentName'];
    documentLink = json['documentLink'];
    isApproved = json['isApproved'];
    approvedDate = json['approvedDate'];
    approvedUser = json['approvedUser'];
    status = json['status'];
    menuPosition = json['menuPosition'];
    isActive = json['isActive'];
    readingMaterialTitle = json['readingMaterialTitle'];
    courseName = json['courseName'];
    baseSchoolName = json['baseSchoolName'];
    documentType = json['documentType'];
    documentIcon = json['documentIcon'];
    showRight = json['showRight'];
    downloadRight = json['downloadRight'];
    aurhorName = json['aurhorName'];
    publisherName = json['publisherName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['readingMaterialId'] = this.readingMaterialId;
    data['readingMaterialTitleId'] = this.readingMaterialTitleId;
    data['courseNameId'] = this.courseNameId;
    data['baseSchoolNameId'] = this.baseSchoolNameId;
    data['documentTypeId'] = this.documentTypeId;
    data['showRightId'] = this.showRightId;
    data['downloadRightId'] = this.downloadRightId;
    data['documentName'] = this.documentName;
    data['documentLink'] = this.documentLink;
    data['isApproved'] = this.isApproved;
    data['approvedDate'] = this.approvedDate;
    data['approvedUser'] = this.approvedUser;
    data['status'] = this.status;
    data['menuPosition'] = this.menuPosition;
    data['isActive'] = this.isActive;
    data['readingMaterialTitle'] = this.readingMaterialTitle;
    data['courseName'] = this.courseName;
    data['baseSchoolName'] = this.baseSchoolName;
    data['documentType'] = this.documentType;
    data['documentIcon'] = this.documentIcon;
    data['showRight'] = this.showRight;
    data['downloadRight'] = this.downloadRight;
    data['aurhorName'] = this.aurhorName;
    data['publisherName'] = this.publisherName;
    return data;
  }
}
