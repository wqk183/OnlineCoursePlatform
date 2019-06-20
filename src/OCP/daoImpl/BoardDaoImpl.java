package OCP.daoImpl;

import OCP.dao.BoardDao;
import OCP.util.DataBaseConnection;
import OCP.util.SplitPage;
import OCP.vo.board;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class BoardDaoImpl implements BoardDao {
    @Override
    public void add(board board) throws Exception {
        String sql = "insert into board(id,board_account,board_content,board_date,board_image) values(id,?,?,?,?)";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1, board.getBoard_account());
        pstmt.setString(2, board.getBoard_content());
        pstmt.setString(3, board.getBoard_date());
        pstmt.setString(4, board.getBoard_image());
        pstmt.executeUpdate();
        pstmt.close();
    }

    @Override
    public boolean updateBoardInfor(String board_account, String board_content, String board_date,String board_image) {
        boolean flag = false;
        String sql = "update board set board_content = '"+board_content+"',board_date = '"+board_date+"',board_image = '"+board_image+"' where board_account = '"+board_account+"'";
        PreparedStatement pstmt=null;
        DataBaseConnection dbc =null;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            int i = pstmt.executeUpdate();
            if(i>0)flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM board WHERE id=?" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1,id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<board> getSize() {
        List list =new ArrayList();
        String sql = "SELECT * FROM board" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                board board=new board();
                board.setId(rs.getInt("id"));
                board.setBoard_account(rs.getString("board_account"));
                board.setBoard_content(rs.getString("board_content"));
                board.setBoard_date(rs.getString("board_date"));
                board.setBoard_image(rs.getString("board_image"));
                list.add(board);
            }
        }catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally {
            dbc.close();
        }
        return list;
    }

    @Override
    public List<board> queryAll(SplitPage sp) {
        List<board> list=new ArrayList<>();
        String sql = "select * from board limit " + sp.getPageRows()* (sp.getCurrentPage()-1) +"," + sp.getPageRows();
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                board board=new board();
                board.setId(rs.getInt("id"));
                board.setBoard_account(rs.getString("board_account"));
                board.setBoard_content(rs.getString("board_content"));
                board.setBoard_date(rs.getString("board_date"));
                board.setBoard_image(rs.getString("board_image"));
                list.add(board);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int getRows(HashMap tm) throws Exception {
        List<board> list = new ArrayList<board>() ;
        if(tm .isEmpty()){
            list=getSize();
        }
        else{
            list=queryByLike(tm);
        }
        int num = list.size();
        return num;
    }

    @Override
    public List<board> queryByLike(HashMap cond) throws Exception {
        List<board> all = new ArrayList<board>() ;
        String str=null;
       /* if(cond.containsKey("id"))
            str="id LIKE "+"'"+cond.get("id")+"'";*/
        if(cond.containsKey("board_account"))
            str="board_account LIKE "+"'"+cond.get("board_account")+"'";
        String sql = "SELECT * FROM board WHERE " +str;
        Statement stmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try
        {
            stmt = dbc.getConnection().createStatement() ;
            ResultSet rs = stmt.executeQuery(sql) ;
            while(rs.next())
            {
                board board=new board();
                board.setId(rs.getInt("id"));
                board.setBoard_account(rs.getString("board_account"));
                board.setBoard_content(rs.getString("board_content"));
                board.setBoard_date(rs.getString("board_date"));
                board.setBoard_image(rs.getString("board_image"));
                all.add(board);
            }
            rs.close() ;
            stmt.close() ;
        }
        catch (Exception e)
        {
            e.printStackTrace() ;
        }
        finally
        {
            dbc.close() ;
        }
        return all ;
    }

    @Override
    public List<board> queryByLike(HashMap cond, SplitPage sp) throws Exception {
        List<board> all = new ArrayList<board>() ;
        String str=null;
        /*if(cond.containsKey("id"))
            str="id LIKE "+"'"+cond.get("id")+"'";*/
        if(cond.containsKey("board_account"))
            str="board_account LIKE "+"'"+cond.get("board_account")+"'";
        String sql = "SELECT  * FROM board WHERE "+str+" LIMIT "+sp.getPageRows()*(sp.getCurrentPage()-1)+","+sp.getPageRows();
        Statement stmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try
        {
            stmt = dbc.getConnection().createStatement() ;
            ResultSet rs = stmt.executeQuery(sql) ;
            while(rs.next())
            {
                board board=new board();
                board.setId(rs.getInt("id"));
                board.setBoard_account(rs.getString("board_account"));
                board.setBoard_content(rs.getString("board_content"));
                board.setBoard_date(rs.getString("board_date"));
                board.setBoard_image(rs.getString("board_image"));
                all.add(board);
            }
            rs.close() ;
            stmt.close() ;
        }
        catch (Exception e)
        {
            e.printStackTrace() ;
        }
        finally
        {
            dbc.close() ;
        }
        return all ;
    }

    @Override
    public List<board> queryAll(String board_account) throws Exception {
        List<board> list = new ArrayList<board>();
        String sql = "SELECT * FROM board where board_account=?" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, board_account);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                board board=new board();
                board.setId(rs.getInt("id"));
                board.setBoard_account(rs.getString("board_account"));
                board.setBoard_content(rs.getString("board_content"));
                board.setBoard_date(rs.getString("board_date"));
                board.setBoard_image(rs.getString("board_image"));
                list.add(board);
            }
        }catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally {
            dbc.close();
        }
        return list;
    }
}
