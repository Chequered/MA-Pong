using UnityEngine;
using System.Collections;

public class Data : MonoBehaviour
{
	public static Data prefabs;
	public GameObject bullet;
	public GameObject molotov;
	public GameObject molotovExplosion;
	public GameObject enemy_basic;

	private void Awake()
	{
		prefabs = this;
	}
}

