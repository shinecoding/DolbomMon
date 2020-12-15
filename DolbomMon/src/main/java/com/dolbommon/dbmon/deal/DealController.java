package com.dolbommon.dbmon.deal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.deal.MemberVO;
import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;
import com.dolbommon.dbmon.parent.ApplyToParentInfoVO;
import com.dolbommon.dbmon.parent.ChildrenVO;
import com.dolbommon.dbmon.parent.ParentDaoImp;
import com.dolbommon.dbmon.search.RecruitBoardDaoImp;
import com.dolbommon.dbmon.search.RecruitBoardVO;

@Controller
public class DealController {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	DataSourceTransactionManager transactionManager;
	
	//계약서 오픈 선생님이 신청한것
	@RequestMapping("/contractOpen")
	public ModelAndView editBoard(int no, HttpServletRequest req) {
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		String teacherId = (String)req.getParameter("userid");
		RecruitBoardVO vo = dao.recruitBoardSelect(no);
		ModelAndView mav = new ModelAndView();
		String time_type = vo.getTime_type();
		
		if(time_type.equals("R")) {
			RegularDateVO rdVO = dao.recruitRegularDateSelect(no);
			mav.addObject("rdVO", rdVO);
		}else {
			SpecificDateVO sdVO = dao.recruitSpecificDateSelect(no);
			mav.addObject("sdVO", sdVO);
		}
		
		ChildrenVO cVO = dao.recruitChildSelect(no);
		String child_birth = cVO.getChild_birth();
		String child_birthAdd[] = child_birth.split(",");
		int child_cnt = child_birthAdd.length;
		cVO.setChild_cnt(child_cnt);
		
		mav.addObject("no", no);
		mav.addObject("cVO", cVO);
		mav.addObject("vo" ,vo);
		mav.addObject("teacherId", teacherId);
		mav.setViewName("deal/contractForm");
		
		DealDaoImp dao2 = sqlSession.getMapper(DealDaoImp.class);
		int result2 = dao2.searchContract(no);
		if(result2>=1) {
			mav.addObject("result2", result2);
			mav.setViewName("deal/writeResult");
		}
		
		return mav;
	}
	
