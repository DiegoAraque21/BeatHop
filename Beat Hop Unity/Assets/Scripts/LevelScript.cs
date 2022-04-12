using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class LevelScript : MonoBehaviour
{
    public void Pass()
    {
    //     int currentLevel = SceneManager.GetActiveScene().buildIndex -1;
    //     if(currentLevel >= PlayerPrefs.GetInt("levelsUnlocked"))
    // {
    //     PlayerPrefs.SetInt("levelsUnlocked", currentLevel+1);
    // }
   PlayerPrefs.SetInt("levelsUnlocked",1);
    
     Debug.Log("LEVEL " + PlayerPrefs.GetInt("levelsUnlocked")+" UNLOCKED");
    }

   

    
  
}
