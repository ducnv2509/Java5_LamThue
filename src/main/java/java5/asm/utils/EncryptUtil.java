package java5.asm.utils;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.context.annotation.Bean;

public class EncryptUtil {
    @Bean
    public static String mhPass(String pass) {
        String encrypted = BCrypt.hashpw(pass,
                BCrypt.gensalt());

        return encrypted;
    }
    @Bean
    public static boolean checkpass(
            String pass, String passnew) {
        return BCrypt.checkpw(pass, passnew);
    }
}
