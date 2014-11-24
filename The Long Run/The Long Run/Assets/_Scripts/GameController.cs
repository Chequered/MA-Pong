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

