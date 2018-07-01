package org.leave.julyoauth2.domain;

public class UserIdentityInfoBean {
    private String userId;
    private String mobile;
    private String userName;
    private String email;
    private String password;
    private int state;

    public final static int STATE_ACTIVE = 0;
    public final static int STATE_LOCKED = 1;
    public final static int STATE_FROZENED = 2;
    public final static int STATE_DELETE = 3;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
