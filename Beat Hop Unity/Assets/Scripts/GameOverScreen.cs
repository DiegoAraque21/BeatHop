//Beat Hop Team
//Game Over Scene funcionality

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameOverScreen : MonoBehaviour
{
    // Start is called before the first frame update


    public void Setup()
    {
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
   
}
