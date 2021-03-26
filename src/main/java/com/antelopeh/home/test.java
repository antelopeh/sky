package com.antelopeh.home;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

public class test {
    public static void main(String[] args) throws ParseException {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());

        int i = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        if (i < 0)
            i = 0;
        System.out.printf(""+i);
    }
}
