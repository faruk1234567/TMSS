import 'package:intl/intl.dart';

class Urls {
  static const baseUrl = "http://123.253.147.242:7775";
  static const login = '$baseUrl/api/account/login';

  static const organizationsList = '$baseUrl/api/sms/base-school-name/get-organizationsList';
  static const moduleFeaturesList = '$baseUrl/api/Module/get-module-features';
  static const courseDetails = 'http://123.253.147.242:7775/api/sms/course-duration/get-courseDurationDetail/';
  static const courseDurationDetails = 'http://123.253.147.242:7775/api/sms/bna-subject-name/get-subjectInstructorListByCourseDuration/';
  static const traineeNominationUrl = '$baseUrl/api/sms/trainee-nomination/get-traineeNominationListByCourseDurationIdspRequest?courseDurationId=';
  static const obtainMarkListUrl='$baseUrl/api/sms/bna-exam-mark/get-traineeMarkListByParameters?courseDurationId=&baseSchoolNameId=&traineeId=';
  static const courseNameDetails = 'http://123.253.147.242:7775/api/sms/course-name/get-courseNameDetail/';
  static const obtainRankId='$baseUrl/api/sms/ranks/get-rankDetail/';
  static const obtainCdDetail='$baseUrl/api/sms/course-duration/get-courseDurationDetail/';
  static const obtainTrainee='$baseUrl/api/sms/trainee-bio-data-general-info/get-traineedetails/';
  static const baseSchoolId='http://123.253.147.242:7775/api/sms/base-School-name/get-baseSchoolNameDetail/';
  static const courseNamedId='http://123.253.147.242:7775/api/sms/course-name/get-courseNameDetail/';
  static const NameOfTheCourse='http://123.253.147.242:7775/api/sms/course-name/get-courseNameDetail/';
  static const QcourseDetails = 'http://123.253.147.242:7775/api/sms/course-duration/get-courseDurationDetail/';
  static const sCollegeMarkList = 'http://123.253.147.242:7775/api/sms/bna-exam-mark/get-traineeMarkListByDurationForStuffClg/';
  static const sCollegeList = 'http://123.253.147.242:7775/api/sms/course-duration/get-courseDurationDetail/';
  static const courseNamedDetails = 'http://123.253.147.242:7775/api/sms/course-name/get-courseNameDetail/';
  static const mist = 'http://123.253.147.242:7775/api/sms/course-duration/get-courseDurationByCourseType?PageSize=10&PageNumber=1&courseTypeId=1022/';








//static String localCourseData =
//   '$baseUrl/api/sms/dashboard/get-runningCourseDurationfromprocedure?courseTypeId=3&CurrentDate=$date&viewStatus=';
}
