package org.leave.julyoauth2.service;

import org.leave.julyoauth2.dao.UserIdentityInfoDAO;
import org.leave.julyoauth2.domain.UserIdentityInfoBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserIdentityInfoService {
    private final Logger logger = LoggerFactory.getLogger(UserIdentityInfoService.class);

    @Autowired
    private UserIdentityInfoDAO userIdentityInfoDAO;

    public UserIdentityInfoBean getUserIdentityInfoByUserName(String userName){
        UserIdentityInfoBean userIdentityInfoBean = null;
        try {
            userIdentityInfoBean =  userIdentityInfoDAO.getUserIdentityInfoByUserName(userName);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Error (getUserIdentityInfoByUserName): userName->" + userName, e.getMessage());
        }
        return userIdentityInfoBean;
    }
}
