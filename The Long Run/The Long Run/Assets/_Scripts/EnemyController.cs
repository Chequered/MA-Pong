using UnityEngine;
using System.Collections;

public class EnemyController : MonoBehaviour {

	public GameObject healthBar;
	public Transform target;
	public float speed;
	public float hp;
	public float damage;

	void Start () {
		healthBar.GetComponent<Healthbar>().SetHealth(hp);
	}

	void Update () {
		float walk = speed * Time.deltaTime;
		transform.parent.transform.position = Vector3.MoveTowards (transform.position, target.position, walk);
		healthBar.GetComponent<Healthbar>().UpdatePosition(transform.position);
	}

	void OnTriggerEnter(Collider coll)
	{
		if(coll.transform.tag == "Bullet")
		{
			TakeDamage(coll.gameObject);
		}
	}

	private void TakeDamage(GameObject bullet)
	{
		this.hp -= bullet.GetComponent<BulletBase>().GetDamage();
		Destroy(bullet.gameObject);

		healthBar.GetComponent<Healthbar>().UpdateBar(this.hp);

		StartCoroutine(HitPause());

		if (hp < 1) {
			Destroy(transform.parent.gameObject);
			Time.timeScale = 1;
		}
	}

	IEnumerator HitPause()
	{
		Time.timeScale = 0.1f;
		yield return new WaitForSeconds(0.005f);
		Time.timeScale = 1;
	}
}
