using UnityEngine;
using System.Collections;

public enum TargetType
{
	None,
	Player,
	Wall
}

public class EnemyController : MonoBehaviour {

	public GameObject healthBar;
	public bool playerOutside;
	public bool chooseOnce;
	public Transform target;
	public float speed;
	public float hp;
	public float damage;
	public int attackWhat;
	
	private TargetType targetType;

	void Start () {
		healthBar.GetComponent<Healthbar>().SetHealth(hp);
		SetRandomWall();
	}

	void Update () {
		float walk = speed * Time.deltaTime;
		transform.parent.transform.position = Vector3.MoveTowards (transform.position, target.position, walk);
		healthBar.GetComponent<Healthbar>().UpdatePosition(transform.position);

		if (!playerOutside && targetType == TargetType.None) 
		{
			SetRandomWall();
			chooseOnce = false;
		}
		
		if (playerOutside) 
		{
			if(chooseOnce == false)
			{
				attackWhat = Random.Range(1,3);
				chooseOnce = true;
			}

			if(attackWhat == 2)
			{
				target = GameObject.FindWithTag("PlayerOutside").transform;
			}
		}
	}

	private void SetRandomWall()
	{
		GameObject[] targets = GameObject.FindGameObjectsWithTag("Wall");
		int r = Random.Range(0, targets.Length);
		target = targets[r].transform;
		targetType = TargetType.Wall;
	}

	void OnTriggerEnter(Collider coll)
	{
		if(coll.transform.tag == "Bullet")
		{
			TakeDamage(coll.gameObject);
		}
	}

	public void TakeDamage(GameObject bullet)
	{
		this.hp -= bullet.GetComponent<BulletBase>().GetDamage();
		Destroy(bullet.gameObject);

		healthBar.GetComponent<Healthbar>().UpdateBar(this.hp);

		if (hp < 1) {
			Destroy(transform.parent.gameObject);
			Time.timeScale = 1;
		}
	}

	public void TakeDamage(float dmg)
	{
		this.hp -= dmg;
		healthBar.GetComponent<Healthbar>().UpdateBar(this.hp);

		if (hp < 1) {
			Destroy(transform.parent.gameObject);
			Time.timeScale = 1;
		}
	}

	private IEnumerator HitPause()
	{
		Time.timeScale = 0.1f;
		yield return new WaitForSeconds(0.005f);
		Time.timeScale = 1;
	}
}
