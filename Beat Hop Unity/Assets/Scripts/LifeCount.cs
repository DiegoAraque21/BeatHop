//Beat Hop Team
//Script for managing player lifes and other related functionalities

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Networking;
using UnityEngine.SceneManagement;



public class LifeCount : MonoBehaviour
{   

    int idUserr;

    [SerializeField] string url;
    public class GameRunData
    {
        
        public int idUser;
        public int idLevel;
        public float score;
        public int deaths;
        public int tries;
    }

    //idLevel, tries, deaths, score 
     public class LevelData
    {
        public int idLevel;
        public float score;
        public int tries;
        public int deaths;
    }

    public GameOverScreen GameOverScreen;
    public LevelCompletedScreen LevelCompletedScreen;

    public LevelScript LevelScript;
    public Image[] lives;
    public int livesRemaining;
    public GameObject m_GotHitScreen;

    int tries = 1;
    
    //Method that handles all events related to the player losing a life
    public void LoseLife(){
        livesRemaining--;
        lives[livesRemaining].enabled = false;
        // Lives are 0 === LOSE
        if(livesRemaining == 0){
            {
                string key = "tries" + PlayerPrefs.GetInt("userId");
                PlayerPrefs.SetInt(key, PlayerPrefs.GetInt(key) + 1);
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

    //Method that triggers Loose Life method on colission
    void OnCollisionEnter2D(Collision2D col){
        if (col.gameObject.tag == "Obstacle"){
            LoseLife();
        }
    }

    //Method for showing players damage
    void gotHurt(){
        var color = m_GotHitScreen.GetComponent<Image>().color;
        color.a = 0.3f;

        m_GotHitScreen.GetComponent<Image>().color = color;
    }

    //Method that triggers Loose Life method on colission and triggers level completed 
    //screen when the level is completed
     void OnTriggerEnter2D(Collider2D col) {
        if (col.gameObject.tag == "Obstacle"){
            LoseLife();
            gotHurt();
        }

        if (col.gameObject.tag == "FinishLine"){


            // LevelScript.Pass();
            string key = "tries" + PlayerPrefs.GetInt("userId");
            tries = PlayerPrefs.GetInt(key, tries);
            StartCoroutine(InsertGameData());
            StartCoroutine(UpdateLevelData());
            LevelCompletedScreen.Setup(livesRemaining, PlayerPrefs.GetInt(key));
            PlayerPrefs.SetInt(key, 1);
            Time.timeScale = 0f;
            AudioSource[] audios = FindObjectsOfType<AudioSource>();
            foreach(AudioSource a in audios)
            {
                a.Pause();
            }
        }
     }

    
    //Update game in function of its events
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

    IEnumerator InsertGameData()
    {
        string key = "tries" + PlayerPrefs.GetInt("userId");
        // Create the object to be sent as json
        // User testUser = new User();
        GameRunData gamerun = new GameRunData();
        gamerun.idUser = idUserr;

        Scene scene = SceneManager.GetActiveScene();
        switch(scene.name) 
        {
        case "Level1":
            // code block
            gamerun.idLevel = 4;
            break;
        case "Level2":
            // code block
            gamerun.idLevel = 14;
            break;
        case "Level3":
        gamerun.idLevel = 24;
            break;
        }
        gamerun.score = livesRemaining * 10;
        gamerun.deaths = 10 - livesRemaining;
        gamerun.tries = PlayerPrefs.GetInt(key);

        string jsonDataGameRun = JsonUtility.ToJson(gamerun);
        Debug.Log(jsonDataGameRun);
        
        UnityWebRequest www = UnityWebRequest.Put("https://beathop.herokuapp.com" + "/game/gamerun" , jsonDataGameRun);

        www.method = "POST";
        www.SetRequestHeader("Content-Type", "application/json");
        yield return www.SendWebRequest();

        if (www.result == UnityWebRequest.Result.Success) {
            Debug.Log("Response: " + www.downloadHandler.text);
        } else {
            Debug.Log("Error: " + www.error);
        }
    }

     IEnumerator UpdateLevelData()
    {
        string key = "tries" + PlayerPrefs.GetInt("userId");
    
        // Create the object to be sent as json
        // User testUser = new User();
        
        LevelData leveldata = new LevelData();

    
        Scene scene = SceneManager.GetActiveScene();
        switch(scene.name) 
        {
        case "Level1":
            // code block
            leveldata.idLevel = 4;
            break;
        case "Level2":
            // code block
            leveldata.idLevel = 14;
            break;
        case "Level3":
        leveldata.idLevel = 24;
            break;
        }

        leveldata.score = livesRemaining *10;
        leveldata.deaths = 10 - livesRemaining;
        leveldata.tries = PlayerPrefs.GetInt(key);

        string jsonDataLevelData = JsonUtility.ToJson(leveldata);
        Debug.Log(jsonDataLevelData);

        UnityWebRequest www = UnityWebRequest.Put("https://beathop.herokuapp.com" + "/game/level" , jsonDataLevelData);
        
        www.method = "PUT";
        www.SetRequestHeader("Content-Type", "application/json");
        yield return www.SendWebRequest();

        if (www.result == UnityWebRequest.Result.Success) {
            Debug.Log("Response put: " + www.downloadHandler.text);
        } else {
            Debug.Log("Error put: " + www.error);
        }
    }

    public void setIdUser(int idUser)
    {
        idUserr = idUser;
        PlayerPrefs.SetInt("userId", idUser);
    }

}
