using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class MolotovExplosion : MonoBehaviour {

	public float lifeTime;
	public float damage;

	private List<Material> materials = new List<Material>();
	private float damageCooldown;

	private void Start()
	{
		Renderer[] renders = GetComponentsInChildren<Renderer>();
		for(int i = 0; i < renders.Length; i++)
		{
			materials.Add(renders[i].material);
			Debug.Log(renders[i].material);
		}
	}

	private void Update()
	{
		if(lifeTime > 0)
		{
			lifeTime -= 0.05f;
		}else{
			FadeOut();
		}
		if(damageCooldown > 0)
		{
			damageCooldown -= 0.2f;
		}
	}

	private void OnTriggerStay(Collider coll)
	{
		if(coll.transform.tag == "Enemy" && damageCooldown <= 0)
		{
			coll.GetComponent<EnemyController>().TakeDamage(damage);
			damageCooldown = 10;
		}
	}

	private void FadeOut()
	{
		foreach(Material material in materials)
		{
			Color col = material.GetColor("_TintColor");
			col.a -= 0.005f;
			material.SetColor("_TintColor", col);
			Debug.Log(material.GetColor("_TintColor").a);
			if(col.a < -0.5f)
			{
				Destroy(this.gameObject);
			}
		}
	}
}
