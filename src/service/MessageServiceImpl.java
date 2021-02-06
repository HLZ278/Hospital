package service;

import dao.MessageDAO;
import dao.MessageDaoImpl;
import dao.NoticeDaoImpl;
import entity.Message;
import entity.Notice;

import java.util.List;

public class MessageServiceImpl implements MessageDAO {
    @Override
    public List<Message> queryAll() {
        MessageDaoImpl messageDao = new MessageDaoImpl();
        return messageDao.queryAll();
    }
}
