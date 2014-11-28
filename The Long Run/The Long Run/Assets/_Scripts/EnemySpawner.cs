using UnityEngine;
using System.Collections;

public class EnemySpawner : MonoBehaviour {

	public int baseAmount;
	public float timePerWave;

	private int wave;
	private float timeUntilNext;
	private GameObject[] spawnPoints;


	private void Start()
	{
		wave = 1;
		spawnPoints = GameObject.FindGameObjectsWithTag("SpawnPoint");
		SpawnWave();
	}

	private void SpawnWave()
	{
		for(int i = 0; i <  WaveAmount(); i++)
		{
			Vector3 pos = GetSpawnPos();
			pos.x += Random.Range(-5, 5);
			Instantiate(Data.prefabs.enemy_basic, pos, Data.prefabs.enemy_basic.transform.rotation);
		}
		timeUntilNext = timePerWave;
	}

	private void Update()
	{
		if(timeUntilNext > 0)
		{
			timeUntilNext -= 0.02f;
		}else{
			SpawnWave();
		}
	}

	private Vector3 GetSpawnPos()
	{
		int r = Random.Range(0, spawnPoints.Length - 1);
		return spawnPoints[r].transform.position;
	}

	private int WaveAmount()
	{
		return (int) (baseAmount + (baseAmount * wave));
	}
}
