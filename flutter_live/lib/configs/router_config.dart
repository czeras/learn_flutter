
import 'package:get/get.dart';
import '../pages/home/home_page.dart';


class RouterConfig{

  ///首页
  static final String home = "/";
  static final String homeNews = '/news';
  static final String homeNewsDetail = '/newsDetail';


  // ///工作台-数据中心
  // /// 诊所统计
  // static final String clinicStatistics = "/work/dataCenter/clinicStatistics";
  // //数据中心-学术统计
  // static final String dataCenter = "/work/dataCenter";
  // //学术统计明显-全国
  // static final String academicDetail = "/work/dataCenter/academicDetail";
  // //学术统计明显-省区
  // static final String academicDetailP = "/work/dataCenter/academicDetailP";
  // //市场统计明显-全国
  // static final String marketDetail = "/work/dataCenter/marketDetail";
  // //市场统计明显-省区
  // static final String marketDetailP = "/work/dataCenter/marketDetailP";
  // //市场统计明显-地区
  // static final String marketDetailProvice = "/work/dataCenter/marketDetailProvice";
  // //市场统计明显-地区
  // static final String marketDetailCity = "/work/dataCenter/marketDetailCity";
  //
  // ///工作台-数据中心-单个诊所统计
  // static final String singleClinic = "/work/data/singleClinic";
  //
  // ///消息中心
  // static final String messageCenter = "/home/messageCenter";
  //
  // // 帖敷预警 （单个，根据地域筛选到某一个具体的业务员下面为单个）
  // static final String attachSingleWarnCenter = "/home/attachSingleWarnCenter";
  // // 帖敷预警 （多个）
  // static final String attachClinicWarnCenter = "/home/attachClinicWarnCenter";
  //
  // ///贴敷预警列表
  // static final String attachWarnListCenter = "/home/attachWarnPage";
  // // 贴敷预警筛选
  // static final String attachWarnFilter = "/home/attachWarnFilterPage";
  // ///贴敷预警详情
  // static final String attachWarnDetailCenter = "/home/attachWarnDetailPage";
  // // 帖敷预警处置结果
  // static final String attachWarnResultCenter = "/home/attachWarnResultPage";
  // // 查看帖敷预警处置结果
  // static final String attachWarnHandleCenter = "/home/attachWarnHandlePage";
  //
  //
  // // 组织架构
  // static final String organizational = "/my/organizationalPage";
  // //用户信息
  // static final String userInfo = "/my/userInfo";
  // //修改资料
  // static final String perfectUserInfo = "/my/perfectUserInfo";
  // // 账户设置
  // static final String account_setting = "/my/login_account";
  // static final String change_password = "/my/login_changepwd";
  // //版本记录
  // static final String versionRecord = "/my/versionRecord";
  // //权限管理
  // static final String  permissions = "/my/permissions";
  //
  // //意向诊所-列表
  // static final String intentionClinic = "/work/clinic/intention_list";
  //
  // //意向诊所-新增
  // static final String addIntentionClinic = "/work/clinic/add_intention";
  //
  // //合作诊所-列表
  // static final String cooperationClinic = "/work/clinic/cooperation_list";
  //
  // //关联诊所-列表/选择诊所
  // static final String affiliatedClinic = "/work/clinic/affiliated_list";
  // //关联诊所-提交
  // static final String conmitAffiliatedClinic = "/work/clinic/affiliatedCommit";
  //
  // //诊所档案页面
  // static final String clinicDetail = "/work/clinic/clinic_detail";
  // static final String clinicCooperationDetail = "/work/clinic/clinic_cooperation_detail";
  //
  // // webView公共页
  // static final String webView = "/common/webview";
  //
  // // 员工列表
  // static final String emplyeeList = "/work/emplyee_list";
  // static final String emplyeeAdd = "/work/emplyee_add";
  // static final String emplyeeWork = "/work/emplyee_work";
  // static final String emplyeeEdu = "/work/emplyee_edu";
  //
  // //办公
  // static final String monthlyReport = '/work/monthlyReport/list';
  // static final String monthlyReportDetail = '/work/monthlyReport/detail';
  // // 业务经理
  // static final String dailyReport = '/work/dailyReport/list';
  // // 地总日汇报
  // static final String dailyDizongReport = '/work/dailyReport/dailyDizongReport';
  // static final String addDailyReportPatient = '/work/dailyReport/add/patient_info'; // 添加患者信息
  // static final String addMonthlyReport = '/work/monthlyReport/add';
  // static final String dailyReportList = '/work/dailyReportList/list';
  // static final String dailyReportDetailReadonly = '/work/dailyReportList/addReadOnly';
  // // 总部/省总日汇报
  // static final String dailyShengReportList = 'work/office/daily/daily_sheng_report_list';
  //
  // //文件库
  // static final String fileLibraryList = "/work/file/list";
  // static final String fileLibraryDetail = "/work/file/detail";
  // static final String fileFileProgress = "/work/file/progress";
  //
  // // 学术档案
  // static final String academicOrgPage = "/work/academic/academic_org";
  //
  // ///企划中心
  // //制度学习
  // static final String institutionalLearning = "/word/planningCenter/institutionalLearning";
  // //自媒体报备
  // static final String mediaReporting = "/word/planningCenter/mediaReporting";
  // //新增自媒体报备
  // static final String addmedia = "/word/planningCenter/addmedia";
  // //预约数据
  // static final String reservationData = "/word/planningCenter/reservationData";
  // //宣传物料
  // static final String publicityMaterial = "/word/planningCenter/publicityMaterial";
  // //企划公共
  // static final String planningPublic= "/word/planningCenter/planningPublic";


  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: home, page: () => HomePage()),
  ];
}
