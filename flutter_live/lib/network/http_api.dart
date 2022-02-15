class HttpApi {
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction =
  const bool.fromEnvironment('dart.vm.product');
  //请求服务器地址
  // static const String baseUrl = "http://192.168.0.27:7003/";//刘伟
  //  static const String baseUrl = "http://192.168.0.124:7003/";//开发环境
  static const String baseUrl = "http://192.168.0.125:7003/";//测试环境
  // static const String baseUrl =   "http://3492t682m1.zicp.vip/bmmobile/";//test环境
  // static const String baseUrl = "https://cbyzs.com:7003/"; //生产环境


//  图片资源地址
//   static const String ftpUrl = "http://192.168.0.127:7778/";
  static const String ftpUrl = "";


  //用户登录
  static const String login = "login/token";
  static const String refresh_login = "login/fetchTokenInfo";
  //获取用户所有菜单权限
  static const String get_allUserMenus = "user/getUserMenusPerms";
  //获取当前用户角色列表
  static const String  get_allUserRoles = "user/getUserRoles";

  ///首页
  //获取未读消息数
  static const String get_msgCount = "homePage/sysMesUnreadCount";
  //消息详情
  static const String find_MsgDetail  = "homePage/findUserSysDtl";
  //获取春播动态列表
  static const String find_Articles = "article/getArticleListCB";
  //获取春播动态详情
  static const String find_articleDetail = "article/getArticleById";

  //用户消息列表
  static const String get_msgList = "homePage/findUserSysMesList";

  ///贴敷预警
  //查询贴敷预警列表
  static const String sticking_warning_list = "stickingWarning/findPage";

  //查询贴敷预警详情
  static const String sticking_warning_clinic = "stickingWarning/findDetailList";
  // 帖敷预警结果提交
  static const String stickingWarning_handleStickingWarning = "stickingWarning/handleStickingWarning";
  // 贴敷预警-根据id查询预警详情
  static const String stickingWarning_findById = "stickingWarning/findById";


  ///数据中心
  //贴敷统计-销量统计
  static const String statistics_ClinicsCurDayAndBeforeStick = "statistics/findClinicsCurDayAndBeforeStick";
  //贴敷统计-7日贴敷处方量 折线图
  static const String statistics_Clinic7DaySpCount = "statistics/findMultipleClinic7DaySpCount";
  //贴敷统计-6个月贴敷处方量 折线图
  static const String statistics_Clinic6MonthSpCount = "statistics/findMultipleClinic6MonthSpCount";
  //贴敷统计-诊所销量
  static const String statistics_ClinicStickData = "statistics/findMultipleClinicStickData";
  //贴敷统计-7日 多折线图
  static const String statistics_Attach7DaysLineChart = "statistics/tftjDayLineChart";
  //贴敷统计-6月 多折线图
  static const String statistics_Attach6MonthLineChart = "statistics/tftjMonthLineChart";
  //贴敷统计-7日 表格
  static const String statistics_Attach7Tabel = "statistics/tftjDayList";
  //贴敷统计-6月 表格
  static const String statistics_Attach6MonthTabel = "statistics/tftjMonthList";

  //单个诊所-贴敷统计-销量统计
  static const String statistics_singleClinicsCurDayAndBeforeStick = "/statistics/findSingleClinicCurDayAndBeforeStick";
  //单个诊所-贴敷统计-7日贴敷处方量 折线图
  static const String statistics_singleClinic7DaySpCount = "statistics/findSingleClinic7DaySpCount";
  //单个诊所-贴敷统计-6个月贴敷处方量 折线图
  static const String statistics_singleClinic6MonthSpCount = "statistics/findSingleClinic6MonthSpCount";
  //单个诊所-贴敷统计-诊所销量
  static const String statistics_DoctorStickData = "statistics/findDoctorStickData";

  //九和统计-销售统计
  static const String statistics_DMYJiuhe = "statistics/findCurDMYJhSale";
  //九和销量-近七天
  static const String statistics_Clinic7DayJhSale = "statistics/findMultipleClinic7DayJhSale";
  //九和销量-近六个月
  static const String statistics_Clinic6MonthJhSale = "statistics/findMultipleClinic6MonthJhSale";
  //九和饮多个诊所销量列表
  static const String statistics_ClinicsJhSale = "statistics/findClinicsJhSale";
  //九和饮多个诊所单品使用量
  static const String statistics_ClinicsPerJhSale = "statistics/findClinicsPerJhSale";

  //九和统计-销售统计-单个诊所
  static const String statistics_SingleDMYJiuhe = "statistics/findCurDMYJhSale";
  //九和销量-近七天-单个诊所
  static const String statistics_SingleClinic7DayJhSale = "statistics/findSingleClinic7DayJhSale";
  //九和销量-近六个月-单个诊所
  static const String statistics_SingleClinic6MonthJhSale = "statistics/findSingleClinic6MonthJhSale";
  //九和饮多个诊所销量列表
  static const String statistics_singleClinicsJhSale = "statistics/findSingleClinicJhSale";
  //九和饮多个诊所单品使用量-单个诊所
  static const String statistics_SingleClinicsPerJhSale = "statistics/findClinicPerJhSale";

  //胃药统计-销售统计
  static const String statistics_DMYWySale = "statistics/findCurDMYWySale";
  //胃药销量-近七天
  static const String statistics_Clinic7DayWySale = "statistics/findMultipleClinic7DayWySale";
  //胃药销量-近六个月
  static const String statistics_Clinic6MonthWySale = "statistics/findMultipleClinic6MonthWySale";
  //胃药多个诊所销量列表
  static const String statistics_ClinicsWySale = "statistics/findClinicsWySale";
  //胃药多个诊所单品使用量
  static const String statistics_ClinicsPerJWySale = "statistics/findClinicsPerWySale";

  //单个诊所-胃药统计-销售统计
  static const String statistics_singleDMYWySale = "statistics/findSingleClinicCurDMYJhSale";
  //单个诊所-胃药销量-近七天
  static const String statistics_singleClinic7DayWySale = "statistics/findSingleClinic7DayWySale";
  //单个诊所-胃药销量-近六个月
  static const String statistics_singleClinic6MonthWySale = "statistics/findSingleClinic6MonthWySale";
  //单个诊所-胃药销量列表
  static const String statistics_singleClinicsWySale = "statistics/findSingleClinicWySale";
  //单个诊所-胃药单品使用量
  static const String statistics_singleClinicsPerJWySale = "statistics/findClinicPerWySale";

  //诊所统计-销量统计
  static const String statistics_ClinicsBaseData = "statistics/findClinicsBaseData";
  //诊所统计-诊所销量
  static const String statistics_ClinicsDataList = "statistics/findClinicsDataList";
  //诊所统计-项目构成
  static const String statistics_ClinicsXmgc = "statistics/findClinicsXmgc";
  //诊所统计-患者构成
  static const String statistics_ClinicHzgc = "statistics/findClinicHzgc";
  //诊所统计-7日门诊量 折线图
  static const String statistics_Clinics7DaysData = "statistics/findClinics7DaysData";
  //诊所统计-6月门诊量 折线图
  static const String statistics_Clinics6MonthData = "statistics/findClinics6MonthData";
  //诊所统计-7日处方量 折线图
  static const String statistics_Clinics7DaysPreCount = "statistics/findClinics7DaysPreCount";
  //诊所统计-6月处方量 折线图
  static const String statistics_Clinics6MonthPreCount = "statistics/findClinics6MonthPreCount";
  //诊所统计-7日 多折线图
  static const String statistics_Clinics7DaysLineChart = "statistics/zstjDayMztjLineChart";
  //诊所统计-6月 多折线图
  static const String statistics_Clinics6MonthLineChart = "statistics/zstjMonthMztjLineChart";
  //诊所统计-7日 表格
  static const String statistics_Clinics7Tabel = "statistics/zstjDayMztjList";
  //诊所统计-6月 表格
  static const String statistics_Clinics6MonthTabel = "statistics/zstjMonthMztjList";


  //单个诊所统计-销量统计
  static const String statistics_singleClinicsBaseData = "statistics/findSingleClinicBaseData";
  //单个诊所统计-诊所销量
  static const String statistics_singleClinicsDataList = "statistics/findSingleClinicDataList";
  //单个诊所统计-项目构成
  static const String statistics_singleClinicsXmgc = "statistics/findSingleClinicXmgc";
  //单个诊所统计-患者构成
  static const String statistics_singleClinicHzgc = "statistics/findSingleClinicHzgc";
  //单个诊所统计-7日门诊量 折线图
  static const String statistics_singleClinics7DaysData = "statistics/findSingleClinic7DaysData";
  //单个诊所统计-6月门诊量 折线图
  static const String statistics_singleClinics6MonthData = "statistics/findSingleClinic6MonthData";
  //单个诊所统计-7日处方量 折线图
  static const String statistics_singleClinics7DaysPreCount = "statistics/findSingleClinic7DaysPreCount";
  //单个诊所统计-6月处方量 折线图
  static const String statistics_singleClinics6MonthPreCount = "statistics/findSingleClinic6MonthPreCount";

  // 疗效预警相关 -------开始-----

  // 多个诊所对比数据
  static const String stickingWarningStatis_findClinicsBaseData = "stickingWarningStatis/findClinicsBaseData";
  // 单个诊所对比数据
  static const String stickingWarningStatis_findSingleClinicBaseData = "stickingWarningStatis/findSingleClinicBaseData";
  // 多个诊所7日折线图
  static const String stickingWarningStatis_findClinics7DayData = "stickingWarningStatis/findClinics7DayData";
  // 单个诊所7日折线图
  static const String stickingWarningStatis_findSingleClinic7DayData = "stickingWarningStatis/findSingleClinic7DayData";
  // 多个诊所6个月折线图
  static const String stickingWarningStatis_findClinics6MonthData = "stickingWarningStatis/findClinics6MonthData";
  // 单个诊所6个月折线图
  static const String stickingWarningStatis_findSingleClinic6MonthData = "stickingWarningStatis/findSingleClinic6MonthData";
  // 多个诊所 列表查询
  static const String stickingWarningStatis_findClinicsDataList = "stickingWarningStatis/findClinicsDataList";
  // 单个诊所 列表查询
  static const String stickingWarningStatis_findSingleClinicDataList = "stickingWarningStatis/findSingleClinicDataList";

  // 疗效预警相关 -------结束-----

  //地图分组数据
  static const String statistics_MapDataGroup = "statistics/findMapDataByGroup";
  //地图统计数据
  static const String statistics_MapDataSum = "statistics/findMapDataSum";
  static const String statistics_home= "statistics/homeStatistics";
  static const String statistics_GetMapJson = "statistics/getMapJson";
  static const String config_GetChinaMapVersion = "sysGlobalConfig/getMapVersion";

  //查询组织机构子节点
  static const String organization_ChildProvinceCityList = "organization/getChildProvinceCityList";
  // 组织机构-查询顶级机构列表(带用户数量)
  static const String organization_getAllTopListWithUserCount = "organization/getAllTopListWithUserCount";
  // // 组织机构-根据上级查询下级机构列表(带用户数量)(8月20日后台通知此接口废弃)
  static const String organization_getChildListWithUserCount = "organization/getChildListWithUserCount";
  // 组织机构-搜索机构下的员工列表(8月20日后台通知此接口废弃)
  static const String organization_getUserPageByOrgId = "organization/getUserPageByOrgId";
  // 根据上级机构id查询下级机构列表及直属的员工列表
  static const String organization_getOrgEmpListByOrgId = "organization/getOrgEmpListByOrgId";
  // 通过员工的名字搜索员工（可模糊搜索）
  static const String organization_searchEmpsByName = "organization/searchEmpsByName";

  // 根据当前用户截取机构子树
  static const String  organization_getEmpTrees = "organization/getEmpTrees";

  // 获取全部机构
  static const String  organization_getAllTreeOn = "organization/getAllTreeOn";


  ///诊所管理
  ///意向诊所
  //意向诊所-列表
  static const String intent_ClinicList="clinicManage/intentClinicList";
  static const String intent_ClinicBase = "clinicManage/intentClinicBaseData";
  //新增意向诊所
  static const String add_IntentClinic = "clinicManage/addIntentClinic";
  //修改意向诊所
  static const String edit_IntentClinic = "clinicManage/updIntentClinic";
  //意向转合作诊所
  static const String coop_withClinic = "clinicManage/coopWithClinic";
  //查询意向诊所详情
  static const String check_IntentClinicInfo = "clinicManage/checkIntentClinicInfo";

  ///合作诊所
  static const String coop_ClinicList="clinicManage/coopClinics";
  static const String coop_ClinicBase = "clinicManage/coopClinicBaseData";
  static const String coop_ClinicInfo = "clinicManage/checkCoopClinicInfo";
  // 解除合作诊所
  static const String clinicManage_terminateCoop = "clinicManage/terminateCoop";
  //关联诊所-列表
  static const String find_clinicOrgServ = "clinicOrgServ/getClinicOrgServPageByCityId";
  //关联诊所-修改关联诊所
  static const String clinicOrgServ_relatedToEmp = "clinicOrgServ/relatedToEmp";
  //关联诊所-新增关联诊所
  static const String clinicOrgServ_relatedToEmpConfirm = "clinicOrgServ/relatedToEmpConfirm";
  //关联诊所-查询当前已关联的诊所
  static const String clinicOrgServ_myRelatedClinicList = "clinicOrgServ/getMyRelatedClinicList";

  //查询完整的省市区树形结构
  static const String get_AllCityTrees  = "cityData/getAllTrees";
  //查询字典表所有数据
  static const String get_DicCode = "dicCode/getDicCode";

  ///员工管理
  //查询员工信息（根据id查询详情）
  static const String employee_findDetail = "employee/findDetail";
  // 获取员工列表 移动端分页查询
  static const String employee_appPage = "employee/appPage";
  // 新增员工
  static const String employee_add = "employee/add";
  // 修改员工
  static const String employee_update = "employee/update";
  // 获取全部角色列表
  static const String role_getAllRoles = "role/getAllRoles";
  // 获取全部职位列表
  static const String position_getAllPositions = "position/getAllPositions";
  // 查询手机号
  static const String employee_findEmpPhone = "employee/findEmpPhone";


  // 日报相关
  // 查询业务经理所管的诊所列表
  static const String dailyBiz_findManagerClinics = "dailyBiz/findManagerClinics";
  // 新增日报
  static const String dailyBiz_submitDailyBiz = "dailyBiz/submitDailyBiz";
  // 暂存日报
  static const String dailyBiz_stageDailyBiz = "dailyBiz/stageDailyBiz";
  // 更新日报
  static const String  dailyBiz_updateDailyBiz = "dailyBiz/updateDailyBiz";
  // 查询日报列表-我的汇报
  static const String dailyBiz_findDailyBizList = "dailyBiz/findDailyBizList";
  // 删除日报
  static const String dailyBiz_delDailyBiz = "dailyBiz/delDailyBiz";
  // 获取日报详情
  static const String dailyBiz_readDailyBiz = "dailyBiz/readDailyBiz";
  // 根据蹲守日期汇总日报数据
  static const String dailyBiz_dailyBizSummary = "dailyBiz/dailyBizSummary";




  ///获取版本信息
  static const String find_latestVersion = "version/findLatestVersion";
  static const String find_versionList = "version/findVersionList";


  ///月度汇报
  //新增月度汇报
  static const String add_monthWorkReport = "szMonthWorkReport/addReport";
  //总部-查询月度汇报列表
  static const String zb_monthWorkReport_list = "szMonthWorkReport/findPage";
  //省办-查询月度汇报列表
  static const String sb_monthWorkReport_list = "szMonthWorkReport/findMyPage";
  //查询月度汇报详情
  static const String monthWorkReport_detail = "szMonthWorkReport/findDetail";
  //修改月度汇报但不提交
  static const String monthWorkReport_update = "szMonthWorkReport/updateReport";
  //修改月度汇报但-提交
  static const String monthWorkReport_submit = "szMonthWorkReport/submitReport";
  //获取全部省办列表
  static const String get_AllProvince = "organization/getAllProvinces";
  //服务端查询可选月份
  static const String find_SelectMonths = "szMonthWorkReport/getSelectMonths";

  //上传文件
  static const String upload = "oss/upload";
  //多文件上传
  static const String multiUpload = "oss/multiUpload";
  static final String noticeNum = "document/noticeNum";//未读消息数量

  //修改密码
  static const String changePassword = "user/updatePersonPwd";

  ///文件下发
  //文件所有分类
  static const String  documentAllTree = "document/getAllTreeOn";
  //文件列表
  static const String  documentArticleList = "document/getArticleList";
  //文件详情
  static const String documentArticleDetail = "document/getArticleById";
  //文件状态设为已读
  static const String documentBrowserStatus = "document/upBrowserStatus";
  //查看文件预览列表
  static const String documentBrowseList= "document/findBrowseListByArticleId";


  // 学术档案
  // 获取全部的省机构列表及总部学术节点
  static const String organization_getAllProvincesWithZBXS= "organization/getAllProvincesWithZBXS";
  // 根据机构id职位类别标识查询员工列表分页
  static const String employee_getEmpXueshuPageInOrgId= "employee/getEmpXueshuPageInOrgId";


  ///学术统计
  //学术统计-按月统计学术九宫格数量（全国、省区）
  static const String find_xueshuSTDataByMonth = "xueshuST/getXueshuSTDataByMonth";
  //学术统计-学术统计-6条折线图（全国、省区）基地带教 、培训、巡诊、单病种、研讨会、三伏贴
  static const String find_statisticsAxisLines= "xueshuST/getStatisticsAxisLines";
  //学术统计-查询省办学术、地办学术人数柱形图（全国、省区）
  static const String find_SDbanMonthColumns= "xueshuST/getSDbanMonthColumns";
  //学术统计-查询学术人员资质情况饼图、学历情况饼图（全国、省区）
  static const String find_XszzAndXsxlStatisticsPieChart = "xueshuST/getXszzAndXsxlStatisticsPieChart";
  //学术统计-查询基地带教、巡诊等6大项目表格(全国)
  static const String find_xueshuSTStatisticsTables = "xueshuST/getStatisticsTables";
  //学术统计-查询基地带教、巡诊等6大项目表格的单项明细（全国）
  static const String find_xueshuSTStatisticsTablesSP = "xueshuST/getStatisticsTablesSP";
  //学术统计-查询省办学术、地办学术人数表格（全国）
  static const String find_xueshuSDbanProvinceTables = "xueshuST/getSDbanProvinceTables";
  //学术统计-查询学术人员资质、学历情况表格（全国）
  static const String find_xueshuProvinceProjectExtTable = "xueshuST/getProvinceProjectExtTable";
  //学术统计-查询基地带教、巡诊等6大项目表格(省区)
  static const String find_xueshuSTProjectActListInProvince = "xueshuST/getProjectActListInProvince";
  //学术统计-查询学术人员资质、学历情况表格（省区）
  static const String find_xueshuProjectSDbanListInProvince = "xueshuST/getProjectSDbanListInProvince";

  ///市场统计
  //市场统计-按截止日期统计市场的九宫格数据（全国、省区）
  static const String find_ShichangSTDatasByDate = "shichangST/getShichangSTDatasByDate";
  //市场统计-按月查询业务团队建设的单项明细柱形图（全国、省区）
  static const String find_StatisticsMonthTablesSP = "shichangST/getStatisticsMonthTablesSP";
  //市场统计-查询消肿、胃药、九和的销量数据柱形图（全国、省区）
  static const String find_SalesMonthColumns = "shichangST/getSalesMonthColumns";
  //市场统计-查询业务人员学历情况饼图（全国、省区）
  static const String find_YwxlStatisticsPieChart = "shichangST/getYwxlStatisticsPieChart";
  //市场统计-查询门诊量、处方量、人均用贴数折线图 （全国、省区）
  static const String find_MZStatisticsAxisLines = "shichangST/getMZStatisticsAxisLines";
  //市场统计-按日查询云诊所使用量统计 （全国、省区）
  static const String find_YzsUseStatistics = "shichangST/getYzsUseStatistics";
  //市场统计-查询消肿、九和、胃药销量表格 （全国）
  static const String find_shichangSTStatisticsTables = "shichangST/getStatisticsTables";
  //市场统计-查询消肿、九和、胃药销量（业务团队建设）的单项表格明细（全国）
  static const String find_shichangStatisticsTablesSP = "shichangST/getStatisticsTablesSP";
  //市场统计-查询业务人员学历情况表格（全国）
  static const String find_shichangProvinceProjectExtTable = "shichangST/getProvinceProjectExtTable";
  //市场统计-查询门诊情况(门诊量、处方量、人均用贴数)表格（全国）
  static const String find_shichangProvinceStatisticsMZTable = "shichangST/getProvinceStatisticsMZTable";
  //市场统计-查询各省区云诊所使用量表格 （全国）
  static const String find_shichangProvinceStatisticsYzsUse = "shichangST/getProvinceStatisticsYzsUse";
  //省办市场统计-查询门诊情况(门诊量、处方量、人均用贴数)表格（省区）
  static const String find_shichangSTCityStatisticsMZTable = "shichangST/getCityStatisticsMZTable";
  //省办市场统计-查询消肿、九和、胃药表格明细列表 （省区）
  static const String find_shichangProjectStatisticsSPList = "shichangST/getProjectStatisticsSPList";
  //市场统计-根据省id查询各地办的门诊情况(门诊量、处方量、人均用贴数)表格
  static const String find_CityStatisticsMZTable = "shichangST/getCityStatisticsMZTable";
  //市场统计-按省id分组查询各地办的云诊所使用量表格
  static const String find_CityStatisticsYzsUse = "shichangST/getCityStatisticsYzsUse";
  //市场统计-根据地机构id查询各个诊所的门诊情况(门诊量、处方量、人均用贴数、贴敷复诊率) 表格
  static const String find_ClinicStatisticsMZTable = "shichangST/getClinicStatisticsMZTable";
  //市场统计-根据地机构code查询各诊所的使用云诊所情况表格
  static const String find_ClinicStatisticsYzsUse = "shichangST/getClinicStatisticsYzsUse";
  //市场统计-根据地机构code查询各诊所的使用云诊所情况表格-新
  static const String find_ClinicStatisticsYzsUse2 = "shichangST/getClinicStatisticsYzsUse2";
  ///自媒体报备
  //左边tab
  static const String weMedia_findOrgList = "weMedia/findOrgList";
  //自媒体列表
  static const String weMedia_findMediaList = "weMedia/findMediaList";
  //更新关注量
  static const String weMedia_quickUpd = "weMedia/quickUpd";
  //删除自媒体账号
  static const String weMedia_del = "weMedia/del";
  //查看媒体账号详情
  static const String weMedia_detailById = "weMedia/findDtlById";
  //新增媒体账号机构选择
  static const String weMedia_getProvinceAndCity = "weMedia/getProvinceAndCity";
  //新增自媒体账号
  static const String add_weMedia = "weMedia/add";
  //编辑自媒体账号
  static const String update_weMedia = "weMedia/update";
}
