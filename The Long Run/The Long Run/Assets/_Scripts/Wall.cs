using UnityEngine;
using System.Collections;

public class Wall : MonoBehaviour
{
	[SerializeField]
	private float health;
	private float totalhealth;

	public GameObject healthBar;

	private void Start()
	{
		totalhealth = health;
		healthBar.GetComponent<Healthbar>().SetHealth(health);
	}

	public float GetHealth()
	{
		return health;
	}

	private void Update()
	{
		healthBar.GetComponent<Healthbar>().UpdatePosition(transform.position);
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
		healthBar.GetComponent<Healthbar>().UpdateBar(health);
	}

	public void Rebuild()
	{
		this.health = totalhealth;
		healthBar.GetComponent<Healthbar>().UpdateBar(health);
	}
}