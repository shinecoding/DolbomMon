package com.dolbommon.dbmon.certification;

public interface CertificationDaoImp {
	
	public int findId(CertificationVO vo);
	public int insertIdenti(CertificationVO vo);
	public int updateIdenti(CertificationVO vo);
	
	public int insertSchool(CertificationVO vo);
	public int updateSchool(CertificationVO vo);
	
	public int insertLicense(CertificationVO vo);
	public int updateLicense(CertificationVO vo);
	
	public int insertCrime(CertificationVO vo);
	public int updateCrime(CertificationVO vo);
	
	public int insertPrivacy(CertificationVO vo);
	public int updatePrivacy(CertificationVO vo);
	
	public CertificationVO selectCert(String userid);
	
}
