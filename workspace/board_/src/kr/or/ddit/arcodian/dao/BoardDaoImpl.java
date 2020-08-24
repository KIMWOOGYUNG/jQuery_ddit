package kr.or.ddit.arcodian.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.ddit.arcodian.vo.BoardVO;

public class BoardDaoImpl implements IBoardDao{
	Connection  con ;
	PreparedStatement  stmt;
	ResultSet  rs;
	
	private static IBoardDao  dao = new BoardDaoImpl();
	
	public static IBoardDao getInstance(){
		return dao;
		
	}
	
	private BoardDaoImpl() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"KWG",
					"java");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<BoardVO> selectAll() throws SQLException {
		
		List<BoardVO> list = new ArrayList<>();
		
		String sql = "select * from jdbc_board order by board_no desc";
		
		stmt = con.prepareStatement(sql);
		
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			BoardVO vo = new BoardVO();
			vo.setBoard_no(rs.getInt("board_no"));
			vo.setBoard_title(rs.getString("board_title"));
			vo.setBoard_writer(rs.getString("board_writer"));
			vo.setBoard_content(rs.getString("board_content"));
			vo.setBoard_date(rs.getString("board_date"));
			vo.setBoard_cnt(rs.getInt("board_cnt"));
			list.add(vo);
		}
		
		rs.close();
		stmt.close();
		
		return list;
	}

	@Override
	public List<BoardVO> selectAll(Map<String, Integer> map) throws SQLException {
		List<BoardVO>  list = new ArrayList<BoardVO>();
 		
		String sql = "select A.* from ( " 
                 + "     select rownum as rnum, B.*  from ( "
                 + "          select * from jdbc_board order by board_no desc) B "
                 + "     where rownum <= ?) A "
                 + "  where A.rnum >= ? ";
		
		stmt=con.prepareStatement(sql);
		stmt.setInt(1, map.get("end"));
		stmt.setInt(2, map.get("start"));
		
		rs  = stmt.executeQuery();
		
		while(rs.next()){
			BoardVO  vo = new BoardVO();
			vo.setBoard_no(rs.getInt("board_no"));
			vo.setBoard_title(rs.getString("board_title"));
			vo.setBoard_writer(rs.getString("board_writer"));
			vo.setBoard_content(rs.getString("board_content"));
			vo.setBoard_date(rs.getString("board_date"));
			vo.setBoard_cnt(rs.getInt("board_cnt"));
			list.add(vo);
		}
		rs.close();
		stmt.close();
		
		return list;
		
	}

	@Override
	public int getListCount() throws SQLException {
		int cnt = 0;
		
		String sql = "select count(*) board_cnt from jdbc_board";
		
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("board_cnt");
		}
		rs.close();
		stmt.close();
		
		return cnt;
	}

	@Override
	public BoardVO selectView(int board_no) throws SQLException {
		BoardVO vo = null;
		String sql = "select * from jdbc_board where board_no = ?";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, board_no);
		
		rs = stmt.executeQuery();
		if(rs.next()){
			vo = new BoardVO();
			vo.setBoard_no(rs.getInt("board_no"));
			vo.setBoard_title(rs.getString("board_title"));
			vo.setBoard_writer(rs.getString("board_writer"));
			vo.setBoard_content(rs.getString("board_content"));
		}
		rs.close();
		stmt.close();
		return vo;
	}

	@Override
	public int updateBoard(BoardVO vo) throws SQLException {
		int a=0;
		String sql = "update jdbc_board set board_title=?," + 
				" board_writer =? , board_content=?, board_date=sysdate" + 
				" where board_no=?";
		/*
		 * System.out.println(vo.getBoard_title());
		 * System.out.println(vo.getBoard_writer());
		 * System.out.println(vo.getBoard_content());
		 * System.out.println(vo.getBoard_no());
		 */
		stmt = con.prepareStatement(sql);
		stmt.setString(1, vo.getBoard_title());;
		stmt.setString(2, vo.getBoard_writer());
		stmt.setString(3, vo.getBoard_content());
		stmt.setInt(4, vo.getBoard_no());
		
		a = stmt.executeUpdate();
		stmt.close();
		
		return a;
	}

	@Override
	public int insertBoard(BoardVO vo) throws SQLException {
		int result =0;
		System.out.println(vo.getBoard_title());
		System.out.println(vo.getBoard_writer());
		System.out.println(vo.getBoard_content().replace("<", "&lt;").replace(">", "&gt;"));

		String sql = "insert into jdbc_board" + 
				"(board_no, board_title, board_writer, board_content, board_date, board_cnt)" + 
				"values (seq_board.nextVal, ?,?,?, sysdate, 0)";

		stmt = con.prepareStatement(sql);
		stmt.setString(1, vo.getBoard_title());
		stmt.setString(2, vo.getBoard_writer());
		stmt.setString(3, vo.getBoard_content().replace("<", "&lt;").replace(">", "&gt;"));
		
		result =stmt.executeUpdate();  
		stmt.close();
		return result;
		
	}

	@Override
	public int deleteBoard(Map<String, Object> map) throws SQLException {
		int a= 0;
		
		String sql = "delete jdbc_board where board_no=?";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, (int)map.get("board_no"));
		
		a = stmt.executeUpdate();
		
		stmt.close();
		
		return a;	
	}
}
