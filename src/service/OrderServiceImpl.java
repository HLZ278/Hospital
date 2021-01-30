package service;

import dao.NumSrcDaoImpl;
import dao.OrderDao;
import dao.OrderDaoImpl;
import entity.NumSrc;
import entity.Order;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

public class OrderServiceImpl implements OrderService {
    OrderDao orderDao = new OrderDaoImpl();
    @Override
    public void insert(Order order) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        order.setContractTime(timestamp);
        orderDao.insert(order);
    }

    @Override
    public void cancle(int orderID) {
        orderDao.cancle(orderID);
    }
}
