package OCP.daoImpl;

import OCP.dao.SearchDao;
import OCP.util.DataBaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SearchDaoImpl implements SearchDao {

    @Override
    public String QueryLink(String search_name) throws Exception {
        String link = "";
        String sql = "SELECT search_link FROM search WHERE search_name=?";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setString(1, search_name);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            link = rs.getString(1);
        }
        return link;
    }
}
