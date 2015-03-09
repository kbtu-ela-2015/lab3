package com.anel.common;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.anel.stock.bo.StockBo;
import com.anel.stock.model.Stock;
public class App {
	public static void main(String[] args) {
		
		ApplicationContext appContext = new ClassPathXmlApplicationContext("spring/config/BeanLocations.xml");
		
		StockBo stockBo = (StockBo)appContext.getBean("stockBo");

		
		//insert
		Stock stock = new Stock();
		stock.setStockCode("7600");
		stock.setStockName("HAIO");
		stockBo.save(stock);
		
/*		//select
		Stock stock2 = stockBo.findByStockCode("76");
		System.out.println(stock2);
		
		//update
		stock2.setStockName("HA1");
		stockBo.update(stock2);
		
		//delete
		stockBo.delete(stock2);
		
		System.out.println("Done");*/
	}
}
