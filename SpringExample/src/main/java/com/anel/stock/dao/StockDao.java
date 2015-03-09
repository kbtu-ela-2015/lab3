package com.anel.stock.dao;
import com.anel.stock.model.*;
public interface StockDao {
	void save(Stock stock);
	void update(Stock stock);
	void delete(Stock stock);
	Stock findByStockCode(String stockCode);
}
