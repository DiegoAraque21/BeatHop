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

    private void Update(){
        if(Input.GetKeyDown(KeyCode.Return)){
            LoseLife();
        }
    }
}
