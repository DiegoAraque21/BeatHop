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

    int tries = 1;
    
    public void LoseLife(){
        livesRemaining--;
        lives[livesRemaining].enabled = false;
        // Lives are 0 === LOSE
        if(livesRemaining == 0){
            {
                PlayerPrefs.SetInt("tries", tries+1);
            }
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
            tries = PlayerPrefs.GetInt("tries", tries);
            LevelCompletedScreen.Setup(livesRemaining, PlayerPrefs.GetInt("tries"));
            PlayerPrefs.SetInt("tries", 1);
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
