/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myhibernatetest;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author dauren
 */
public interface CustomerDao {
    public void addCustomer(Customer customer) throws SQLException;
    public void deleteCutomer(Customer customer) throws SQLException;
    public Customer getCustomer(int id) throws SQLException;
    public void updateCustomer(int id, String fn, String sn) throws SQLException;
    public List<Customer> getCustomers() throws SQLException;
}
