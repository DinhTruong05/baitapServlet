package org.example.baitap.models;

import org.example.baitap.dataBase.DBConnect;

import java.sql.Connection;

public class BaseModel {
    protected Connection conn = null;

    public BaseModel() {
        DBConnect dbConnect = new DBConnect();
        conn = dbConnect.getConnection();
    }
}
