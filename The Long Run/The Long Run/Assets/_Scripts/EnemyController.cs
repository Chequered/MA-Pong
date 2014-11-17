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
		transform.position = Vector3.MoveTowards (transform.position, target.position, walk);

		if (hp > 1) {
			Destroy(this.gameObject);
		}
	}
}
