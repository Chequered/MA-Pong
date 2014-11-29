using UnityEngine;
using System.Collections;

public class Wall : MonoBehaviour
{
	[SerializeField]
	public float health;
	private float totalhealth;

	public GameObject healthBar;
	public GameObject[] wallStates;

	private int currentWallState;
	private Healthbar _healthBar;

	private void Start()
	{
		currentWallState = 1;
		totalhealth = health;
		_healthBar = healthBar.GetComponent<Healthbar>();
		_healthBar.SetHealth(health);
	}

	public float GetHealth()
	{
		return health;
	}

	private void Update()
	{
		_healthBar.UpdatePosition(transform.position);
		if(Input.GetKeyDown(KeyCode.Q))
		{
			DoDamage(50);
		}
	}

	public void DoDamage(float damage)
	{
		this.health -= damage;
		if(this.health <= 0)
		{
			Destroy(this.gameObject);
		}
		if(this.health < this.totalhealth / 3 * (wallStates.Length - currentWallState))
		{
			foreach(GameObject wall in wallStates)
			{
				wall.gameObject.SetActive(false);
			}
			currentWallState++;
			wallStates[currentWallState - 1].gameObject.SetActive(true);
		}
		_healthBar.UpdateBar(health);
	}

	public void Rebuild()
	{
		this.health = totalhealth;
		_healthBar.UpdateBar(health);
	}
}