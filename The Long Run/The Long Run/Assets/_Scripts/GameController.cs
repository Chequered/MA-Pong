using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GameController : MonoBehaviour
{
	public static GameController GC;

	private List<GameObject> walls = new List<GameObject>();

	private void Awake()
	{
		GC = this;
	}

	private void Start()
	{
		GameObject[] _walls = GameObject.FindGameObjectsWithTag("Wall");
		for(int i = 0; i < _walls.Length; i ++)
		{
			walls.Add(_walls[i]);
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
	}
}

