package uk.gov.justice.probation.courtcaseservice.application;

import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.lang.NonNull;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.Optional;

@Configuration
@Slf4j
public class ClientTrackingInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest req, @NonNull HttpServletResponse response, @NonNull Object handler) {

        var token = req.getHeader(HttpHeaders.AUTHORIZATION);
        if (StringUtils.startsWithIgnoreCase(token, "Bearer ")) {
            try {
                var claimsSet = getClaimsFromJWT(token);

                Optional.ofNullable(claimsSet.getClaim("user_name"))
                        .map(Object::toString)
                        .ifPresent(user -> MDC.put("username", user));

                Optional.ofNullable(claimsSet.getClaim("client_id"))
                        .map(Object::toString)
                        .ifPresent(clientId -> MDC.put("clientId", clientId));

            } catch (ParseException e) {
                ClientTrackingInterceptor.log.warn("problem decoding jwt public key for application insights", e);
            }
        }
        return true;
    }

    @Override
    public void postHandle(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull Object handler, ModelAndView modelAndView){
        MDC.clear();
    }

    private JWTClaimsSet getClaimsFromJWT(String token) throws ParseException {
        var signedJWT = SignedJWT.parse(token.replace("Bearer ", ""));
        return signedJWT.getJWTClaimsSet();
    }
}
