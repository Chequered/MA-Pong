using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class CharSelectController : MonoBehaviour {

	private int playerCount;
	private int playersDone = 0;

	private float charWidth;
	private float charHeight = 300;

	private bool allPlayersDone;

	private List<Character> characters = new List<Character>();

	private void Start()
	{
		playerCount = PlayerPrefs.GetInt("playerCount");

		Character castro = new Character(Data.prefabs.preview_Castro, Data.prefabs.preview_Castro_taken,"Fidel Castro", "DESC");
		Character stalin = new Character(Data.prefabs.preview_Stalin, Data.prefabs.preview_Stalin_taken,"Joseph Stalin", "DESC");
		Character lenin = new Character(Data.prefabs.preview_Lenin, Data.prefabs.preview_Lenin_taken,"Vladimir Lenin", "DESC");

		characters.Add(castro);
		characters.Add(stalin);
		characters.Add(lenin);	

		charWidth = Screen.width / (characters.Count + 0.5f);
	}

	private void OnGUI()
	{
		for(int i = 0; i < characters.Count; i++)
		{ //Screen.width / characters.Count - charWidth * i, Screen.height / 2 - charHeight / 2, charWidth
			GUI.DrawTexture(new Rect( i * charWidth + 50, Screen.height / 2 - charHeight / 2 - 50, charWidth, charHeight), characters[i].GetPreviewImg());
			GUI.Label(new Rect((i * charWidth + 50) + charWidth / 2 - characters[i].GetName().Length * 2, Screen.height / 2 + charHeight / 2 - 50, charWidth, charHeight), characters[i].GetName());
			if(!allPlayersDone)
			{
				if(GUI.Button(new Rect((i * charWidth + 50) + charWidth / 2 - characters[i].GetName().Length * 2, Screen.height / 2 + charHeight / 2 - 30, 100, 50), "Select"))
				{
					if(!characters[i].IsSelected())
					{
						characters[i].Select(playersDone + 1);
						playersDone++;
						if(playersDone >= playerCount)
						{
							allPlayersDone = true;
						}
					}
				}
			}
		}
		if(allPlayersDone)
		{
			if(GUI.Button(new Rect(Screen.width / 2 - 70 + 70, Screen.height - 100, 100, 40), "Start"))
			{
				Application.LoadLevel("game");
				PlayerPrefs.DeleteAll();
				for(int i = 0; i < characters.Count; i++)
				{
					if(characters[i].IsSelected())
					{
						PlayerPrefs.SetString("" + characters[i].GetID(), characters[i].GetName());
					}
						
				}
			}
			if(GUI.Button(new Rect(Screen.width / 2 - 70 - 70, Screen.height - 100, 100, 40), "Clear"))
			{
				Application.LoadLevel("charSelect");
				PlayerPrefs.SetString("p1Keyboard", PlayerPrefs.GetString("p1Keyboard"));
			}
		}else{
			GUI.Label(new Rect(Screen.width / 2 - 300 / 2, 25, 300, 50), "Player " + (playersDone + 1) + "/" + playerCount +" Select a character");
		}
	}
}
