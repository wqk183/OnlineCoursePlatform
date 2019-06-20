package OCP.dao;

import OCP.util.SplitPage;
import OCP.vo.board;

import java.util.HashMap;
import java.util.List;

public interface BoardDao {

    public void add(board board) throws Exception;

    public boolean updateBoardInfor(String board_account,String board_content,String board_date,String board_image);

    public void delete(int id);

    public List<board> getSize();

    public List<board> queryAll(SplitPage sp);

    public int getRows(HashMap tm)throws Exception;

    public List<board> queryByLike(HashMap cond)throws Exception;

    public List<board> queryByLike(HashMap cond,SplitPage sp)throws Exception;

    public List<board> queryAll(String board_account) throws Exception;
}
