using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class LevelCompletedScreen : MonoBehaviour
{
    // Start is called before the first frame update
    public Text livesText;

    public void Setup(int lives, int tries)
    {   
        if(tries == 1){
            livesText.text = "with " + lives.ToString() + " lives in " + tries.ToString() + " try";
        } else{
            livesText.text = "with " + lives.ToString() + " lives in " + tries.ToString() + " tries";
        }
        gameObject.SetActive(true);
    }

    public void RestartButton()
    {
        // SceneManager.LoadScene("Level1");
        Time.timeScale = 1f;
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        
        
    }

     public void ExitButton()
    {   Time.timeScale = 1f;
        SceneManager.LoadScene("Main menu");
        
    }

    public void NextLevelButton(string sceneName)
    {   Time.timeScale = 1f;
        SceneManager.LoadScene(sceneName);
    }
   
}
