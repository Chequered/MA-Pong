using UnityEngine;
using System.Collections;

public class MainMenuController : MonoBehaviour {
	
	private float normButtonWidth = 150;

	private int playerCount;
	private bool keyboard;

	private void Start()
	{
		playerCount = 1;
	}

	private void OnGUI()
	{
		if(GUI.Button(new Rect(Screen.width / 2 - normButtonWidth / 2, 150, normButtonWidth, 50), "Start"))
		{
			PlayerPrefs.SetInt("playerCount", playerCount);
			Application.LoadLevel("charSelect");
		}
		GUI.Label(new Rect(Screen.width / 2 - normButtonWidth / 2, 265, normButtonWidth, 50), "" + playerCount);
		GUI.Label(new Rect(Screen.width / 2 - normButtonWidth, 265, normButtonWidth, 50), "Players: ");
		if(GUI.Button(new Rect(Screen.width / 2 - normButtonWidth / 2 + 50, 230, normButtonWidth - 50, 50), "+1"))
		{
			if(playerCount < 4)
			{
				playerCount++;
			}
		}
		if(GUI.Button(new Rect(Screen.width / 2 - normButtonWidth / 2 + 50, 300, normButtonWidth - 50, 50), "-1"))
		{
			if(playerCount > 1)
			{
				playerCount--;
			}
		}
		if(Input.GetJoystickNames().Length > 0)
		{
			keyboard = GUI.Toggle(new Rect(300, 300, 150, 50), keyboard, "Use keyboard for player 1");
		}
	}
}
