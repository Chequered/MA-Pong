using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GameController : MonoBehaviour
{
	public static GameController GC;

	private List<GameObject> walls = new List<GameObject>();
	private List<GameObject> players = new List<GameObject>();

	private GameObject[] playerSpawnPoints;

	private void Awake()
	{
		GC = this;
	}

	private void Start()
	{
		GameObject[] _walls = GameObject.FindGameObjectsWithTag("Wall");
		playerSpawnPoints = GameObject.FindGameObjectsWithTag("Player SpawnPoint");

		for(int i = 0; i < _walls.Length; i ++)
		{
			walls.Add(_walls[i]);
		}
		for(int i = 0; i < 4; i++)
		{
			if(PlayerPrefs.HasKey("" + (i + 1)))
			{
				if(PlayerPrefs.GetString("" + (i + 1)) == "Fidel Castro")
				{
					GameObject player = Instantiate(Data.prefabs.player_Castro, playerSpawnPoints[i].transform.position, Data.prefabs.player_Castro.transform.rotation) as GameObject;
					player.GetComponent<PlayerReference>().player.GetComponent<PlayerBase>().SetID(i + 1);
					player.GetComponent<PlayerReference>().player.GetComponent<PlayerBase>().SetCharacter(GameCharacter.Castro);
				}
				if(PlayerPrefs.GetString("" + (i + 1)) == "Joseph Stalin")
				{
					GameObject player = Instantiate(Data.prefabs.player_Stalin, playerSpawnPoints[i].transform.position, Data.prefabs.player_Stalin.transform.rotation) as GameObject;
					player.GetComponent<PlayerReference>().player.GetComponent<PlayerBase>().SetID(i + 1);
					player.GetComponent<PlayerReference>().player.GetComponent<PlayerBase>().SetCharacter(GameCharacter.Stalin);
				}
				if(PlayerPrefs.GetString("" + (i + 1)) == "Vladimir Lenin")
				{
					GameObject player = Instantiate(Data.prefabs.player_Lenin, playerSpawnPoints[i].transform.position, Data.prefabs.player_Lenin.transform.rotation) as GameObject;
					player.GetComponent<PlayerReference>().player.GetComponent<PlayerBase>().SetID(i + 1);
					player.GetComponent<PlayerReference>().player.GetComponent<PlayerBase>().SetCharacter(GameCharacter.Lenin);
				}
			}
		}
	}

	public void UseItem(GameObject player, ItemType item)
	{
		if(item == ItemType.Buildpack)
		{
			foreach(GameObject wall in walls)
			{
				wall.GetComponent<Wall>().Rebuild();
			}
		}
		if(item == ItemType.Molotov)
		{
			GameObject molotov = Instantiate(Data.prefabs.molotov, player.transform.position, player.transform.localRotation)as GameObject;
			molotov.GetComponent<MolotovController>().SetTarget(GetMousePos());
		}

		player.GetComponent<PlayerBase>().RemoveItem();
	}

	private Vector3 GetMousePos()
	{
		RaycastHit hit;
		Ray ray;
		
		ray = Camera.main.ScreenPointToRay(Input.mousePosition);
		if(Physics.Raycast(ray, out hit))
		{
			return hit.point;
		}
		return Vector3.zero;
	}
}

