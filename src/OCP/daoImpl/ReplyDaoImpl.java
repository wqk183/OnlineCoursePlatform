package OCP.daoImpl;

import OCP.dao.ReplyDao;
import OCP.util.DataBaseConnection;
import OCP.util.SplitPage;
import OCP.vo.board;
import OCP.vo.reply;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ReplyDaoImpl implements ReplyDao {
    @Override
    public void add(reply reply) throws Exception {
        String sql = "insert into reply(id,reply_image,reply_account,reply_content,reply_date,board_account,board_content,board_date,board_image) values(id,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1, reply.getReply_image());
        pstmt.setString(2, reply.getReply_account());
        pstmt.setString(3, reply.getReply_content());
        pstmt.setString(4, reply.getReply_date());
        pstmt.setString(5, reply.getBoard_account());
        pstmt.setString(6, reply.getBoard_content());
        pstmt.setString(7, reply.getBoard_date());
        pstmt.setString(8, reply.getBoard_image());
        pstmt.executeUpdate();
        pstmt.close();
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM reply WHERE id=?" ;
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
    public List<reply> getSize() {
        List list =new ArrayList();
        String sql = "SELECT * FROM reply" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                reply reply=new reply();
                reply.setId(rs.getInt("id"));
                reply.setReply_image(rs.getString("reply_image"));
                reply.setReply_account(rs.getString("reply_account"));
                reply.setReply_content(rs.getString("reply_content"));
                reply.setReply_date(rs.getString("reply_date"));
                reply.setBoard_account(rs.getString("board_account"));
                reply.setBoard_content(rs.getString("board_content"));
                reply.setBoard_date(rs.getString("board_date"));
                reply.setBoard_image(rs.getString("board_image"));
                list.add(reply);
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
    public List<reply> queryAll(SplitPage sp) {
        List<reply> list=new ArrayList<>();
        String sql = "select * from reply limit " + sp.getPageRows()* (sp.getCurrentPage()-1) +"," + sp.getPageRows();
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                reply reply=new reply();
                reply.setId(rs.getInt("id"));
                reply.setReply_image(rs.getString("reply_image"));
                reply.setReply_account(rs.getString("reply_account"));
                reply.setReply_content(rs.getString("reply_content"));
                reply.setReply_date(rs.getString("reply_date"));
                reply.setBoard_account(rs.getString("board_account"));
                reply.setBoard_content(rs.getString("board_content"));
                reply.setBoard_date(rs.getString("board_date"));
                reply.setBoard_image(rs.getString("board_image"));
                list.add(reply);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int getRows(HashMap tm) throws Exception {
        List<reply> list = new ArrayList<reply>() ;
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
    public List<reply> queryByLike(HashMap cond) throws Exception {
        List<reply> all = new ArrayList<reply>() ;
        String str=null;
       /* if(cond.containsKey("id"))
            str="id LIKE "+"'"+cond.get("id")+"'";*/
        if(cond.containsKey("reply_account"))
            str="reply_account LIKE "+"'"+cond.get("reply_account")+"'";
        String sql = "SELECT * FROM reply WHERE " +str;
        Statement stmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try
        {
            stmt = dbc.getConnection().createStatement() ;
            ResultSet rs = stmt.executeQuery(sql) ;
            while(rs.next())
            {
                reply reply=new reply();
                reply.setId(rs.getInt("id"));
                reply.setReply_image(rs.getString("reply_image"));
                reply.setReply_account(rs.getString("reply_account"));
                reply.setReply_content(rs.getString("reply_content"));
                reply.setReply_date(rs.getString("reply_date"));
                reply.setBoard_account(rs.getString("board_account"));
                reply.setBoard_content(rs.getString("board_content"));
                reply.setBoard_date(rs.getString("board_date"));
                reply.setBoard_image(rs.getString("board_image"));
                all.add(reply);
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
    public List<reply> queryByLike(HashMap cond, SplitPage sp) throws Exception {
        List<reply> all = new ArrayList<reply>() ;
        String str=null;
       /* if(cond.containsKey("id"))
            str="id LIKE "+"'"+cond.get("id")+"'";*/
        if(cond.containsKey("reply_account"))
            str="reply_account LIKE "+"'"+cond.get("reply_account")+"'";
        String sql = "SELECT  * FROM reply WHERE "+str+" LIMIT "+sp.getPageRows()*(sp.getCurrentPage()-1)+","+sp.getPageRows();
        Statement stmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try
        {
            stmt = dbc.getConnection().createStatement() ;
            ResultSet rs = stmt.executeQuery(sql) ;
            while(rs.next())
            {
                reply reply=new reply();
                reply.setId(rs.getInt("id"));
                reply.setReply_image(rs.getString("reply_image"));
                reply.setReply_account(rs.getString("reply_account"));
                reply.setReply_content(rs.getString("reply_content"));
                reply.setReply_date(rs.getString("reply_date"));
                reply.setBoard_account(rs.getString("board_account"));
                reply.setBoard_content(rs.getString("board_content"));
                reply.setBoard_date(rs.getString("board_date"));
                reply.setBoard_image(rs.getString("board_image"));
                all.add(reply);
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
    public List<reply> queryAll(String reply_account) throws Exception {
        List<reply> list = new ArrayList<reply>();
        String sql = "SELECT * FROM reply where reply_account=?" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, reply_account);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                reply reply=new reply();
                reply.setId(rs.getInt("id"));
                reply.setReply_image(rs.getString("reply_image"));
                reply.setReply_account(rs.getString("reply_account"));
                reply.setReply_content(rs.getString("reply_content"));
                reply.setReply_date(rs.getString("reply_date"));
                reply.setBoard_account(rs.getString("board_account"));
                reply.setBoard_content(rs.getString("board_content"));
                reply.setBoard_date(rs.getString("board_date"));
                reply.setBoard_image(rs.getString("board_image"));
                list.add(reply);
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
