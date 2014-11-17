using UnityEngine;
using System.Collections;

public class Data : MonoBehaviour
{
	public static Data prefabs;
	public GameObject bulletPrefab;

	private void Awake()
	{
		prefabs = this;
	}
}

