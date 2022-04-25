//Beat Hop Team
//LevelCompleted Screen functionality

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class LevelCompletedScreen : MonoBehaviour
{
    // Start is called before the first frame update
    public Text livesText;


    //Make LevelCompleted screen pop up and show game data
    public void Setup(int lives, int tries)
    {   
        if(tries == 1){
            livesText.text = "with " + lives.ToString() + " lives in " + tries.ToString() + " try";
        } else{
            livesText.text = "with " + lives.ToString() + " lives in " + tries.ToString() + " tries";
        }
        gameObject.SetActive(true);
    }

    //Restart Level
    public void RestartButton()
    {
        // SceneManager.LoadScene("Level1");
        Time.timeScale = 1f;
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        
        
    }
    //Go to Main Menu
     public void ExitButton()
    {   Time.timeScale = 1f;
        SceneManager.LoadScene("Main menu");
        
    }

    //Go to next level
    public void NextLevelButton(string sceneName)
    {   Time.timeScale = 1f;
        SceneManager.LoadScene(sceneName);
    }
   
}
