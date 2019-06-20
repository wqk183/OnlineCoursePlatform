package OCP.dao;

import OCP.util.SplitPage;
import OCP.vo.reply;

import java.util.HashMap;
import java.util.List;

public interface ReplyDao {

    public void add(reply reply) throws Exception;

    public void delete(int id);

    public List<reply> getSize();

    public List<reply> queryAll(SplitPage sp);

    public int getRows(HashMap tm)throws Exception;

    public List<reply> queryByLike(HashMap cond)throws Exception;

    public List<reply> queryByLike(HashMap cond,SplitPage sp)throws Exception;

    public List<reply> queryAll(String reply_account) throws Exception;
}
