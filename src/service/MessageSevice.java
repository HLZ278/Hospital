package service;

import entity.Message;
import entity.Notice;

import java.util.List;

public interface MessageSevice {
    public List<Message> queryAll(int page);

    List<Message> queryAllByUserID(int userID, int page);
}
