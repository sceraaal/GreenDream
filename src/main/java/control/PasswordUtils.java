package control;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtils {

    // Questo metodo prende la password in chiaro e la restituisce cifrata in esadecimale
    public static String hashPassword(String password) {
        try {
            // Istanziamo l'algoritmo SHA-256
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            
            // Convertiamo la password in un array di byte ed eseguiamo l'hashing
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            
            // Convertiamo l'array di byte in una stringa esadecimale
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
            
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Errore critico: Algoritmo di cifratura non trovato.", e);
        }
    }
}