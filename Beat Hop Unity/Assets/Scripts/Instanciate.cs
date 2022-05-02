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
        screenBounds = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));
        StartCoroutine(prefabStart());
    }
    private void spawn(){
       
        
        screenBounds2 = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));
        GameObject a = Instantiate(prefab) as GameObject;
        
        a.transform.position = new Vector2(screenBounds2.x +10, screenBounds2.y - Random.Range(1,5));
        
    }
     private void spawn2(){
       
        
        screenBounds2 = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));
        
        GameObject b = Instantiate(prefab2) as GameObject;
        
        b.transform.position = new Vector2(screenBounds2.x +10, screenBounds2.y - Random.Range(1, 6));
    }

    IEnumerator prefabStart(){
        while(true){
            yield return new WaitForSeconds(respawnTime);
            spawn();
            spawn2();
        }
    }
}