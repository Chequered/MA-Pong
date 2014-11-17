using UnityEngine;
using System.Collections;

public class BulletBase : MonoBehaviour {

	public float movementSpeed;
	public float lifeTime;

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
}
