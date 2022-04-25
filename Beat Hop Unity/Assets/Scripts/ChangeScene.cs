//Beat Hop Team
//Script for changing scenes

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeScene : MonoBehaviour
{
    //Load Scene by name
    public void LoadScene(string sceneName)
    {  
        SceneManager.LoadScene(sceneName);
    }
}
