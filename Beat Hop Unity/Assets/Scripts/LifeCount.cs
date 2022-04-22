//Beat Hop Team
//Script for managing player lifes and other related funcitonalities

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
    public GameObject m_GotHitScreen;

    int tries = 1;
    
    public void LoseLife(){
        livesRemaining--;
        lives[livesRemaining].enabled = false;
        // Lives are 0 === LOSE
        if(livesRemaining == 0){
            {
                PlayerPrefs.SetInt("tries", PlayerPrefs.GetInt("tries") + 1);
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

    void gotHurt(){
        var color = m_GotHitScreen.GetComponent<Image>().color;
        color.a = 0.3f;

        m_GotHitScreen.GetComponent<Image>().color = color;
    }

     void OnTriggerEnter2D(Collider2D col) {
        if (col.gameObject.tag == "Obstacle"){
            LoseLife();
            gotHurt();
        }

        if (col.gameObject.tag == "FinishLine"){
            // LevelScript.Pass();
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

    void Update(){
        if(m_GotHitScreen != null){
            if(m_GotHitScreen.GetComponent<Image>().color.a > 0){
                var color = m_GotHitScreen.GetComponent<Image>().color;
                color.a -= 0.01f;
                m_GotHitScreen.GetComponent<Image>().color = color;
            }
        }
    }
    // void OnTriggerEnter2D(Collider2D col) {
      
    // }
}
