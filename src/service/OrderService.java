package service;

import entity.NumSrc;
import entity.Order;
import entity.OrderManageView;

import java.util.List;

public interface OrderService {
    public void insert(Order order);
    public void cancle(int orderID);

    void completeOrder(int orderID);

    void breakOrder(int orderID);
}
