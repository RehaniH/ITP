package com.nlhs.service;

import java.util.ArrayList;

import com.nlhs.model.Stocks;

public interface IStocksServiceImp {

	public String updateStocks(Stocks stock);

	public ArrayList<Stocks> getStockDetails();
}
