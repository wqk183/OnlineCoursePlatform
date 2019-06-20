package OCP.daoImpl;

import OCP.dao.PersonDao;
import OCP.util.DataBaseConnection;
import OCP.util.SplitPage;
import OCP.vo.person;

import javax.security.auth.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class PersonDaoImpl implements PersonDao {
    @Override
    public boolean login(person person) throws Exception {
        boolean flag = false;
        String sql = "SELECT account,password FROM person WHERE account=? and password=? and identity =?";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1, person.getAccount());
        pstmt.setString(2, person.getPassword());
        pstmt.setString(3, person.getIdentity());
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            flag = true;
        }
        return flag;
    }

    @Override
    public void register(person person) throws Exception {
        String sql = "insert into person(id,account,password,image) values(id,?,?,?)";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1, person.getAccount());
        pstmt.setString(2, person.getPassword());
        pstmt.setString(3,person.getImage());
        pstmt.executeUpdate();
        pstmt.close();
    }

    @Override
    public void add(person person) throws Exception {
        String sql = "insert into person(id,account,password,sex,image,identity) values(id,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1, person.getAccount());
        pstmt.setString(2, person.getPassword());
        pstmt.setString(3,person.getSex());
        pstmt.setString(4,person.getImage());
        pstmt.setString(5,person.getIdentity());
        pstmt.executeUpdate();
        pstmt.close();
    }

    @Override
    public String QueryId(person person) throws Exception {
        String b = "";
        String sql = "SELECT id FROM person WHERE account=?";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1, person.getAccount());
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            b = rs.getString(1);
        }
        return b;
    }

    @Override
    public String QueryImage(String account) throws Exception {
        String a = "";
        String sql = "SELECT image FROM person WHERE account=?";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1, account);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            a = rs.getString(1);
        }
        return a;
    }

    @Override
    public void update(person person) throws Exception {
        String sql="UPDATE person SET image=? WHERE id=?";
        PreparedStatement pstmt=null;
        DataBaseConnection dbc =null;
        dbc = new DataBaseConnection() ;
        pstmt=dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1,person.getImage());
        pstmt.setInt(2,person.getId());
        pstmt.executeUpdate();
        pstmt.close();
    }

    @Override
    public List<person> queryAll(String account) throws Exception {
        List<person> list = new ArrayList<person>();
        String sql = "SELECT * FROM person where account=?" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, account);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                person per=new person();
                per.setId(rs.getInt("id"));
                per.setAccount(rs.getString("account"));
                per.setPassword(rs.getString("password"));
                per.setImage(rs.getString("image"));
                per.setName(rs.getString("name"));
                per.setSex(rs.getString("sex"));
                per.setAge(rs.getInt("age"));
                per.setAddress(rs.getString("address"));
                per.setIntroducing(rs.getString("introducing"));
                per.setJob(rs.getString("job"));
                per.setJob_direction(rs.getString("job_direction"));
                per.setIdentity(rs.getString("identity"));
                list.add(per);
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
    public boolean updateInfor(String account, String password, String name, String sex, int age, String address, String introducing, String job, String job_direction,String identity) {
        boolean flag = false;
        String sql = "update person set password = '"+password+"',name = '"+name+"',sex = '"+sex+ "',age = '"+age+"',address = '"+address+"',introducing = '"+introducing+"',job = '"+job+"',job_direction = '"+job_direction+"',identity = '"+identity+"' where account = '"+account+"'";
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
    public List<person> getSize() {
        List list =new ArrayList();
        String sql = "SELECT * FROM person" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                person per=new person();
                per.setId(rs.getInt("id"));
                per.setAccount(rs.getString("account"));
                per.setPassword(rs.getString("password"));
                per.setImage(rs.getString("image"));
                per.setName(rs.getString("name"));
                per.setSex(rs.getString("sex"));
                per.setAge(rs.getInt("age"));
                per.setAddress(rs.getString("address"));
                per.setIntroducing(rs.getString("introducing"));
                per.setJob(rs.getString("job"));
                per.setJob_direction(rs.getString("job_direction"));
                per.setIdentity(rs.getString("identity"));
                list.add(per);
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
    public List<person> queryAll(SplitPage sp) {
        List<person> list=new ArrayList<>();
        String sql = "select * from person limit " + sp.getPageRows()* (sp.getCurrentPage()-1) +"," + sp.getPageRows();
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try {
            pstmt=dbc.getConnection().prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                person per=new person();
                per.setId(rs.getInt("id"));
                per.setAccount(rs.getString("account"));
                per.setPassword(rs.getString("password"));
                per.setImage(rs.getString("image"));
                per.setName(rs.getString("name"));
                per.setSex(rs.getString("sex"));
                per.setAge(rs.getInt("age"));
                per.setAddress(rs.getString("address"));
                per.setIntroducing(rs.getString("introducing"));
                per.setJob(rs.getString("job"));
                per.setJob_direction(rs.getString("job_direction"));
                per.setIdentity(rs.getString("identity"));
                list.add(per);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int getRows(HashMap tm) throws Exception {
        List<person> list = new ArrayList<person>() ;
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
    public List<person> queryByLike(HashMap cond) throws Exception {
        List<person> all = new ArrayList<person>() ;
        String str=null;
        if(cond.containsKey("account"))
            str="account LIKE "+"'"+cond.get("account")+"'";
        if(cond.containsKey("name"))
            str="name LIKE "+"'"+cond.get("name")+"'";
        String sql = "SELECT * FROM person WHERE " +str;
        Statement stmt = null ;
        DataBaseConnection dbc = null ;
        dbc = new DataBaseConnection() ;
        try
        {
            stmt = dbc.getConnection().createStatement() ;
            ResultSet rs = stmt.executeQuery(sql) ;
            while(rs.next())
            {
                person per=new person();
                per.setId(rs.getInt("id"));
                per.setAccount(rs.getString("account"));
                per.setPassword(rs.getString("password"));
                per.setImage(rs.getString("image"));
                per.setName(rs.getString("name"));
                per.setSex(rs.getString("sex"));
                per.setAge(rs.getInt("age"));
                per.setAddress(rs.getString("address"));
                per.setIntroducing(rs.getString("introducing"));
                per.setJob(rs.getString("job"));
                per.setJob_direction(rs.getString("job_direction"));
                per.setIdentity(rs.getString("identity"));
                all.add(per);
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
    public List<person> queryByLike(HashMap cond, SplitPage sp) throws Exception {
        List<person> all = new ArrayList<person>() ;
        String str=null;
        if(cond.containsKey("account"))
            str="account LIKE "+"'"+cond.get("account")+"'";
        if(cond.containsKey("name"))
            str="name LIKE "+"'"+cond.get("name")+"'";
        String sql = "SELECT  * FROM person WHERE "+str+" LIMIT "+sp.getPageRows()*(sp.getCurrentPage()-1)+","+sp.getPageRows();
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
                person per=new person();
                per.setId(rs.getInt("id"));
                per.setAccount(rs.getString("account"));
                per.setPassword(rs.getString("password"));
                per.setImage(rs.getString("image"));
                per.setName(rs.getString("name"));
                per.setSex(rs.getString("sex"));
                per.setAge(rs.getInt("age"));
                per.setAddress(rs.getString("address"));
                per.setIntroducing(rs.getString("introducing"));
                per.setJob(rs.getString("job"));
                per.setJob_direction(rs.getString("job_direction"));
                per.setIdentity(rs.getString("identity"));
                all.add(per);
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
    public void delete(int id) {
        String sql = "DELETE FROM person WHERE id=?" ;
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
}