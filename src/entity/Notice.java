package entity;

import java.sql.Timestamp;

public class Notice {
    private int noticeID;
    private String title;
    private String content;
    private Timestamp createTime;

    @Override
    public String toString() {
        return "Notice{" +
                "noticeID=" + noticeID +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                '}';
    }

    public int getNoticeID() {
        return noticeID;
    }

    public void setNoticeID(int noticeID) {
        this.noticeID = noticeID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
