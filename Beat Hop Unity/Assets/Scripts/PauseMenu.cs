//Beat Hop Team
//Pause Menu functionality script

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PauseMenu : MonoBehaviour
{
    public static bool gameIsPaused = false;

    public GameObject pauseMenuUI;
    // Update is called once per frame

    //Trigger Resume and Pause methods when escape key is pressed
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            if(gameIsPaused){
                Resume();
            } else{
                Pause();
            }
        }
    }


    //Method for resuming the game
    public void Resume(){
        pauseMenuUI.SetActive(false);
        Time.timeScale = 1f;
        gameIsPaused = false;

        AudioSource[] audios = FindObjectsOfType<AudioSource>();

        foreach(AudioSource a in audios){
            a.Play();
        }
    }

    //Method for pausing the game
    void Pause(){
        pauseMenuUI.SetActive(true);
        Time.timeScale = 0f;
        gameIsPaused = true;

        AudioSource[] audios = FindObjectsOfType<AudioSource>();

        foreach(AudioSource a in audios){
            a.Pause();
        }
    }


    //Method for quitting the game (go to main menu)
    public void quitGame(){
        PlayerPrefs.SetInt("tries", 1);
        Time.timeScale = 1f;
        SceneManager.LoadScene("Main Menu");
    }

    
}
