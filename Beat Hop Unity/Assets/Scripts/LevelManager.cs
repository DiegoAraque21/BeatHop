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
        for (int i = 1; i < buttons.Length; i++)
        {
            buttons[i].interactable = false;
        }

        for (int i = 0; i < levelsUnlocked; i++)
        {
            buttons[i].interactable = true;
        }
    }

public void LoadLevel(int levelIndex )
{
    SceneManager.LoadScene(levelIndex);
}

}
