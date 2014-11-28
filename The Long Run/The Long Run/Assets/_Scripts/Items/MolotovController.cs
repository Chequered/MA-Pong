using UnityEngine;
using System.Collections;

public class MolotovController : MonoBehaviour {

	public float maxLifeTime;
	public float movementSpeed;

	private Vector3 target;

	private void Start()
	{
		Invoke("Explode", maxLifeTime);
	}

	public void Update()
	{
		this.transform.position = Vector3.MoveTowards(transform.position, target, movementSpeed * Time.deltaTime);
		if(this.transform.position == target)
		{
			Explode ();
		}
	}

	public void SetTarget(Vector3 pos)
	{
		target = pos;
	}

	private void Explode()
	{
		Debug.Log("using item");
		Instantiate(Data.prefabs.molotovExplosion, transform.position, Data.prefabs.molotovExplosion.transform.rotation);
		Destroy(this.gameObject);
	}
}
