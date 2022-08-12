/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.util;

/**
 *
 * @author THAI
 */
public class ValidationUtils {

    public static boolean isValidNumber(String num) {
        String regex = "\\d+";
        return num.matches(regex);
    }
}
