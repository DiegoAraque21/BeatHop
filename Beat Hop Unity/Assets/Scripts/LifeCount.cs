using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LifeCount : MonoBehaviour
{   
    public GameOverScreen GameOverScreen;
    public LevelCompletedScreen LevelCompletedScreen;

    public LevelScript LevelScript;
    public Image[] lives;
    public int livesRemaining;
    public int tries;

    public void LoseLife(){
        livesRemaining--;
        lives[livesRemaining].enabled = false;

        // Lives are 0 === LOSE
        if(livesRemaining == 0){
            tries ++;
            GameOverScreen.Setup();
            Time.timeScale = 0f;
            AudioSource[] audios = FindObjectsOfType<AudioSource>();
            foreach(AudioSource a in audios)
            {
                a.Pause();
            }
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

        if (col.gameObject.tag == "FinishLine"){
            
            LevelScript.Pass();
            LevelCompletedScreen.Setup(livesRemaining);
            Time.timeScale = 0f;
            AudioSource[] audios = FindObjectsOfType<AudioSource>();
            foreach(AudioSource a in audios)
            {
                a.Pause();
            }
        }
     }

    // void OnTriggerEnter2D(Collider2D col) {
      
    // }
}
