package service;
import entity.OrderManageView;

import java.util.List;

public interface OrderManageViewService {
	List<OrderManageView> queryByUserID(int userID);

    List<OrderManageView> queryByUserIDAndStatus(int userID, int status);

    List<OrderManageView> queryByHopitalID(int hopitalID);
    List<OrderManageView> queryByHopitalID(int hopitalID, int status);

    List<OrderManageView> queryByOrderID(int orderID);
}
