package OCP.daoImpl;

import OCP.dao.AnnounceDao;
import OCP.util.DataBaseConnection;
import OCP.util.SplitPage;
import OCP.vo.announce;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class AnnounceDaoImpl implements AnnounceDao {
    @Override
    public void add(announce announce) throws Exception {
        String sql = "insert into announce(id,announce_title,announce_content,announce_date) values(id,?,?,?)";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1, announce.getAnnounce_title());
        pstmt.setString(2, announce.getAnnounce_content());
        pstmt.setString(3,announce.getAnnounce_date());
        pstmt.executeUpdate();
        pstmt.close();
    }

    @Override
    public boolean updateAnnounceInfor(String announce_title, String announce_content, String announce_date) {
        boolean flag = false;
        String sql = "update announce set announce_content = '"+announce_content+"',announce_date = '"+announce_date+"' where announce_title = '"+announce_title+"'";
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
        String sql = "DELETE FROM announce WHERE id=?" ;
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
    public List<announce> getSize() {
        List list =new ArrayList();
        String sql = "SELECT * FROM announce" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                announce announce=new announce();
                announce.setId(rs.getInt("id"));
                announce.setAnnounce_title(rs.getString("announce_title"));
                announce.setAnnounce_content(rs.getString("announce_content"));
                announce.setAnnounce_date(rs.getString("announce_date"));
                list.add(announce);
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
    public List<announce> queryAll(SplitPage sp) {
        List<announce> list=new ArrayList<>();
        String sql = "select * from announce limit " + sp.getPageRows()* (sp.getCurrentPage()-1) +"," + sp.getPageRows();
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                announce announce=new announce();
                announce.setId(rs.getInt("id"));
                announce.setAnnounce_title(rs.getString("announce_title"));
                announce.setAnnounce_content(rs.getString("announce_content"));
                announce.setAnnounce_date(rs.getString("announce_date"));
                list.add(announce);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int getRows(HashMap tm) throws Exception {
        List<announce> list = new ArrayList<announce>() ;
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
    public List<announce> queryByLike(HashMap cond) throws Exception {
        List<announce> all = new ArrayList<announce>() ;
        String str=null;
        if(cond.containsKey("id"))
            str="id LIKE "+"'"+cond.get("id")+"'";
        if(cond.containsKey("announce_title"))
            str="announce_title LIKE "+"'"+cond.get("announce_title")+"'";
        String sql = "SELECT * FROM announce WHERE " +str;
        Statement stmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try
        {
            stmt = dbc.getConnection().createStatement() ;
            ResultSet rs = stmt.executeQuery(sql) ;
            while(rs.next())
            {
                announce announce=new announce();
                announce.setId(rs.getInt("id"));
                announce.setAnnounce_title(rs.getString("announce_title"));
                announce.setAnnounce_content(rs.getString("announce_content"));
                announce.setAnnounce_date(rs.getString("announce_date"));
                all.add(announce);
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
    public List<announce> queryByLike(HashMap cond, SplitPage sp) throws Exception {
        List<announce> all = new ArrayList<announce>() ;
        String str=null;
        if(cond.containsKey("id"))
            str="id LIKE "+"'"+cond.get("id")+"'";
        if(cond.containsKey("announce_title"))
            str="announce_title LIKE "+"'"+cond.get("announce_title")+"'";
        String sql = "SELECT  * FROM announce WHERE "+str+" LIMIT "+sp.getPageRows()*(sp.getCurrentPage()-1)+","+sp.getPageRows();
//        System.out.println(sql);
        Statement stmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try
        {
            stmt = dbc.getConnection().createStatement() ;
            ResultSet rs = stmt.executeQuery(sql) ;
            while(rs.next())
            {
                announce announce=new announce();
                announce.setId(rs.getInt("id"));
                announce.setAnnounce_title(rs.getString("announce_title"));
                announce.setAnnounce_content(rs.getString("announce_content"));
                announce.setAnnounce_date(rs.getString("announce_date"));
                all.add(announce);
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
    public List<announce> queryAll(String announce_title) throws Exception {
        List<announce> list = new ArrayList<announce>();
        String sql = "SELECT * FROM announce where announce_title=?" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, announce_title);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                announce announce=new announce();
                announce.setId(rs.getInt("id"));
                announce.setAnnounce_title(rs.getString("announce_title"));
                announce.setAnnounce_content(rs.getString("announce_content"));
                announce.setAnnounce_date(rs.getString("announce_date"));
                list.add(announce);
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
