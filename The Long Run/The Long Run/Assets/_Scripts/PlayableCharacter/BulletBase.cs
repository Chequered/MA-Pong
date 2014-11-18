using UnityEngine;
using System.Collections;

public class BulletBase : MonoBehaviour {

	public float movementSpeed;
	public float lifeTime;
	private float damage;

	private void Start()
	{
		Invoke("DestroyMe", lifeTime);
	}

	private void Update()
	{
		transform.position += transform.forward * movementSpeed * Time.deltaTime;
	}

	private void DestroyMe()
	{
		Destroy(this.gameObject);
	}

	public void SetDamage(float _damage)
	{
		this.damage = _damage;
	}

	public float GetDamage()
	{
		return damage;
	}
}
