package OCP.dao;


import OCP.util.SplitPage;
import OCP.vo.announce;
import java.util.HashMap;
import java.util.List;

public interface AnnounceDao {
    public void add(announce announce) throws Exception;

    public boolean updateAnnounceInfor(String announce_title,String announce_content,String announce_date);

    public void delete(int id);

    public List<announce> getSize();

    public List<announce> queryAll(SplitPage sp);

    public int getRows(HashMap tm)throws Exception;

    public List<announce> queryByLike(HashMap cond)throws Exception;

    public List<announce> queryByLike(HashMap cond,SplitPage sp)throws Exception;

    public List<announce> queryAll(String announce_title) throws Exception;
}
