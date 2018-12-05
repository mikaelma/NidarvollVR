using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShowMenu : MonoBehaviour {
    Camera mainCamera;
    private GameObject menuCanvas;
    public double angle;

	// Use this for initialization
	void Start () {
        menuCanvas = GameObject.Find("Canvas");
        menuCanvas.SetActive(false);
        mainCamera = Camera.main;
        mainCamera.enabled = true;

    }

    // Update is called once per frame
    void Update () {
    
        angle = double.Parse(mainCamera.transform.eulerAngles.x.ToString());
        if (angle >= 25.0 && angle <= 50.0 ){
            menuCanvas.SetActive(true);
        }
        else
        {
            menuCanvas.SetActive(false);
        }
    }
}
