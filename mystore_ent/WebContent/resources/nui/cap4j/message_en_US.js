message = new Cap4jUIMessage();

function Cap4jUIMessage(){}

Cap4jUIMessage.prototype.common = {
	notSaveData: "Please save the data!",
	notSaveModifyData: "Please have the modified data to save!",
	dataModify: "Data is modified, do you want to save?",
	chooseMsg: "Please select a record!",
	chooseMsgUpdate: "Please select a record modification!",
	deleteUnitConfirmMsg: "OK to delete the selected records?",
	executeSuccess:"Successful execution!",
	prompt:"prompt",
	uploadFile:"File upload",
	uploadPrompt:"Please select the file to be uploaded!",
	beginDateValidationMsg: "Start Date can not be greater than the end date!",
	endDateValidationMsg: "End date can not be less than the start date!",
	exportSucess:"Export success! Please go to the following path to view:",
	exportFailed:"Export failed! Please contact the system administrator."
};

Cap4jUIMessage.prototype.login = {
	inputUsername:"Please input login name",
	inputPassword:"Please input password",
	inputCaptcha:"Please input Captcha",
	reachMaxSession:"The system has reached the maximum number of user sessions"
};

Cap4jUIMessage.prototype.password = {
	confirmPwdNotSame: "The confirm password is not same with the new password!",
	passwordCombination: "Inadequate levels of password security, the lenth of the combination password must be greater than {0} and contains letters, numbers and special characters, please input again!",
	defaultpassword: "System default password:",
	title: "Change password"
};
	
Cap4jUIMessage.prototype.button = {
	advanceSearch: "AdvanceSearch",
	closeSearch:"CloseSearch"
};

Cap4jUIMessage.prototype.role = {
	addRole: "Add role",
	editRole:"Edit role",
	confirmDeleteRole: "Confirm delete the selected role?",
	errorDeleteSystemRole: "Role {0} is admin role, can not be deleted!",
	staffInfo: "Staff information",
	confirmAddStaff: "Confirm add the selected staffs to the role?",
	unitInfo: "Unit information",
	confirmDeleteStaff: "Confirm delete the selected staffs of the role?"
	
};

Cap4jUIMessage.prototype.staff = {
	addStaff: "Add staff",
	editStaff: "Edit staff",
	confirmDeleteStaff: "Confirm delete the selected staff?",
	roleInfo: "Role information",
	confirmAddRole: "Confirm add the selected roles to the staff?",
	unitInfo: "Unit information",
	confirmDeleteRole: "Confirm delete the selected roles of the staff?",
	noSelectParentNode: "Can not select parent node!",
	invalidNotesid : "Invalid NotesID, please input 6 digits!",
	invalidIDNumber: "Invalid ID number, please input again!",
	invalidEmail: "Invalid emai, please input again!",
	confirmLockStaff: "Confirm lock the selected staffs?",
	confirmUnLockStaff: "Confirm unlock the selected staffs?",
	confirmChangePassword: "Confirm change password?",
	lockedStaff: "The selected staffs had been locked!",
	unLockedStaff: "The selected staffs had been unlocked!",
	permissionInfo: "Information of staff permission",
	invalidPhone: "Invalid phone, please input cellphone number correctly !",
	invalidBirthday: "Birthday must be less than current Date, please input again!",
	lockCancellationStaff: "No need to lock the cancellation staff!",
	unlockCancellationStaff: "No need to unlock the cancellation staff!"
};
	
Cap4jUIMessage.prototype.ci = {
	roleCiDetail: "Detail information of role operation records",
	staffCiDetail:"Detail information of staff operation records",
	roleStaffCiDetail: "Detail information of role staff operation records",
	check:"Sure to check",
	cancelCheck:"Sure to cancel check",
	checkNote:"The record is not checked,please check!",
	checkNote1:" are modified,please check!",
	roleName:"Role ",
	staffName:"Staff ",
	successText:"Success！",
	successFHText:"Success,after checked become effective！"
};
Cap4jUIMessage.prototype.menu = {
	notChangeMenuNode: "First select a menu node!",
	notAddNode: "The menu is the menu path corresponding, can not add submenu!",
	newNode:"The new node 1",
	urlChoose:"Select URL",
	chooseMenuTree:"Select the menu tree",
	menuTree:"The menu tree",
	delMenu:"Sure to delete the selected menu?",
	menuName:"Menu name already exists,please fill!",
	menuRelationUrl:"Association of URL"
};
Cap4jUIMessage.prototype.url = {
	success:"Successful execution!",
	isUrlScan:"Are you sure use URL to automatically scan?"
};



