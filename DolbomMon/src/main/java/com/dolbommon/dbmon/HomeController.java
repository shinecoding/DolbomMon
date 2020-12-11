package com.dolbommon.dbmon;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dolbommon.dbmon.QnA.QnAService;


@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	  @Inject QnAService service; SqlSession sqlSession;
	 
	 public SqlSession getSqlSession() { return sqlSession; }
	 
	  @Autowired public void setSqlSession(SqlSession sqlSession) { this.sqlSession
	  = sqlSession; }
	 
	
	  @Autowired DataSourceTransactionManager transactionManager;
	 
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception{
		
		
		
		logger.info("home");
		
		model.addAttribute("qna_list",service.QnaList());
		
		
		return "home";
	}
	/*
	 * //공지사항 게시글 보기
	 * 
	 * @RequestMapping("/qnaBoardView") public ModelAndView qnaBoardView(int seq,
	 * HttpServletRequest req, HttpServletResponse res) throws Exception {
	 * 
	 * QnAVO vo = new QnAVO();
	 * 
	 * vo.setSeq(Integer.parseInt(req.getParameter("seq")));
	 * 
	 * 
	 * QnADaoIml dao = sqlSession.getMapper(QnADaoIml.class);
	 * 
	 * 
	 * QnAVO resultVo = dao.qnaBoardSelect(vo.getSeq());
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.addObject("vo", resultVo);
	 * 
	 * mav.setViewName("/qnaBoardView");
	 * 
	 * return mav; }
	 */
}

