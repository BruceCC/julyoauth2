package org.leave.julyoauth2.service;

/*
import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.exceptions.InvalidTokenException;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.TokenRequest;
import org.springframework.security.oauth2.provider.token.*;
*/

public class TokenService  /*implements AuthorizationServerTokenServices, ResourceServerTokenServices, ConsumerTokenServices, InitializingBean*/ {
   /* private int refreshTokenValiditySeconds = 2592000;       //refresh_token 的超时时间  默认2592000秒
    private int accessTokenValiditySeconds = 10;             //access_token 的超时时间   默认12个小时
    private boolean supportRefreshToken = false;            //是否支持access_token 刷新，默认是false,在配置文件中以配置成可以支持了，
    private boolean reuseRefreshToken = true; */              //使用refresh_token刷新之后该refresh_token是否依然使用，默认是依然使用
   /* private TokenStore tokenStore;   */                          //access_token的存储方式，这个在配置文件中配置

    /*private org.springframework.security.oauth2.provider.ClientDetailsService clientDetailsService;
    private TokenEnhancer accessTokenEnhancer;

    public OAuth2AccessToken createAccessToken(OAuth2Authentication oAuth2Authentication) throws AuthenticationException {
        return null;
    }

    public OAuth2AccessToken refreshAccessToken(String s, TokenRequest tokenRequest) throws AuthenticationException {
        return null;
    }

    public OAuth2AccessToken getAccessToken(OAuth2Authentication oAuth2Authentication) {
        return null;
    }

    public boolean revokeToken(String s) {
        return false;
    }

    public OAuth2Authentication loadAuthentication(String s) throws AuthenticationException, InvalidTokenException {
        return null;
    }

    public OAuth2AccessToken readAccessToken(String s) {
        return null;
    }

    public void afterPropertiesSet() throws Exception {

    }

    public int getRefreshTokenValiditySeconds() {
        return refreshTokenValiditySeconds;
    }

    public void setRefreshTokenValiditySeconds(int refreshTokenValiditySeconds) {
        this.refreshTokenValiditySeconds = refreshTokenValiditySeconds;
    }

    public int getAccessTokenValiditySeconds() {
        return accessTokenValiditySeconds;
    }

    public void setAccessTokenValiditySeconds(int accessTokenValiditySeconds) {
        this.accessTokenValiditySeconds = accessTokenValiditySeconds;
    }

    public boolean isSupportRefreshToken() {
        return supportRefreshToken;
    }

    public void setSupportRefreshToken(boolean supportRefreshToken) {
        this.supportRefreshToken = supportRefreshToken;
    }

    public boolean isReuseRefreshToken() {
        return reuseRefreshToken;
    }

    public void setReuseRefreshToken(boolean reuseRefreshToken) {
        this.reuseRefreshToken = reuseRefreshToken;
    }

    public TokenStore getTokenStore() {
        return tokenStore;
    }

    public void setTokenStore(TokenStore tokenStore) {
        this.tokenStore = tokenStore;
    }

    public ClientDetailsService getClientDetailsService() {
        return clientDetailsService;
    }

    public void setClientDetailsService(ClientDetailsService clientDetailsService) {
        this.clientDetailsService = clientDetailsService;
    }

    public TokenEnhancer getAccessTokenEnhancer() {
        return accessTokenEnhancer;
    }

    public void setAccessTokenEnhancer(TokenEnhancer accessTokenEnhancer) {
        this.accessTokenEnhancer = accessTokenEnhancer;
    }*/
}
