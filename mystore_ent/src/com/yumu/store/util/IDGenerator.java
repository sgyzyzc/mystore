package com.yumu.store.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class IDGenerator {
	
	public static String getID(){
		Date date = new Date();
		String time = new SimpleDateFormat("yyyyMMddHHmmss").format(date);
		return time+date.getTime();
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
