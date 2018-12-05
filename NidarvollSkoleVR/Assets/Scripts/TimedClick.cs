using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TimedClick : MonoBehaviour {

    private float startTime;
    public float elapsedTime;
    public float targetTime;
    public Transform RadialProgress;
    private float fillAmount = 0f;
    private Renderer renderer;

	// Use this for initialization
	void Start () {

        startTime = -1f;
        if (targetTime == 0f) targetTime = 2f;
        RadialProgress.GetComponent<Image>().fillAmount = fillAmount;
        renderer = GetComponent<Renderer>();
		
	}
	
	// Update is called once per frame
	void Update () {

        elapsedTime += Time.deltaTime;

        fillAmount = elapsedTime / targetTime;

        RadialProgress.GetComponent<Image>().fillAmount = fillAmount;

        if (elapsedTime >= targetTime){
            elapsedTime = targetTime;
            renderer.material.color = new Color(0f, 0f, 1f);
            Debug.Log("FIRING FUNCTION!");
        }
		
	}

    public void resetTimer(){
        elapsedTime = 0f;
        fillAmount = 0f;
        RadialProgress.GetComponent<Image>().fillAmount = fillAmount;
        renderer.material.color = new Color(1f, 0f, 1f);
    }   
}