Cap4jUIMessage.prototype.accessMonitor = {
	edit: "Function Access Statistics",
	frequency:"times",
	valueSuffix:"times",
	visit:"visit times",
	noData:"No Data.",
	hour:"hour",
	day:"day",
	month:"month",
	accessTitle:"Function Statistical Query",
	dayAccess:"Statistical Query Of Day",
	monthAccess:"Statistical Query Of Month",
	yearAccess:"Statistical Query Of Year"
};

Cap4jUIMessage.prototype.auditlog = {
	edit: "edit",
	notSelectRow: "Please select a record",
	open: "Open",
	close: "Close"
};

Cap4jUIMessage.prototype.log4jconfig = {
	add: "Add",
	edit: "Edit",
	notSelectRow: "Please select a record",
	resetConfirm: "Confirm to restore the production level of all the system logs?"
};

Cap4jUIMessage.prototype.codeInfo = {
	mblxbhIsExist: "Value you entered already exists",
	selectGridWindowTitle: "Select a list",
	codeInfoAddTitle: "Add codeInfo table",
	codeInfoEditTitle: "Edit codeInfo table",
	notSelectInfoRow: "Please select a dictionary sets record!",
	alertTitle: "Prompt",
	deleteInfoConfirmMsg: "OK to delete the selected code table entry?",
	refreshSuccessMsg: "Refresh success",
	refreshFailureMsg: "Refresh failure",
	addUserPassword:"Add user password",
	editUserPassword:"Reset password",
	deletePasswordConfirmMsg:"OK to delete the selected password table entry?",
	confirmPwdNotSame:"The confirm password is not same with the password!"
};

Cap4jUIMessage.prototype.codeType = {
	sjlxbhIsExist: "Value you entered already exists",
	booleanYes: "Yes",
	booleanNo: "No",
	codeTypeAddTitle: "Add code table",
	codeTypeEditTitle: "Edit code table",
	notSelectTypeRow: "Please select one yard table type record!",
	alertTitle: "Prompt",
	deleteTypeConfirmMsg: "OK to delete the selected dictionary type and its entries?",
	technology:"Technology",
	operation:"Operation"
};

Cap4jUIMessage.prototype.unit = {
	selectTreeTitle: "Select a tree",
	jgbhIsExist: "Value you entered already exists!",
	view: "view",
	edit: "edit",
	del: "delete",
	unitAddTitle: "New agency",
	unitEditTitle: "Editing agencies",
	unitLookTitle: "See agency information",
	staffAddTitle: "Adding staff",
	notSelectRow: "Please select a record",
	migrateError: "migrate data error",
	wait: "Operation, please wait",
	delError: "Delete Error",
	moveConfirm: "OK drag the {0}?",
	virtualNode: "Virtual node, you can not add people!",
	defaultDept: "Reserved institutions, not operation!"
};

Cap4jUIMessage.prototype.unitci = {
	viewTitle: "Details of the operation of water bodies",
	notSelectRow: "Please select a record"
};

Cap4jUIMessage.prototype.validation = {
	codeTableErrorMsg: "Length of code table configuration can not be more than {0}",
	codeTableNotEqualErrorMsg: "Length of code table configuration must be equal {0}"
};
Cap4jUIMessage.prototype.dataPermission = {
	lookDataPer: "View field permission",
	newDataPer: "New field permission",
	editDataPer: "Edit field permission"
};
Cap4jUIMessage.prototype.unitPermission = {
	chooseUnit: "Select organization",
	manageUnit: "Management organization",
	delUnit: "Sure to delete the organization?"
};
Cap4jUIMessage.prototype.roleassignper = {
	chooseUrlPer: "Select URL permissions",
	chooseUnitPer: "Select organization data access"
};
Cap4jUIMessage.prototype.permissionRelationRole = {
	chooseRole: "Choose role",
	chooseMenuAddRole: "Please select the menu to add role!",
	chooseRecordAddRole: "Please select a record to add a role!",
	notPer:"This role has been locked,assign permissions cannot be!",
	notPerRol:" has been locked,assign permissions cannot be!"
};

Cap4jUIMessage.prototype.information = {
	selectOtherConfirm:"Unsaved content will be lost, determined to load other record?",
	createNewConfirm:"Unsaved content will be lost, determined to create new record?",
	deleteConfirm:"Are you sure you delete the record?",
	titleIsNullAlert:"Title can not be empty!",
	statusIsNullAlert:"Status can not be empty!",
	groupIsNullAlert:"Group can not be empty!",
	odernoIsNullAlert:"Order number can not be empty!",
	contentIsNullAlert:"Content can not be empty!"
};

