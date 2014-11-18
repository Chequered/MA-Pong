using UnityEngine;
using System.Collections;

public class Wall : MonoBehaviour
{
	[SerializeField]
	private float health;
	private float totalhealth;

	private void Start()
	{
		totalhealth = health;
	}

	public float GetHealth()
	{
		return health;
	}

	public void DoDamage(float damage)
	{
		this.health -= damage;
	}

	public void Rebuild()
	{
		this.health = totalhealth;
	}
}