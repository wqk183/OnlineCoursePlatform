package OCP.dao;

import OCP.util.SplitPage;
import OCP.vo.person;

import java.util.HashMap;
import java.util.List;

public interface PersonDao {
    public boolean login(person person) throws Exception;

    public void register(person person) throws Exception;

    public void add(person person) throws Exception;

    public String QueryId(person person) throws Exception;

    public String QueryImage(String account) throws Exception;

    public void update(person person) throws Exception;

    public List<person> queryAll(String account) throws Exception;

    public boolean updateInfor(String account, String password, String name, String sex, int age, String address, String introducing, String job, String job_direction,String identity);

    public List<person> getSize();

    public List<person> queryAll(SplitPage sp);

    public int getRows(HashMap tm)throws Exception;

    public List<person> queryByLike(HashMap cond)throws Exception;

    public List<person> queryByLike(HashMap cond,SplitPage sp)throws Exception;

    public void delete(int id);
}