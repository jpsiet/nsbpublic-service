package com.school.utils;



public class Utils {

    /**
     * Returns fallback if value is null or blank.
     */
    public static String fallbackIfBlank(String value, String fallback) {
        return (value == null || value.trim().isEmpty()) ? fallback : value;
    }

    public static <T> java.util.List<T> fallbackIfEmptyList(java.util.List<T> list, java.util.List<T> fallback) {
        return (list == null || list.isEmpty()) ? fallback : list;
    }

}
