package org.leave.julyoauth2.controller;

import org.leave.julyoauth2.domain.UserIdentityInfoBean;
import org.leave.julyoauth2.service.UserIdentityInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    private final static Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    UserIdentityInfoService userIdentityInfoService;

    @RequestMapping("/index")
    public String index() {
        UserIdentityInfoBean bean =  userIdentityInfoService.getUserIdentityInfoByUserName("zz");
        System.out.println(bean);

        return "index";
    }
}