	//계약서 오픈 부모님이 신청한것
	@RequestMapping("/contractOpenT")
	public ModelAndView contractOpenT(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String teacherId = (String)req.getParameter("userid");
		mav.addObject("teacherId", teacherId);
		mav.setViewName("deal/contractFormT");
		return mav;
	}
	
	
	//계약서 등록 선생님이 부모님에게
	@RequestMapping(value="/contractWrite", method = RequestMethod.POST)
	public ModelAndView dbmSearchWriteFormOk(HttpServletRequest req, HttpSession ses, RecruitBoardVO rbVO, ChildrenVO cVO, SpecificDateVO sdVO, RegularDateVO rdVO) {
		String teacherId = (String)req.getParameter("teacherId");
		rbVO.setTeacherid(teacherId);
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		rbVO.setUserid((String)ses.getAttribute("userid"));
		
		String consultation = (String)rbVO.getConsultation();
		if(consultation == null) {
			rbVO.setConsultation("N");
		}
		String time_consultation = (String)rbVO.getTime_consultation();
		if(time_consultation == null) {
			rbVO.setTime_consultation("N");
		}
		System.out.println("원글번호 확인"+rbVO.getOrigin_no());
		String childb = cVO.getChild_birth();
		String childbArr[] = childb.split(",");
		
		String child_birthStr = "";
		for(int i=0;i<childbArr.length;i++) {
			if(!childbArr[i].equals("")) {
				child_birthStr += childbArr[i]+",";
			}
		}
		String child_birth = child_birthStr.substring(0, child_birthStr.length()-1);
		System.out.println("자녀 생년월일 => " + child_birth);
		cVO.setChild_birth(child_birth);
		
		
		ParentDaoImp dao = sqlSession.getMapper(ParentDaoImp.class);
		DealDaoImp dao2 = sqlSession.getMapper(DealDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		String time_type = (String)rbVO.getTime_type();
		System.out.println("type_type => " + time_type);
		int result = 0;
		try {
			System.out.println("in");
			dao2.insertContract(rbVO);
			System.out.println("parent_list 데이터 등록 됨");
			dao.insertDsChildInfo(rbVO, cVO);
			System.out.println("자녀 정보 등록됨");
			if(time_type.equals("S")) {
				System.out.println("S");
				dao.insertNullRegularDate();
				result = dao.insertDsSpecificDate(rbVO, sdVO);
			}else {
				System.out.println("R");
				dao.insertNullSpecificDate();
				result = dao.insertDsRegularDate(rbVO, rdVO);
			}
			transactionManager.commit(status);
		}catch(Exception e) {
			System.out.println(e.getMessage());
			transactionManager.rollback(status);
		}
		
		//dao2.
		///rbVO.getUserid()
		//teacherId
		//
		
		mav.addObject("result", result);
		mav.setViewName("/deal/writeResult");
		
		return mav;
	
	}
	
	//계약서 등록 부모님이 선생님에게
	@RequestMapping(value="/contractWriteT", method = RequestMethod.POST)
	public ModelAndView contractWriteT(HttpServletRequest req, HttpSession ses, RecruitBoardVO rbVO, ChildrenVO cVO, SpecificDateVO sdVO, RegularDateVO rdVO) {
		String teacherId = (String)req.getParameter("teacherId");
		System.out.println("아이디테스트"+teacherId);
		rbVO.setTeacherid(teacherId);
		
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		rbVO.setUserid((String)ses.getAttribute("userid"));
		
		String consultation = (String)rbVO.getConsultation();
		if(consultation == null) {
			rbVO.setConsultation("N");
		}
		String time_consultation = (String)rbVO.getTime_consultation();
		if(time_consultation == null) {
			rbVO.setTime_consultation("N");
		}
		
		String childb = cVO.getChild_birth();
		String childbArr[] = childb.split(",");
		
		String child_birthStr = "";
		for(int i=0;i<childbArr.length;i++) {
			if(!childbArr[i].equals("")) {
				child_birthStr += childbArr[i]+",";
			}
		}
		String child_birth = child_birthStr.substring(0, child_birthStr.length()-1);
		System.out.println("자녀 생년월일 => " + child_birth);
		cVO.setChild_birth(child_birth);
		
		
		ParentDaoImp dao = sqlSession.getMapper(ParentDaoImp.class);
		DealDaoImp dao2 = sqlSession.getMapper(DealDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		String time_type = (String)rbVO.getTime_type();
		System.out.println("type_type => " + time_type);
		int result = 0;
		try {
			System.out.println("in");
			dao2.insertContractT(rbVO);
			System.out.println("parent_list 데이터 등록 됨");
			dao.insertDsChildInfo(rbVO, cVO);
			System.out.println("자녀 정보 등록됨");
			if(time_type.equals("S")) {
				System.out.println("S");
				dao.insertNullRegularDate();
				result = dao.insertDsSpecificDate(rbVO, sdVO);
			}else {
				System.out.println("R");
				dao.insertNullSpecificDate();
				result = dao.insertDsRegularDate(rbVO, rdVO);
			}
			transactionManager.commit(status);
		}catch(Exception e) {
			System.out.println(e.getMessage());
			transactionManager.rollback(status);
		}
		
		mav.addObject("result", result);
		mav.setViewName("/deal/writeResult");
		
		return mav;
	
	}
	
	
	
	
	//선생님이 계약서 보기
	@RequestMapping("/contractView")
	public ModelAndView parentView(int origin_no, HttpSession ses, HttpServletRequest req) {
		//String origin_no = (String)req.getParameter("origin_no");
		String teacherid = (String)req.getParameter("teacherid");
		String payment = (String)req.getParameter("payment");
		if(teacherid==null) {
			teacherid = (String)ses.getAttribute("userid");
		}
		DealDaoImp dao = sqlSession.getMapper(DealDaoImp.class);
		ModelAndView mav = new ModelAndView();
		String check="";
		try {
		check = dao.selectOrigin(origin_no, teacherid);
		}catch(Exception e) {
			System.out.println("에러메시지"+e.getMessage());
		}
		if(check==null || check.equals("")) {
			mav.addObject("result5", 1);
			mav.setViewName("deal/writeResult");
			return mav;
		}
		int no = Integer.parseInt(check);
		List<ApplyToParentInfoVO> tlist = dao.applyDbmSelect2(no);
		RecruitBoardVO rbVO = dao.recruitBoardSelect2(no);
		ChildrenVO cVO = dao.recruitChildSelect2(no);
		
		String userid = (String)ses.getAttribute("userid");
		com.dolbommon.dbmon.deal.MemberVO mvo = dao.selectMemberDeal(userid);
		
		String timeType = rbVO.getTime_type();
		if(timeType.equals("S")) {
			SpecificDateVO sdVO = dao.recruitSpecificDateSelect2(no);
			mav.addObject("sdVO", sdVO);
		}else if(timeType.equals("R")){
			RegularDateVO rdVO = dao.recruitRegularDateSelect2(no);
			mav.addObject("rdVO", rdVO);
		}
		
		
		
		mav.addObject("tlist", tlist);
		mav.addObject("payment", payment);
		mav.addObject("userid", userid);
		mav.addObject("cVO", cVO);
		mav.addObject("teacherid", teacherid);
		mav.addObject("rbVO", rbVO);
		mav.addObject("mvo", mvo);
		mav.setViewName("/deal/contractView");
		
		return mav;
	}
	
	@RequestMapping("/contractOk")
	public ModelAndView contractOk(String agree, int no) {
		ModelAndView mav = new ModelAndView();
		DealDaoImp dao = sqlSession.getMapper(DealDaoImp.class);
		int result3 = dao.setAgree(agree, no);
		if(agree.equals("Y")) {
			mav.addObject("result3", result3);
			mav.setViewName("deal/writeResult");
		}else {
			mav.addObject("result4", result3);
			mav.setViewName("deal/writeResult");
		}
		
		return mav; 
	}
	
	
	@RequestMapping("/paymentSuccess")
	public ModelAndView paymentSuccess(HttpSession ses, HttpServletRequest req) {
		String parent_id = (String)ses.getAttribute("userid");
		String pay_id = req.getParameter("pay_id");
		String merchant_id = req.getParameter("merchant_id");
		String pay_money = req.getParameter("pay_money");
		String apply_num = req.getParameter("apply_num");
		String teacherid = req.getParameter("teacherid");
		String pay_no = req.getParameter("pay_no");
		
		PaymentVO pvo = new PaymentVO();
		pvo.setParent_id(parent_id);
		pvo.setPay_id(pay_id);
		pvo.setMerchant_id(merchant_id);
		pvo.setPay_money(pay_money);
		pvo.setApply_num(apply_num);
		pvo.setTeacher_id(teacherid);
		pvo.setPay_no(pay_no);
		DealDaoImp dao = sqlSession.getMapper(DealDaoImp.class);
		
		com.dolbommon.dbmon.deal.MemberVO mvo = dao.selectMemberDeal(parent_id);
		pvo.setParent_name(mvo.getUsername());
		pvo.setTel(mvo.getTel1());
		pvo.setEmail(mvo.getEmail());
		System.out.println("어플라이 넘="+pvo.getApply_num());
		System.out.println("이멜="+pvo.getEmail());
		
		dao.updatePayment(pay_no);
		dao.insertPayment(pvo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mss", "결제 성공하였습니다.");
		mav.setViewName("deal/contractResult");
			
		
		return mav;
	}
	
	
}
