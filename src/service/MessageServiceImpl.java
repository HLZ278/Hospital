package service;
import dao.MessageDaoImpl;
import dao.NoticeDaoImpl;
import entity.Message;
import entity.Notice;

import java.util.List;

public class MessageServiceImpl implements MessageSevice {
    @Override
    public List<Message> queryAll(int page) {
        MessageDaoImpl messageDao = new MessageDaoImpl();
        return messageDao.queryAll(page);
    }

    @Override
    public List<Message> queryAllByUserID(int userID, int page) {
        MessageDaoImpl messageDao = new MessageDaoImpl();
        return messageDao.queryAllByUserID(userID, page);
    }

    @Override
    public void deleteMessage(int messageID) {
        MessageDaoImpl messageDao = new MessageDaoImpl();
        messageDao.deleteMessage(messageID);
    }

    @Override
    public int countMessage(int userID) {
        MessageDaoImpl messageDao = new MessageDaoImpl();
        return messageDao.countMessage(userID);
    }

    @Override
    public int countAllMessage() {
        MessageDaoImpl messageDao = new MessageDaoImpl();
        return messageDao.countAllMessage();
    }

    @Override
    public void insertNotice(Message message) {
        MessageDaoImpl messageDao = new MessageDaoImpl();
         messageDao.insertNotice(message);
    }
}
