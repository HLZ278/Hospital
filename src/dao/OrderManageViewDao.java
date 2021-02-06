package dao;
import entity.OrderManageView;

import java.util.List;

public interface OrderManageViewDao {
	List<OrderManageView> queryByUserID(int userID);

	List<OrderManageView> queryByUserID(int userID, int status);

	List<OrderManageView> queryByHopitalID(int hopitalID, String page);
	List<OrderManageView> queryByHopitalID(int hopitalID, int status);

    List<OrderManageView> queryByOrderID(int orderID);

	int countDepartment(int hospitalID);
}
