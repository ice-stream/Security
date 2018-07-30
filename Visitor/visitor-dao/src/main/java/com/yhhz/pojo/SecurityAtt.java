package com.yhhz.pojo;

import java.util.Date;

public class SecurityAtt {
    private Long attId;

    private Long attUid;

    private String attUsername;

    private Date attDate;

    private Date attWorkdate;

    private Date attLeavedate;

    private String attAuthor;

    private String attImage;

    private Long vVersions;

    public Long getAttId() {
        return attId;
    }

    public void setAttId(Long attId) {
        this.attId = attId;
    }

    public Long getAttUid() {
        return attUid;
    }

    public void setAttUid(Long attUid) {
        this.attUid = attUid;
    }

    public String getAttUsername() {
        return attUsername;
    }

    public void setAttUsername(String attUsername) {
        this.attUsername = attUsername == null ? null : attUsername.trim();
    }

    public Date getAttDate() {
        return attDate;
    }

    public void setAttDate(Date attDate) {
        this.attDate = attDate;
    }

    public Date getAttWorkdate() {
        return attWorkdate;
    }

    public void setAttWorkdate(Date attWorkdate) {
        this.attWorkdate = attWorkdate;
    }

    public Date getAttLeavedate() {
        return attLeavedate;
    }

    public void setAttLeavedate(Date attLeavedate) {
        this.attLeavedate = attLeavedate;
    }

    public String getAttAuthor() {
        return attAuthor;
    }

    public void setAttAuthor(String attAuthor) {
        this.attAuthor = attAuthor == null ? null : attAuthor.trim();
    }

    public String getAttImage() {
        return attImage;
    }

    public void setAttImage(String attImage) {
        this.attImage = attImage == null ? null : attImage.trim();
    }

    public Long getvVersions() {
        return vVersions;
    }

    public void setvVersions(Long vVersions) {
        this.vVersions = vVersions;
    }
}