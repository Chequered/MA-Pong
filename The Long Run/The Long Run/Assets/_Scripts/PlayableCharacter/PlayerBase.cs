using UnityEngine;
using System.Collections;

public class PlayerBase : MonoBehaviour {

	public int totalHealth;
	public float movementSpeed;
	public float shootingSpeed;
	public float damage;
	private ItemType iteminInv;
	protected bool alive;

	private CharacterController con;
	private Vector3 moveDirection;
	private GameController GC;

	private void Awake()
	{
		con = transform.parent.GetComponent<CharacterController>();
	}

	private void Start()
	{
		GC = GameController.GC;
	}

	private void Update()
	{
		if(con)
		{
			MoveToAxis();
			RotateToAxis();
			GetInput();
		}
	}

	private void MoveToAxis()
	{
		moveDirection = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
		moveDirection = transform.parent.transform.TransformDirection(moveDirection);
		moveDirection *= movementSpeed;
		con.SimpleMove(moveDirection * Time.deltaTime);
	}

	private void RotateToAxis()
	{
		float angH = Input.GetAxis("RightH");
		float angV = Input.GetAxis("RightV");
		this.transform.localEulerAngles = new Vector3(0,(float)RadianToDegree(Mathf.Atan2(angH, angV) + 90));
	}

	private void OnTriggerEnter(Collider coll)
	{
		if(coll.transform.tag == "Item")
		{
			if(iteminInv == null)
			{
				iteminInv = coll.gameObject.GetComponent<Item>().GetItemType();
				Destroy(coll.gameObject);
			}
		}
	}

	private void GetInput()
	{
		if(shootCooldown > 0)
		{
			shootCooldown -= shootingSpeed;
		}else if(Input.GetButton("Shoot"))
		{
			Shoot();
		}
		if(Input.GetButtonDown("UseItem"))
		{
			GC.UseItem(this.gameObject, iteminInv);
		}
	}

	private float shootCooldown;
	private void Shoot()
	{
		GameObject bullet = Instantiate(Data.prefabs.bulletPrefab, transform.position, transform.localRotation) as GameObject;
		bullet.GetComponent<BulletBase>().SetDamage(damage);
		MuzzleFlashOn();
		shootCooldown = 175;
	}

	private double RadianToDegree(double angle)
	{
		return angle * (180.0 / System.Math.PI);
	}

	private void MuzzleFlashOn()
	{
		GetComponent<Light>().enabled = true;
		Invoke("MuzzleFlashOff", 0.02f);
	}

	private void MuzzleFlashOff()
	{
		GetComponent<Light>().enabled = false;
	}

	public bool isAlive()
	{
		return alive;
	}
}
