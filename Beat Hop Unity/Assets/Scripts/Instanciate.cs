//Script to instanciate flying objecst 


using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Instanciate : MonoBehaviour {
    public GameObject prefab;
    public GameObject prefab2;
    public float respawnTime = 10.0f;
    private Vector2 screenBounds;
    private Vector2 screenBounds2;
   
     
    // Use this for initialization
    void Start () {
        //get current screen bounds
        screenBounds = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));
        
        StartCoroutine(prefabStart());
    }

    //spawn first flying object
    private void spawn(){
       
        //update screen bounds
        screenBounds2 = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));
       //instanciate object
        GameObject a = Instantiate(prefab) as GameObject;
        //uodate object's position
        a.transform.position = new Vector2(screenBounds2.x +10, screenBounds2.y - Random.Range(1,5));
        
    }

    //spawn second flying object
     private void spawn2(){
       
       //update screen bounds 
        screenBounds2 = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));
        //instanciate object
        GameObject b = Instantiate(prefab2) as GameObject;
        //uodate object's position
        b.transform.position = new Vector2(screenBounds2.x +10, screenBounds2.y - Random.Range(1, 6));
    }

    IEnumerator prefabStart(){
        //Call the two spawn methods
        while(true){
            yield return new WaitForSeconds(respawnTime);
            spawn();
            spawn2();
        }
    }
}