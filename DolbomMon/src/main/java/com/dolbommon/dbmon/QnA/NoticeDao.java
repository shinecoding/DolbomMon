package com.dolbommon.dbmon.QnA;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class NoticeDao {
	private JdbcTemplate jdbcTemplate;

	@Autowired

	public void dataSource(DataSource dataSource) {

	this.jdbcTemplate = new JdbcTemplate(dataSource);

	}//dataSource()

	 

	public List<QnAVO> list() {

	List<QnAVO> list = null;

	// Date 객체를 사용해서 처리하고 표시할때는 jsp에서 fmt - jstl 객체를 사용 한다.

	String sql = "select no,subject,writedate,content, userid,hit "

	+ " from QnAVO order by no asc,no desc";

	// view에서는 queryForObject를 사용 하였는데 list에서는 query를 사용해야 한다.

	list = jdbcTemplate.query(sql, new RowMapper<QnAVO>() {

	@Override

	public QnAVO mapRow(ResultSet rs, int rowNum) throws SQLException {

	QnAVO notice = new QnAVO();

	notice.setNo(rs.getInt("no"));

	notice.setSubject(rs.getString("subject"));

	// Date 타입이므로 사용해서 .getTimestamp()를 사용 해서 꺼내 온다.

	notice.setWritedate(rs.getTimestamp("writedate"));

	notice.setContent(rs.getString("content"));

	notice.setUserid(rs.getString("userid"));
	
	notice.setHit(rs.getInt("hit"));

	return notice;

	}// mapRow()

	});//query

	return list;

	}//list()

	 

	 

	 

	}//class