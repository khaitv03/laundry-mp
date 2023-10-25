/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import DBConnect.ConnectDB;
import Model.Order;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author khait
 */
public class OrderService implements Serializable {

    private List<Order> listOrder;

    public List<Order> getListOrder() {
        return listOrder;
    }

    private Order createOrderFromResultSet(ResultSet rs) throws SQLException {
        String orderID = String.valueOf(rs.getInt("OrderID"));
        String serviceDetail = rs.getString("ServiceDetail");
        String weight = String.valueOf(rs.getDouble("Weight"));
        String totalPrice = String.valueOf(rs.getDouble("TotaPrice"));
        String phoneCus = String.valueOf(rs.getInt("PhoneCus"));
        String addressCus = rs.getString("AddressCus");
        String addressSto = rs.getString("AddressSto");
        String note = rs.getString("Note");
        String timeDesired = rs.getString("TimeDesired");
        String dateDesired;
        Date dateDesiredValueDate = rs.getDate("DateDesired");
        if (rs.wasNull()) {
            dateDesired = "NULL";
        } else {
            dateDesired = dateDesiredValueDate.toString();
        }
        String dateApprove;
        Date dateApproveValueDate = rs.getDate("DateApprove");
        if (rs.wasNull()) {
            dateApprove = "NULL";
        } else {
            dateApprove = dateApproveValueDate.toString();
        }
        String dateComplete;
        Date dateCompleteValue = rs.getDate("DateCompleted");
        if (rs.wasNull()) {
            dateComplete = "NULL";
        } else {
            dateComplete = dateCompleteValue.toString();
        }

        String timeComplete;
        Time timeCompleteValue = rs.getTime("TimeComplete");
        if (rs.wasNull()) {
            timeComplete = "NULL";
        } else {
            timeComplete = timeCompleteValue.toString();
        }
        String customerName = rs.getString("CustomerName");
        String storeName = rs.getString("StoreName");
        String staffName;
        String staffNameValue = rs.getString("StaffName");
        if (rs.wasNull()) {
            staffName = "NULL";
        } else {
            staffName = staffNameValue;
        }

        String stOrderDetail = rs.getString("StOrderDetail");

        Order order = new Order(Integer.parseInt(orderID), serviceDetail, weight, totalPrice, phoneCus, addressCus, addressSto, note,
                timeDesired, dateDesired, dateApprove, dateComplete, timeComplete, customerName, storeName, staffName, stOrderDetail);
        return order;
    }

    public void viewOrder(int userId, String btAction) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        listOrder = new ArrayList<>();

        try {
            con = ConnectDB.getConnection();

            if (con != null) {
                String sql = "SELECT o.OrderID, se.ServiceDetail, od.Weight, od.TotaPrice, od.Phone AS PhoneCus,\n"
                        + " od.AddressCus, od.AddressSto, od.Note,\n"
                        + " o.TimeDesired, o.DateDesired, o.DateApprove, o.DateCompleted, o.TimeComplete,\n"
                        + " u.Fullname AS CustomerName, us.Fullname AS StoreName, uf.Fullname AS StaffName, StOrderDetail\n"
                        + " FROM [Laundry-Middle-Platform].[dbo].[Order] o\n"
                        + " LEFT JOIN [OrderDetail] od ON o.OrderID = od.OrderID\n"
                        + " LEFT JOIN Service se ON se.ServiceID = od.ServiceID\n"
                        + " LEFT JOIN StatusOrder st ON st.StOrderID = o.StOrderID\n"
                        + " LEFT JOIN [Laundry-Middle-Platform].[dbo].[User] u ON u.UserID = o.CustomerID\n"
                        + " LEFT JOIN [Laundry-Middle-Platform].[dbo].[User] us ON us.UserID = o.StoreID\n"
                        + " LEFT JOIN [Laundry-Middle-Platform].[dbo].[User] uf ON uf.UserID = o.StaffID\n"
                        + " WHERE us.UserID = ? AND o.StOrderID = ? ";
                ps = con.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setInt(2, Integer.parseInt(btAction));

                rs = ps.executeQuery();
                while (rs.next()) {
                    Order order = createOrderFromResultSet(rs);
                    listOrder.add(order);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public boolean updateOrder(int orderId, int newStatusId) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = ConnectDB.getConnection();
            if (con != null) {
                String sql = "UPDATE [Laundry-Middle-Platform].[dbo].[Order] SET StOrderID = ? WHERE OrderID = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, newStatusId);
                ps.setInt(2, orderId);

                int row = ps.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }

        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean updateDateApprove(int orderId, Date dateApprove) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = ConnectDB.getConnection();

            if (con != null) {
                String sql = "UPDATE [Laundry-Middle-Platform].[dbo].[Order] SET DateApprove = ? WHERE OrderID = ?";
                ps = con.prepareStatement(sql);
                ps.setDate(1, dateApprove);
                ps.setInt(2, orderId);

                // Thực hiện truy vấn UPDATE
                int row = ps.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }

        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

}
