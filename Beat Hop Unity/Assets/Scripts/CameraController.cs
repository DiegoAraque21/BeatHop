//Beat Hop Team
//Script to Control Camera

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    public GameObject player;
   
    float x;
    float y;

    float z;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {   x = player.transform.position.x ;
        y  = transform.position.y;
        z = transform.position.z;
        x = x +5;
        transform.position = new Vector3(x, y, z);
    }
}


