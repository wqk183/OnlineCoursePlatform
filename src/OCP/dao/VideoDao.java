package OCP.dao;
import OCP.util.SplitPage;
import OCP.vo.person;
import OCP.vo.video;

import java.util.HashMap;
import java.util.List;

public interface VideoDao {
    public void add(video video) throws Exception;

    public boolean updateVideoInfor(String video_name,String link);

    public void delete(int id);

    public List<video> getSize();

    public List<video> queryAll(SplitPage sp);

    public int getRows(HashMap tm)throws Exception;

    public List<video> queryByLike(HashMap cond)throws Exception;

    public List<video> queryByLike(HashMap cond,SplitPage sp)throws Exception;

    public List<video> queryAll(String video_name) throws Exception;
}
