using System.Collections;
using System.Collections.Generic;
using System.Data;
using UnityEngine;
using MySql.Data.MySqlClient;

public class DatabaseMethods : MonoBehaviour {

    //TODO: Have to find a useful way of returning the information so we can use it. Stringtable maybe? Or other matix?
    //Take a look at this:
    //https://docs.microsoft.com/en-us/dotnet/api/system.data.datatable?view=netframework-4.7.2

    /*
    public void GetAllMaterials(MySqlConnection dbconnection)
    {
        //Query from all_materials.sql
        //Author: Eirik Resch
        string query = "SELECT m.idmaterials, m.name, m.dataType, m.sourceType, m.dataYear, " +
            "m.FU, m.EEf_A1A3, m.density, m.RSL, m.comments, mc.materialCat, l.country, l.city" +
            " FROM materials m" +
            " LEFT JOIN materialcat mc ON mc.idmaterialCat = m.idmaterialCat" +
            " LEFT JOIN location l ON l.idlocation = m.idlocationproduction;";

        var command = new MySqlCommand(query, dbconnection);

        var reader = command.ExecuteReader();

        Debug.Log("Getting all materials: ");
        while (reader.Read())
        {
            Debug.Log(reader[0] + " : " + reader[1] + " : " + reader[2] + " : " + reader[3] + " : " + 
                      reader[4] + " : " + reader[5] + " : " + reader[6] + " : " + reader[7] + " : " + 
                      reader[8] + " : " + reader[9] + " : " + reader[10] + " : " + reader[11] + " : " + reader[12]);
        }

        Debug.Log("Done!");

        reader.Close();
    }*/

    //This method finds the emissions from a building(idBuilding) and the specified levels(idLevel). 
    //Uses the level hierarchy inside levels.sql, and finds all the children of a specified level. 
    public DataTable GetLevelEmissionFromStructure(MySqlConnection dbconnection, string idBuilding, string idLevel){

        string query = string.Format(
            "SELECT buildingElements.idbuildings, buildingElements.idLevels, buildingElements.A1A3, levels.name, levels.idparent " +
            "FROM buildingElements LEFT JOIN levels ON buildingElements.idLevels = levels.idlevels WHERE idbuildings={0} AND idparent = {1}"
            , idBuilding, idLevel);

       return FillTableWithResult(dbconnection, query);

    }

    //This method finds the emission of one specific level. 
    public DataTable GetTotalEmissionFromStructure(MySqlConnection dbconnection, string idBuilding, string idLevel)
    {
        string query = string.Format("SELECT * FROM buildingElements be WHERE idbuildings={0} AND idlevels ={1};", idBuilding, idLevel);

        return FillTableWithResult(dbconnection, query);

    }


    public DataTable GetGeneralInfo(MySqlConnection dbconnection, string BuildingIdentifier){
        string query = string.Format("select * from buildings AS b where b.building_identifier = '{0}'", BuildingIdentifier);

        return FillTableWithResult(dbconnection, query);

    }

    public DataTable GetQuantityMaterialsForLevel(MySqlConnection dbconnection, string idBuilding, string idLevel){

        string query = string.Format("SELECT buildingElements.idbuildings, buildingElements.idlevels, materialInventory.quantity, materialCat.materialCat, levels.name " +
            "FROM buildingElements " +
            "LEFT JOIN materialInventory ON buildingElements.idbuilding_elements = materialInventory.idbuilding_elements " +
            "LEFT JOIN materials ON materialInventory.idmaterials = materials.idmaterials " +
            "LEFT JOIN materialCat ON materials.idmaterialCat = materialCat.idmaterialCat " +
            "LEFT JOIN levels ON buildingElements.idlevels = levels.idlevels " +
            "WHERE buildingElements.idbuildings = {0} AND levels.idparent = {1};", idBuilding, idLevel);
            
        return FillTableWithResult(dbconnection, query);

    }
    public DataTable GetEmissionAllMaterials(MySqlConnection dbconnection, string buildingIdentifier){

        string query = 
            "SELECT mc.materialcat, count(distinct(b.idbuildings)), sum(mi.A1A3) as sumA1A3," +
            "SUM(mi.quantity*m.density/b.floor_area)/count(distinct(b.idbuildings)) AS Qi, " +
            "MAX(mi.quantity*m.density/b.floor_area) AS QiMAX, " +
            "MIN(mi.quantity*m.density/b.floor_area) AS QiMIN, " +
            "SUM(mi.quantity*m.density*m.EEf_A1A3)/SUM(mi.quantity*m.density) AS Fi," +
            "MAX(m.EEf_A1A3) AS FiMAX," +
            "MIN(m.EEf_A1A3) AS FiMIN," +
            "SUM(mi.quantity*m.density*(b.lifetime/mi.RSL_mi-1))/SUM(mi.quantity*m.density) AS Li," +
            "MAX(b.lifetime / mi.RSL_mi - 1) AS LiMAX," +
            "MIN(b.lifetime / mi.RSL_mi - 1) AS LiMIN " +
            "FROM materialinventory mi " +
            "JOIN materials m on m.idmaterials = mi.idmaterials " +
            "JOIN materialcat mc on mc.idmaterialCat = m.idmaterialCat " +
            "JOIN buildingelements be on be.idbuilding_elements = mi.idbuilding_elements " +
            "JOIN buildings b on b.idbuildings = be.idbuildings " +
            "where b.building_identifier LIKE 'R003' " +
            "group by mc.materialcat order by sumA1A3 desc";


        return FillTableWithResult(dbconnection, query);

    }

    public DataTable GetTotalMassOfBuilding(MySqlConnection dbconnection, string buildingId){
        string query = string.Format(
        "SELECT b.building_identifier,b.building_name,be.idbuildings, " +
            "SUM(mi.quantity * m.density) / 1000 as Mass_tonn " +
            "FROM materialinventory mi " +
            "JOIN materials m ON mi.idmaterials = m.idmaterials " +
            "JOIN buildingelements be ON be.idbuilding_elements = mi.idbuilding_elements " +
            "JOIN materialcat mc ON m.idmaterialCat = mc.idmaterialCat " +
            "JOIN buildings b ON b.idbuildings = be.idbuildings WHERE be.idbuildings = {0} " +
            "GROUP BY b.building_identifier;", buildingId);

        return FillTableWithResult(dbconnection, query);
    }

    public DataTable GetMassOfLevel(MySqlConnection dbconnection, string buildingId, string idLevel)
    {
        string query = string.Format(
        "SELECT b.building_identifier, b.building_name, be.idbuildings, l.idlevels, " +
            "SUM(mi.quantity * m.density) / 1000 as Mass_tonn " +
            "FROM materialinventory mi " +
            "JOIN materials m ON mi.idmaterials = m.idmaterials " +
            "JOIN buildingelements be ON be.idbuilding_elements = mi.idbuilding_elements " +
            "JOIN materialcat mc ON m.idmaterialCat = mc.idmaterialCat " +
            "JOIN levels l ON l.idlevels = be.idlevels " +
            "JOIN buildings b ON b.idbuildings = be.idbuildings " +
            "where be.idbuildings = {0} and l.idparent = {1} " +
            "GROUP BY l.idlevels; ", buildingId, idLevel);

        return FillTableWithResult(dbconnection, query);
    }

    public DataTable FillTableWithResult(MySqlConnection dbconnection, string query){
        var command = new MySqlCommand(query, dbconnection);

        MySqlDataAdapter adapter = new MySqlDataAdapter(command);

        DataTable result = new DataTable();

        adapter.Fill(result);

        return result;
    }

}
