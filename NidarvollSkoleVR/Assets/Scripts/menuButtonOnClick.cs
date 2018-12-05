using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class menuButtonOnClick : MonoBehaviour {
    public GameObject menuButton;

    // Use this for initialization
    void Start () {
        menuButton = GameObject.Find("MenuButton");


    }

    void TestOnClick(){
        Debug.Log("DEbug");
    }
}
