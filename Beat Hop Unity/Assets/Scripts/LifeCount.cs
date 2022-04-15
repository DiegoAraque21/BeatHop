using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LifeCount : MonoBehaviour
{
    public Image[] lives;
    public int livesRemaining;

    public void LoseLife(){
        livesRemaining--;
        lives[livesRemaining].enabled = false;

        // Lives are 0 === LOSE
        if(livesRemaining == 0){
            Debug.Log("You lost");
        }
    }


    void OnCollisionEnter2D(Collision2D col){
        if (col.gameObject.tag == "Obstacle"){
            LoseLife();
        }
    }

    void OnTriggerEnter2D(Collider2D col) {
        if (col.gameObject.tag == "Obstacle"){
            LoseLife();
        }
    }
}
