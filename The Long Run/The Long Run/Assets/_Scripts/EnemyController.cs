using UnityEngine;
using System.Collections;

public class EnemyController : MonoBehaviour {

	public Transform target;
	public float speed;
	public float hp;
	public float damage;

	void Start () {
	
	}

	void Update () {
		float walk = speed * Time.deltaTime;
		transform.parent.transform.position = Vector3.MoveTowards (transform.position, target.position, walk);
	}

	void OnTriggerEnter(Collider coll)
	{
		Debug.Log(coll.tag);
		if(coll.transform.tag == "Bullet")
		{
			this.hp -= coll.GetComponent<BulletBase>().GetDamage();
			Destroy(coll.gameObject);
			
			if (hp < 1) {
				Destroy(this.gameObject);
			}
		}
	}
}
