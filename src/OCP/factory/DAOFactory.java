package OCP.factory;


import OCP.dao.*;
import OCP.daoImpl.*;

public class DAOFactory
{
	public static PersonDao getPersonDAOInstance()
	{
		return new PersonDaoImpl() ;
	}

	public static VideoDao getVideoDAOInstance()
	{
		return new VideoDaoImpl() ;
	}

	public static AnnounceDao getAnnounceDAOInstance()
	{
		return new AnnounceDaoImpl() ;
	}

	public static BoardDao getBoardDAOInstance()
	{
		return new BoardDaoImpl() ;
	}

	public static ReplyDao getReplyDAOInstance()
	{
		return new ReplyDaoImpl() ;
	}

	public static SearchDao getSearchDAOInstance()
	{
		return new SearchDaoImpl() ;
	}
	
};