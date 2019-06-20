package OCP.daoImpl;

import OCP.dao.VideoDao;
import OCP.util.DataBaseConnection;
import OCP.util.SplitPage;
import OCP.vo.person;
import OCP.vo.video;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class VideoDaoImpl implements VideoDao {
    @Override
    public void add(video video) throws Exception {
        String sql = "insert into video(id,video_name,link) values(id,?,?)";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1, video.getVideo_name());
        pstmt.setString(2, video.getLink());
        pstmt.executeUpdate();
        pstmt.close();
    }

    @Override
    public boolean updateVideoInfor(String video_name, String link) {
        boolean flag = false;
        String sql = "update video set link = '"+link+"' where video_name = '"+video_name+"'";
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
        String sql = "DELETE FROM video WHERE id=?" ;
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
    public List<video> getSize() {
        List list =new ArrayList();
        String sql = "SELECT * FROM video" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                video video=new video();
                video.setId(rs.getInt("id"));
                video.setVideo_name(rs.getString("video_name"));
                video.setLink(rs.getString("link"));
                list.add(video);
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
    public List<video> queryAll(SplitPage sp) {
        List<video> list=new ArrayList<>();
        String sql = "select * from video limit " + sp.getPageRows()* (sp.getCurrentPage()-1) +"," + sp.getPageRows();
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                video video=new video();
                video.setId(rs.getInt("id"));
                video.setVideo_name(rs.getString("video_name"));
                video.setLink(rs.getString("link"));
                list.add(video);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int getRows(HashMap tm) throws Exception {
        List<video> list = new ArrayList<video>() ;
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
    public List<video> queryByLike(HashMap cond) throws Exception {
        List<video> all = new ArrayList<video>() ;
        String str=null;
        if(cond.containsKey("id"))
            str="id LIKE "+"'"+cond.get("id")+"'";
        if(cond.containsKey("video_name"))
            str="video_name LIKE "+"'"+cond.get("video_name")+"'";
        String sql = "SELECT * FROM video WHERE " +str;
        Statement stmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try
        {
            stmt = dbc.getConnection().createStatement() ;
            ResultSet rs = stmt.executeQuery(sql) ;
            while(rs.next())
            {
                video video=new video();
                video.setId(rs.getInt("id"));
                video.setVideo_name(rs.getString("video_name"));
                video.setLink(rs.getString("link"));
                all.add(video);
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
    public List<video> queryByLike(HashMap cond, SplitPage sp) throws Exception {
        List<video> all = new ArrayList<video>() ;
        String str=null;
        if(cond.containsKey("id"))
            str="id LIKE "+"'"+cond.get("id")+"'";
        if(cond.containsKey("video_name"))
            str="video_name LIKE "+"'"+cond.get("video_name")+"'";
        String sql = "SELECT  * FROM video WHERE "+str+" LIMIT "+sp.getPageRows()*(sp.getCurrentPage()-1)+","+sp.getPageRows();
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
                video video=new video();
                video.setId(rs.getInt("id"));
                video.setVideo_name(rs.getString("video_name"));
                video.setLink(rs.getString("link"));
                all.add(video);
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
    public List<video> queryAll(String video_name) throws Exception {
        List<video> list = new ArrayList<video>();
        String sql = "SELECT * FROM video where video_name=?" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, video_name);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                video video=new video();
                video.setId(rs.getInt("id"));
                video.setVideo_name(rs.getString("video_name"));
                video.setLink(rs.getString("link"));
                list.add(video);
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
