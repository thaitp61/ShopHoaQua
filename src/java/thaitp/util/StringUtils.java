package thaitp.util;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author THAI
 */
public class StringUtils {

    public static boolean isNotEmpty(String str) {
        return str != null && str.trim().length() > 0;
    }

    public static boolean isEmpty(String str) {
        return str == null || str.trim().length() == 0;
    }
}
