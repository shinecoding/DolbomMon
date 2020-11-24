package com.dolbommon.dbmon.certification;

public interface CertificationDaoImp {
	
	public int insertIdenti(CertificationVO vo);
	public int insertSchool(CertificationVO vo);
	public int insertLicense(CertificationVO vo);
	
	public int insertCrime(CertificationVO vo);
	
	public CertificationVO selectCert(String userid);
}
