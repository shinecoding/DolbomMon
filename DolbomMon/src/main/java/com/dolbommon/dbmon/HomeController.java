package com.dolbommon.dbmon;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.QnA.QnAVO;
import com.dolbommon.dbmon.QnA.QnaDaoImp;


@Controller
public class HomeController {
	
	  SqlSession sqlSession;
	 
	 public SqlSession getSqlSession() {
		 return sqlSession; 
		 }
	 
	  @Autowired 
	  public void setSqlSession(SqlSession sqlSession) { 
		  this.sqlSession = sqlSession; 
		  }
	  @Autowired 
	  DataSourceTransactionManager transactionManager;
	 
	
	//자주묻는질문 게시판 리스트
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(QnAVO qna_vo, HttpServletRequest req) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		QnaDaoImp qDao = sqlSession.getMapper(QnaDaoImp.class);
		
		
		List<QnAVO> qna_list = qDao.QnaList(qna_vo);
	
		mav.addObject("qna_list", qna_list);
		mav.addObject("QnAVO", qna_vo);
		
		mav.setViewName("/home");
		return mav;
	}

	//게시글 보기
		@RequestMapping("/qnaBoardView")
		public ModelAndView qnaBoardView(int seq, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			
			QnAVO qna_vo = new QnAVO();
			
			qna_vo.setSeq(Integer.parseInt(req.getParameter("seq")));
			
			QnaDaoImp dao = sqlSession.getMapper(QnaDaoImp.class);

			QnAVO resultVo = dao.qnaBoardView(qna_vo.getSeq());
			System.out.println("111111"+resultVo.getContent());
			System.out.println("222222"+resultVo.getSeq());
			ModelAndView mav = new ModelAndView();
			mav.addObject("qna_vo", resultVo);
			mav.setViewName("QnA/qnaBoardView");
		
			return mav;
		}
}

