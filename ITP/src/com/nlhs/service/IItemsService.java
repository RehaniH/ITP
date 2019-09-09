package com.nlhs.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

import com.nlhs.model.Item;

public interface IItemsService {

	public String addItem(Item item);

	public HashSet<Item> filterItems(String name, String category, int cprice, int sprice, int profit)
			throws SQLException;

	public String editItem(Item item);

	public String deleteItem(String id);

	public String HomePageItems(String p1, String p2, String p3, String p4, String p5, String p6);

	public ArrayList<Item> getHomePageItems();
}
