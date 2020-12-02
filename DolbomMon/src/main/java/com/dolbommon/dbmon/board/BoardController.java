package com.dolbommon.dbmon.board;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

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
	
	//게시판 리스트로 이동ok
	@RequestMapping("/freeBoard")
	public ModelAndView freeBoard(FreeBoardVO vo, HttpServletRequest req) {
		
		
		String nowPageTxt = req.getParameter("nowPage");
		
		if(nowPageTxt!=null) {
			vo.setNowPage(Integer.parseInt(nowPageTxt));
		}
		
		String sWord = req.getParameter("searchWord");
		if(!(sWord == null || sWord.equals(""))) {	//검색어가 있을 때
			vo.setSearchKey(req.getParameter("searchKey"));
			vo.setSearchWord(sWord);
		}
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		
		int totalRecord = dao.getTotalRecord(vo);	//총 게시물 수
		vo.setTotalRecord(dao.getTotalRecord(vo));
		
		List<FreeBoardVO> list = dao.freeBoardList(vo);
		
		Calendar now = Calendar.getInstance();
		SimpleDateFormat fomat = new SimpleDateFormat("yy-MM-dd");
		String dateStr = fomat.format(now.getTime());
		for(int i=0; i<list.size(); i++) {
			FreeBoardVO dateVo = list.get(i);
			
			if(dateStr.equals(dateVo.getWritedate().substring(2, 10))) {
				dateVo.setWritedate((String)dateVo.getWritedate().subSequence(11, 16));	
			}else {
				
				dateVo.setWritedate((String)dateVo.getWritedate().subSequence(2, 10));
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pVo", vo);
		mav.addObject("totalRecord", totalRecord);
		mav.setViewName("freeBoard/freeBoard");
		
		return mav;
	}
	
	//이전글 선택
	@RequestMapping("/preContentView")
	public ModelAndView preContentView(int no, HttpServletRequest req, HttpServletResponse res) {
		
		FreeBoardVO vo = new FreeBoardVO();
		vo.setNo(Integer.parseInt(req.getParameter("no")));
		
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		FreeBoardVO preVo = dao.preRecordSelect(vo.getNo());
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", preVo.getPreNo());
		mav.setViewName("redirect:freeBoardView");
		
		return mav;
	}
	
	//다음글 선택
	@RequestMapping("/nextContentView")
	public ModelAndView nextContentView(int no, HttpServletRequest req, HttpServletResponse res) {
		
		FreeBoardVO vo = new FreeBoardVO();
		vo.setNo(Integer.parseInt(req.getParameter("no")));
		
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		FreeBoardVO nextVo = dao.nextRecordSelect(vo.getNo());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", nextVo.getNextNo());
		mav.setViewName("redirect:freeBoardView");
		
		return mav;
	}
	
	//게시판 글쓰기 폼으로 이동ok
	@RequestMapping("/freeBoardWrite")
	public String freeBoardWrite() {
		
		return "freeBoard/freeBoardWrite";
	}
	
	//이미지 업로드	
	@RequestMapping(value="/imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
      
		// 랜덤 문자 생성
        UUID uid = UUID.randomUUID();
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        try{
            
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            
            //이미지 경로 생성
            String path = "/DolbomMon/src/main/webapp/img";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
            
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/dbmon/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면
            
        // 업로드시 메시지 출력
          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
          printWriter.flush();
            
        }catch(IOException e){
            e.printStackTrace();
        } finally {
        
        try {
        	if(out != null) { out.close(); }
        	if(printWriter != null) {
        		printWriter.close();
        	}
        }catch(IOException e){
        	e.printStackTrace();
        	}
        }
        return;
	}
	
	@RequestMapping("/ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid, 
    					 @RequestParam(value="fileName") String fileName, HttpServletRequest request, HttpServletResponse response) 
    					 throws ServletException, IOException{
        //서버에 저장된 이미지 경로
        String path = "/DolbomMon/src/main/webapp/img";
    
        String sDirPath = path + uid + "_" + fileName;
    
        File imgFile = new File(sDirPath);
        
        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;
            
            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;
            
            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();
                
                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }
                
                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();
                
            }catch(IOException e){
            	
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
	
	//게시판 글쓰기ok
	@RequestMapping(value="/freeBoardWriteOk", method=RequestMethod.POST)
	public ModelAndView freeBoardWriteOk(FreeBoardVO vo, HttpServletRequest req, HttpSession ses) {
	
		
		//파일을 저장할 위치
		String path = ses.getServletContext().getRealPath("/upload");
		//파일 업로드를 하기 위해 req에서 MultipartHttpServletRequest를 생성한다.
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		//mr에서 MultipartFile 객체를 얻어온다.	--> List
		List<MultipartFile> files = mr.getFiles("filename");
				
		//파일명을 저장할 변수
		String fileNames[] = new String[files.size()];	//2개
		int idx = 0;
				
		if(files!=null) {	//첨부파일이 있을때
					
			for(int i=0; i<files.size(); i++) {		
				MultipartFile mf = files.get(i);
				String fName = mf.getOriginalFilename();	//폼의 파일명 얻어오기
						
				if(fName!=null && !fName.equals("")) {				
					//원래의 파일명 중 확장자를 제외한 앞부분
					String oriFileName = fName.substring(0, fName.lastIndexOf("."));
					//확장자명 구하기
					String oriExt = fName.substring(fName.lastIndexOf(".")+1);
					//이름 바꾸기
					File f = new File(path, fName);
							
					if(f.exists()) {	//원래의 파일 객체가 서버에 있으면 실행
								
						for(int renameNum=1; ; renameNum++) {	//무한루프
							String renameFile = oriFileName + renameNum + "." + oriExt;	//변경된 파일명
							f = new File(path, renameFile);
									
							if(!f.exists()) {	//파일이 있으면 true, 없으면 false
								//같은 이름의 파일이 없을때 파일명 적용
								fName = renameFile;
								break;				
							}			
						}	//for
					}
					try {
						mf.transferTo(f);	
					}catch(Exception e) {
						e.printStackTrace();	
					}
					fileNames[idx++] = fName;
				}	//if
			}	//for
		}
		
		vo.setFilename1(fileNames[0]);
		vo.setFilename2(fileNames[1]);
		
		vo.setIp(req.getRemoteAddr());	//ip 구하기
		vo.setUserid((String)ses.getAttribute("userid"));	
		
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		int result = dao.freeBoardInsert(vo);
		
		if(result>0) {	//레코드 추가 성공
			mav.setViewName("redirect:freeBoard");
		}else {	//레코드 추가 실패
			//파일 삭제
			for(int j=0; j<fileNames.length; j++) {
				if(fileNames[j]!=null) {
					File ff = new File(path, fileNames[j]);
					ff.delete();
				}
			}
			mav.setViewName("freeBoard/result");	
		}
		return mav;
	}
	
	//게시글 보기ok
	@RequestMapping("/freeBoardView")
	public ModelAndView freeBoardView(int no, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		FreeBoardVO vo = new FreeBoardVO();
		
		
		vo.setNo(Integer.parseInt(req.getParameter("no")));
		
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		dao.hitCount(vo.getNo());
		
		FreeBoardVO preVo = dao.preRecordSelect(vo.getNo());	//현재 글번호 넣어서 이전글 선택
		FreeBoardVO nextVo = dao.nextRecordSelect(vo.getNo());	//현재 글번호 넣어서 다음글 선택
		
		FreeBoardVO resultVo = dao.freeBoardSelect(vo.getNo());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", resultVo);
		mav.addObject("preVo", preVo);
		mav.addObject("nextVo", nextVo);
		mav.setViewName("freeBoard/freeBoardView");
	
		return mav;
	}
	
	//자유게시판 글 수정폼으로 이동ok
	@RequestMapping("/freeBoardEdit")
	public ModelAndView freeBoardEdit(int no) {
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		
		FreeBoardVO vo = dao.freeBoardSelect(no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("freeBoard/freeBoardEdit");
		
		return mav;
	}
	//글 수정
	@RequestMapping(value="/freeBoardEditOk", method=RequestMethod.POST)
	public ModelAndView freeBoardEditOk(HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {

		String path = ses.getServletContext().getRealPath("/upload");
		int maxSize = 1024*1024*1024;
		DefaultFileRenamePolicy pol = new DefaultFileRenamePolicy();
		
		MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", pol);
		
		FreeBoardVO vo = new FreeBoardVO();
		
		vo.setNo(Integer.parseInt(mr.getParameter("no")));		
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		
		//삭제할 파일명
		vo.setDelfile(mr.getParameterValues("delfile"));
		
		//새로 업로드한 파일
		int idx = 0;
		String fileName[] = new String[2];
		Enumeration fileList = mr.getFileNames();
		
		while(fileList.hasMoreElements()) {
			String old = (String)fileList.nextElement();
			String newFile = mr.getFilesystemName(old);
			
			if(newFile!=null) {
				fileName[idx++] = newFile;
				
			}	
		}	
		String[] del = vo.getDelfile();
		DataDAO dao = new DataDAO();
		
		if(idx<2) {	//이전에 업로드한 파일을 다 지울 때
			//데이터 베이스에 있는 원래 파일명 얻어오기
			String dbFile[] = dao.getFileName(vo.getNo());	
			if(del!=null) {	//삭제할 파일이 있는 경우
				for(String dbFilename : dbFile) {
					int chk = 0;
					for(String delFile : del) {
						if(dbFilename!=null && dbFilename.equals(delFile)) {
							chk++;
						}
					}
					if(chk==0) {
						fileName[idx++] = dbFilename;
					}
				}
			}else {	//삭제할 파일이 없는 경우
				for(String dbFilename : dbFile) {
					if(dbFilename!=null) {
						fileName[idx++] = dbFilename;
					}
				}
			}
		}
		
		vo.setFilename(fileName);
		int cnt = dao.dataUpdate(vo);
		if(cnt>0 && del!=null) {
			//이전 파일 삭제
			for(String d : del) {
				File f = new File(path, d);
				f.delete();
			}
		}
		req.setAttribute("cnt", cnt);
		req.setAttribute("no", vo.getNo());
		return "/data/dataEditOk.jsp";
	}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//자유게시판 글 수정ok
	@RequestMapping(value="/freeBoardEditOk", method=RequestMethod.POST)
	public ModelAndView freeBoardEditOk(FreeBoardVO vo, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("userid"));
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		int result = dao.freeBoardEditOk(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.addObject("no", vo.getNo());
			mav.setViewName("redirect:freeBoard");
		}else {
			mav.setViewName("board/result");
		}
		return mav;
	}
	
	//자유게시판 글 삭제ok
	@RequestMapping("/freeBoardDel")
	public ModelAndView freeBoardDel(int no, HttpSession ses) {
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		int result = dao.freeBoardDel(no, (String)ses.getAttribute("userid"));
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:freeBoard");
		}else {
			mav.setViewName("freeBoard/result");
		}
		return mav;
	}
	
	//자유게시판 답글 쓰기 폼으로 이동
	@RequestMapping("/freeBoardReplyForm")
	public String replyWrite(int no, Model model) {
		model.addAttribute("no", no);
			
		return "freeBoard/freeBoardReplyForm";
	}
	
	//자유게시판 답글 쓰기
	@RequestMapping(value="/freeBoardReplyOk", method=RequestMethod.POST)
	public ModelAndView freeBoardReplyOk(FreeBoardVO vo, HttpServletRequest req, HttpSession ses) {
		
		vo.setIp(req.getRemoteAddr());	//ip 구하기	
		vo.setUserid((String)ses.getAttribute("userid"));
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
				
		TransactionStatus status = transactionManager.getTransaction(def);
		
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		
		//원글의 ref, step, lvl 선택하기
		FreeBoardVO optVo = dao.optionSelect(vo.getNo());
		
		try {
			dao.levelUpdate(optVo);
			
			//답글 쓰기
			vo.setRef(optVo.getRef());
			vo.setStep(optVo.getStep()+1);
			vo.setLvl(optVo.getLvl()+1);
			
			dao.replyBoardInsert(vo);
			
			transactionManager.commit(status);
		}catch(Exception e) {
			transactionManager.rollback(status);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("redirect:freeBoard");
		return mav;
	}
	
	//공지사항 게시판으로 이동ok
	@RequestMapping("/noticeBoard")
	public String noticeBoard() {
		
		return "freeBoard/noticeBoard";
	}
	
	//공지사항 글쓰기 폼으로 이동ok
	@RequestMapping("/noticeBoardWrite")
	public String noticeBoardWrite() {
		
		return "freeBoard/noticeBoardWrite";
	}
	
	//공지사항 게시글 보기
	@RequestMapping(value="/noticeBoardView", method=RequestMethod.POST)
	public ModelAndView noticeBoardView() {
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeBoard/noticeBoardView");
		
		return mav;
	}
	
	//신고게시판으로 이동
	@RequestMapping("/bulletinBoard")
	public String bulletinBoard() {
		
		return "freeBoard/bulletinBoard";
	}
	
	//신고게시글 보기
	@RequestMapping("/bulletinBoardView")
	public String bulletinBoardView() {
		
		return "freeBoard/bulletinBoardView";
	}
	
	//인증게시판으로 이동
	@RequestMapping("/confirmBoard")
	public String confirmBoard() {
		
		return "freeBoard/confirmBoard";
	}
	
	//인증글 보기
	@RequestMapping("/confirmBoardView")
	public String confirmBoardView() {
		
		return "freeBoard/confirmBoardView";
	}
}
