using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class flying : MonoBehaviour {
    public float speedMin = 5.0f;
    public float speedMax = 5.0f;
    private Rigidbody2D rb;
    private Vector2 screenBounds;
     private Vector2 screenBounds2;


    // Use this for initialization
    void Start () {
        
        rb = this.GetComponent<Rigidbody2D>();
        rb.velocity = new Vector2(-Random.Range(speedMin, speedMax), 0);
        screenBounds = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));

    }

    // Update is called once per frame
    void Update () {
        //  screenBounds2 = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));

        // if(transform.position.x < screenBounds2.x){
        //     Destroy(this.gameObject);
        // }
       
    }
    void OnTriggerEnter2D(Collider2D col)
       {
           if (col.gameObject.tag == "destroyLine")
           {
               Destroy(this.gameObject);
           }
       }
}