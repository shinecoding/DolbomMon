package com.dolbommon.dbmon.search;

import org.springframework.web.multipart.MultipartFile;

public class TeacherVO {
	private String userid;
	private String pic;
	private String care_type;
	private String[] type_list;
	private String child_age;
	private String[] age_list;
	private String activity_type;
	private String[] activity_list;
	private int desired_wage;
	private String intro;
	private String area1;
	private String area2;
	private String area3;
	private String cctv;
	private String certi_check;
	private MultipartFile filename;
	private int hit;
	private String last_edit;
	private int headcount;
	private String discussion;
	private int no;
	private String userpwd;
	private String username;
	private String gender;
	private String birth;
	private String tel1;
	//private String tel2;
	private String email;
	private String email1;
	private String email2;
	private String addr;
	private String addrdetail;
	private String zipcode;
	private String regdate;
	private String memo;
	private String lat;
	private String lng;
	private String identi_status;
	private String school_status;
	private String license_status;
	private String crime_status;
	private String cardid;
	private int like_check;
	private String active;
	
	
	
	
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getCardid() {
		return cardid;
	}
	public void setCardid(String cardid) {
		this.cardid = cardid;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getEmail() {
		email = email1 + "@" + email2;
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String address) {
		this.addr = address;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public MultipartFile getFilename() {
		return filename;
	}
	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getCare_type() {
		return care_type;
	}
	public void setCare_type(String care_type) {
		this.care_type = care_type;
	}
	public String[] getType_list() {
		return type_list;
	}
	public void setType_list(String[] type_list) {
		this.type_list = type_list;
	}
	public String getChild_age() {
		return child_age;
	}
	public void setChild_age(String child_age) {
		this.child_age = child_age;
	}
	public String[] getAge_list() {
		return age_list;
	}
	public void setAge_list(String[] age_list) {
		this.age_list = age_list;
	}
	public String getActivity_type() {
		return activity_type;
	}
	public void setActivity_type(String activity_type) {
		this.activity_type = activity_type;
	}
	public String[] getActivity_list() {
		return activity_list;
	}
	public void setActivity_list(String[] activity_list) {
		this.activity_list = activity_list;
	}
	public int getDesired_wage() {
		return desired_wage;
	}
	public void setDesired_wage(int desired_wage) {
		this.desired_wage = desired_wage;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getArea1() {
		return area1;
	}
	public void setArea1(String area1) {
		this.area1 = area1;
	}
	public String getArea2() {
		return area2;
	}
	public void setArea2(String area2) {
		this.area2 = area2;
	}
	public String getArea3() {
		return area3;
	}
	public void setArea3(String area3) {
		this.area3 = area3;
	}
	public String getCctv() {
		return cctv;
	}
	public void setCctv(String cctv) {
		this.cctv = cctv;
	}
	public String getCerti_check() {
		return certi_check;
	}
	public void setCerti_check(String certi_check) {
		this.certi_check = certi_check;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getLast_edit() {
		return last_edit;
	}
	public void setLast_edit(String last_edit) {
		this.last_edit = last_edit;
	}
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}
	public String getDiscussion() {
		return discussion;
	}
	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}
	public String getIdenti_status() {
		return identi_status;
	}
	public void setIdenti_status(String identi_status) {
		this.identi_status = identi_status;
	}
	public String getSchool_status() {
		return school_status;
	}
	public void setSchool_status(String school_status) {
		this.school_status = school_status;
	}
	public String getLicense_status() {
		return license_status;
	}
	public void setLicense_status(String license_status) {
		this.license_status = license_status;
	}
	public String getCrime_status() {
		return crime_status;
	}
	public void setCrime_status(String crime_status) {
		this.crime_status = crime_status;
	}
	
	
	
	
}
