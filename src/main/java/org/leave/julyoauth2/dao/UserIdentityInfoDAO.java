package org.leave.julyoauth2.dao;

import org.leave.julyoauth2.domain.UserIdentityInfoBean;

public interface UserIdentityInfoDAO {
    UserIdentityInfoBean getUserIdentityInfoByPK(String userId);

    UserIdentityInfoBean getUserIdentityInfoByMobile(String mobile);

    UserIdentityInfoBean getUserIdentityInfoByEmail(String email);

    UserIdentityInfoBean getUserIdentityInfoByUserName(String userName);
}
