using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using System.Data;


public class OnClick : MonoBehaviour {
    public string idLevel;
    public string structureName; 
    private string buildingId = "10";
    private string information;

    public GameObject database;
    private DatabaseMethods dbm = new DatabaseMethods();
    private GameObject levelEmissionGameObject;
    private GameObject materialEmissionGameObject;
    private GameObject totalMassGameObject;


    private void Start()
    {
        levelEmissionGameObject = GameObject.Find("LevelEmissionInfo");
        materialEmissionGameObject = GameObject.Find("MaterialEmissionInfo");
        totalMassGameObject = GameObject.Find("TotalMass");
    }

    public void OnMouseDown() 
    {
        information = structureName + ": \n";
        levelEmissionGameObject.GetComponent<TextMeshPro>().SetText(information + GetLevelEmissionFromDB() + GetTotalEmissionFromDB());
        materialEmissionGameObject.GetComponent<TextMeshPro>().SetText(GetMaterialForLevel());
        totalMassGameObject.GetComponent<TextMeshPro>().SetText(GetLevelMass()+ CalculateMassImportance() + CalculateEmissionImportance());

    }

    public string GetTotalEmissionFromDB(){
        DataTable totalResult = dbm.GetTotalEmissionFromStructure(database.GetComponent<DatabaseConnection>().GetDBConnection(), buildingId, idLevel);
        DataRow totalRow = totalResult.Rows[0];
        double totalEmission = double.Parse(totalRow["A1A3"].ToString());
        string total = "\n" + totalEmission.ToString("0.00") + "\tTotal emission";

        return total;
    }

    public string GetLevelEmissionFromDB(){
        string levelEm = "";
        DataTable dbResult = dbm.GetLevelEmissionFromStructure(database.GetComponent<DatabaseConnection>().GetDBConnection(), buildingId, idLevel);
        foreach (DataRow row in dbResult.Rows)
        {

            double tempEmission = double.Parse(row["A1A3"].ToString());
            levelEm += tempEmission.ToString("0.00") + " kgCO2\t" + row["name"] + "\n" ;
        }

        return levelEm;

    }

    public string GetMaterialForLevel()
    {
        string materials = "Material emission: \n";
        DataTable dbResult = dbm.GetQuantityMaterialsForLevel(database.GetComponent<DatabaseConnection>().GetDBConnection(), buildingId, idLevel);

        foreach (DataRow row in dbResult.Rows)
        {
            double tempMaterials = double.Parse(row["quantity"].ToString());
            materials += row["name"] + "\n" + tempMaterials.ToString("0.00") + " kgCO2\t" + row["materialcat"] + "\n";
        }
        return materials;

    }

    public string GetLevelMass(){
        string mass = structureName + ": ";
        double sum = 0.0;

        DataTable dbResult = dbm.GetMassOfLevel(database.GetComponent<DatabaseConnection>().GetDBConnection(), buildingId, idLevel);

         foreach (DataRow row in dbResult.Rows)
         {
             double tempMass = double.Parse(row["Mass_tonn"].ToString());
             sum += tempMass;
         }
        return mass += sum.ToString("0.00") + "t\n";
    }

    public string CalculateMassImportance(){
        double levelTotal = 0.0;
        DataTable getMassLevel = dbm.GetMassOfLevel(database.GetComponent<DatabaseConnection>().GetDBConnection(), buildingId, idLevel);
        foreach (DataRow massLevelRow in getMassLevel.Rows)
        {
            double tempMass = double.Parse(massLevelRow["Mass_tonn"].ToString());
            levelTotal += tempMass;
        }

        DataTable getMassTotal = dbm.GetTotalMassOfBuilding(database.GetComponent<DatabaseConnection>().GetDBConnection(), buildingId);
        DataRow massTotalRow = getMassTotal.Rows[0];
        double total = double.Parse(massTotalRow["Mass_tonn"].ToString());

        string importance = (levelTotal / total * 100).ToString("0.00");
        return importance + "% of the building mass\n";
    }

    public string CalculateEmissionImportance(){
        DataTable totalResult = dbm.GetTotalEmissionFromStructure(database.GetComponent<DatabaseConnection>().GetDBConnection(), buildingId, "0");
        DataRow totalRow = totalResult.Rows[0];
        double totalEmission = double.Parse(totalRow["A1A3"].ToString());

        double levelTotal = 0.0;
        DataTable levelEmission = dbm.GetLevelEmissionFromStructure(database.GetComponent<DatabaseConnection>().GetDBConnection(), buildingId, idLevel);
        foreach (DataRow row in levelEmission.Rows)
        {
            double tempEmission = double.Parse(row["A1A3"].ToString());
            levelTotal += tempEmission;
        }

        string emissionImportance = (levelTotal / totalEmission * 100).ToString("0.00");
        return emissionImportance + "% of the emission";

    }
}
