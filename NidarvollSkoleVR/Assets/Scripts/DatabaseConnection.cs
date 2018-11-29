using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.Sql;
using MySql.Data;

using UnityEngine;

public class DatabaseConnection : MonoBehaviour {

    private string host = "localhost";
    private string database = "sondrlov_bLCAd";
    private string user = "sondrlov";
    private string password = "password";
    private DatabaseMethods dbm = new DatabaseMethods();
    private MySql.Data.MySqlClient.MySqlConnection mysqlConn;

    // Use this for initialization
    void Awake ()
    {
        string connectionString = "server=" + host + ";database=" + database + ";uid=" + user + ";pwd=" + password + ";";

        mysqlConn = new MySql.Data.MySqlClient.MySqlConnection(connectionString);
       
        mysqlConn.Open();

        //Testing method in DBMethods:
        //dbm.GetGeneralInfo(mysqlConn, "R001");
    }

    public MySql.Data.MySqlClient.MySqlConnection GetDBConnection(){
        return mysqlConn;
    }

}
