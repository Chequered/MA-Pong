using UnityEngine;
using System.Collections;

public class Data : MonoBehaviour
{
	public static Data prefabs;
	public GameObject bullet;
	public GameObject molotov;
	public GameObject molotovExplosion;
	public GameObject enemy_basic;

	public GameObject player_Castro;
	public GameObject player_Stalin;
	public GameObject player_Lenin;
	public GameObject player_Un;

	public Texture preview_Castro;
	public Texture preview_Stalin;
	public Texture preview_Lenin;

	public Texture preview_Castro_taken;
	public Texture preview_Stalin_taken;
	public Texture preview_Lenin_taken;

	private void Awake()
	{
		prefabs = this;
	}
}

