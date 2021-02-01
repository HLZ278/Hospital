package dao;
import entity.NumSrc;
import entity.Order;

import java.util.List;

public interface OrderDao {
	public void insert(Order order);

	void cancle(int orderID);

    void completeOrder(int orderID);

	void breakOrder(int orderID);
}


