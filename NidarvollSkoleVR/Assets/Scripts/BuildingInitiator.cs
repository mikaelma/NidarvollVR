using System.Collections;
using System.Collections.Generic;
using System.Data;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class BuildingInitiator : MonoBehaviour {

    public GameObject database;
    private GameObject buildingNameGameObject;
    private DatabaseMethods dbm = new DatabaseMethods();

    private void Start()
    {
        buildingNameGameObject = GameObject.Find("BuildingName");
        //SetBuildingName();
    }

    private void SetBuildingName(){
        DataTable dbResult = dbm.GetGeneralInfo(database.GetComponent<DatabaseConnection>().GetDBConnection(), "R003");
        
        DataRow row = dbResult.Rows[0];
        
        var buildingName = row["building_name"].ToString();
        buildingNameGameObject.GetComponent<TextMeshPro>().SetText(buildingName); 
    }

}


