package service;
import dao.NumSrcViewDaoImpl;
import dao.OrderManageViewDao;
import dao.OrderManageViewDaoImpl;
import entity.OrderManageView;

import java.util.List;

public class OrderManageViewServiceImpl implements OrderManageViewService{
	@Override
	public List<OrderManageView> queryByUserID(int userID) {
		OrderManageViewDaoImpl orderManageViewDao = new OrderManageViewDaoImpl();
		return orderManageViewDao.queryByUserID(userID);
	}

	@Override
	public List<OrderManageView> queryByUserIDAndStatus(int userID, int status) {
		OrderManageViewDaoImpl orderManageViewDao = new OrderManageViewDaoImpl();
		return orderManageViewDao.queryByUserID(userID, status);
	}

	@Override
	public List<OrderManageView> queryByHopitalID(int hopitalID, String page) {
		OrderManageViewDaoImpl orderManageViewDao = new OrderManageViewDaoImpl();
		return orderManageViewDao.queryByHopitalID(hopitalID, page);
	}

	@Override
	public List<OrderManageView> queryByHopitalID(int hopitalID, int status) {
		OrderManageViewDaoImpl orderManageViewDao = new OrderManageViewDaoImpl();
		return orderManageViewDao.queryByHopitalID(hopitalID, status);
	}

	@Override
	public List<OrderManageView> queryByOrderID(int orderID) {
		OrderManageViewDaoImpl orderManageViewDao = new OrderManageViewDaoImpl();
		return orderManageViewDao.queryByOrderID(orderID);
	}

	@Override
	public int countDepartment(int hospitalID) {
		OrderManageViewDaoImpl orderManageViewDao = new OrderManageViewDaoImpl();
		return orderManageViewDao.countDepartment(hospitalID);
	}
}
