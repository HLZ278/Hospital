package dao;
import entity.NumSrc;
import entity.Order;
import entity.OrderManageView;

import java.util.List;

public interface OrderManageViewDao {
	List<OrderManageView> queryByUserID(int userID);

	List<OrderManageView> queryByUserID(int userID, int status);

	List<OrderManageView> queryByHopitalID(int hopitalID);
	List<OrderManageView> queryByHopitalID(int hopitalID, int status);

}
