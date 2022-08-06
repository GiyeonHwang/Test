package gg;

import java.util.ArrayList;

public class AbandonList {
	private static ArrayList<DateAbandon> alist;

	public AbandonList() {
		// TODO Auto-generated constructor stub
	}

	public AbandonList(ArrayList<DateAbandon> list) {
		super();
		this.alist = list;
	}

	public ArrayList<DateAbandon> getList() {
		return alist;
	}

	public void setList(ArrayList<DateAbandon> list) {
		this.alist = list;
	}

	public static DateAbandon petInfoIndex(int i) {
		return alist.get(i);
	}

	public DateAbandon searchDesertionNo(String desertionNo) {
		for (int i = 0; i < alist.size(); i++) {
			if ((alist.get(i).getDesertionNo()).equals(desertionNo)) {

				return alist.get(i);
			}
		}
		return null;

	}
}
