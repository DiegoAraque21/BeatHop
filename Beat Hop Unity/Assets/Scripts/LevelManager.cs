using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class LevelManager : MonoBehaviour
{
   int levelsUnlocked;

   public Button[] buttons;

    void Start()
    {
        levelsUnlocked = PlayerPrefs.GetInt("levelsUnlocked",1);

        // buttons.Length
        // for (int i = 0; i < buttons.Length; i++)
        // {
        //     buttons[i].interactable = true;
        // }   
        //comment below loop to block levels again
        
    }

public void LoadLevel(int levelIndex )
{
    SceneManager.LoadScene(levelIndex);
}

}