Cap4jUIMessage.prototype.feedback = {
	feedbackViewTitle:"View of Feedback",
	feedbackAnswerTitle:"Answer of Feedback",
	feedbackAddTitle:"New Feedback",
	chooseRecordAlert:"Please select a feedback problem!"
};

Cap4jUIMessage.prototype.schedule = {
	startTask: "Start task",
	stopTask: "Stop task",
	addTask: "Add schedule task",
	editTask: "Edit schedule task",
	taskCode: "Please input the task code first!",
	taskClass: "The execution class selector of schedule task",
	settingTitle: "The setup wizard of CronTab expression",
	errorDetail: "Display error information, function is not implemented",
	reactiveTask: "Manually restart the task, function is not implemented",
	executionDetail: "Task execution details",
	abnormalRecord: "Display abnormal records only",
	systemError: "System error, please contact the administrator!",
	minSelected:"please choice minute!",
	hourSelected:"please choice hour!",
	monthSelected:"please choice month!",
	daySelected:"please choice day!",
	secSelected:"please input right second!",
	openMonitor:"Open Monitor",
	closeMonitor:"Close Monitor"
};
//安全策略组管理
Cap4jUIMessage.prototype.securityPolicyGroupManage = {
	oneLevel: "One level security policy",
	twoLevel: "Two level security policy standards",
	threeLevel: "Three level security policy standards",
	userDefined: "User defined Security policy",
	enable: "Enable",
	alreadyEnable: "Already Enable",
	restoreDefault:"Restore default",
	submit: "Submit",
	labelVai: "Not more than 32!",
	accessLog: "Access log records please enter yes or no!",
	sessionControl: "Please enter a yes or no session control!",
	pwdModifiedValid: "The password can not be with the history password repeat please enter an integer!",
	passwordValid: "Password valid please enter a positive integer!",
	mostErrorNumber: "Password allows the most error number please enter a positive integer!",
	pwdShortestLength: "Limit the length of passwords shortest please enter an integer between 6 and 16!",
	defalutPassword: "The system default minimum password length is ",
	bit: "Bit!",
	auditLogRecord: "The audit log record please enter yes or no!",
	combinedCipher: "If need to enter a password to the yes or no combination!",
	automaticallyUnlockUser: "Whether to automatically unlock the user enter the yes or no!",
	automaticallyUnlockUserTime: "Allow automatic unlocking, automatic unlocking user time please enter a positive integer!",
	firstLogin: "For the first time login would need to modify the password please enter yes or no!",
	defaultInputPassword: "The system default input password can not be Chinese characters!",
	maximumSessions: "A user reaches the maximum number allowed to login session after enter yes or no!",
	numberSessions: "The number of sessions a user permission please enter an integer!"
};

Cap4jUIMessage.prototype.recycle = {
		deleteMessage:"Are you sure delete this record?",
		revertMessage:"Are you sure revert this record?"
};

Cap4jUIMessage.prototype.cap4jui = {
	errorPrompt:"Error prompt",
	noRight:"You have no right to access!",
	success:"Successful",
	wait:"Processing, please wait...",
	prompt:"Prompt",
	ok: "Ok",
    cancel: "Cancel",
    yes: "Yes",
    no: "No",
    alertTitle: "Alert",
    confirmTitle: "Confirm",
    prompTitle: "Prompt",
    prompMessage: "Please enter your message:"
};

Cap4jUIMessage.prototype.dsm = {
	booleanYes:"Yes",
	booleanNo:"No",
	readOnly:"Read only",
	modify:"Modify",
	control:"Entirety control",
	notSelectRow:"Please select a record",
	popedomManage:"Popedom group manage",
	confirmDelete:"Sure to delete the popedom group",
	deleteConfig:"Delete config",
	addStaff:"Add Staff",
	delStaff:"Delete Staff",
	maxLength:"Can not excess 255 byte",
	popedomExisted:"The popedom is existed,please input again",
	encryptExisted:"The encrypt level is existed,please input again",
	startDatePrompt:"The start date is must today",
	endDatePrompt:"The end date is must after today",
	choiceStaff:"Please choice the author!",
	hasStaff:"The DSM has staff,can not delete!",
	success:"success",
	isExistedYHBH:"has assigned DSM,Sure to cover with originally DSM!"
};	