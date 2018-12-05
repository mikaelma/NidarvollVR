using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

    void Update()
    {
        var x = Input.GetAxis("Horizontal") * Time.deltaTime * 3.0f;
        var z = Input.GetAxis("Vertical") * Time.deltaTime * 3.0f;

        //transform.Rotate(0, x, 0);
        Vector3 goingTo = transform.position + Camera.main.transform.forward * 3.0f * Time.deltaTime * Input.GetAxis("Vertical");
        Vector3 temp = new Vector3(goingTo.x, 1.6f, goingTo.z);
        transform.position = temp;
    }
}
