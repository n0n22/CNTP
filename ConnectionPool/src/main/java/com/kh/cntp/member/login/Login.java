package com.kh.cntp.member.login;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class Login extends DefaultApi20 {
	
	protected Login(){
    }

    private static class InstanceHolder{
        private static final Login INSTANCE = new Login();
    }

    public static Login instance(){
        return InstanceHolder.INSTANCE;
    }

    @Override
    public String getAccessTokenEndpoint() {
        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
    }                   

    @Override
    protected String getAuthorizationBaseUrl() {
        return "https://nid.naver.com/oauth2.0/authorize";
    }   

}
