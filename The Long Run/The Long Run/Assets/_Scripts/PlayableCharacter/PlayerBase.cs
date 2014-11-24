using UnityEngine;
using System.Collections;

public class PlayerBase : MonoBehaviour {

	public int totalHealth;
	public float movementSpeed;
	public float shootingSpeed;
	public float damage;
	private ItemType iteminInv;
	private bool alive;
	private bool usingController;

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
			if(usingController)
			{
				RotateToAxis();
			}else{
				RotateToMouse();
			}
			MoveToAxis();
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

	private Vector3 lookPos;
	private void RotateToMouse()
	{
		RaycastHit hit;
		Ray ray;
		
		ray = Camera.main.ScreenPointToRay(Input.mousePosition);
		if(Physics.Raycast(ray, out hit))
		{
			lookPos = hit.point;
			lookPos.y = transform.position.y;
			transform.LookAt(lookPos);
		}
	}

	private void OnTriggerEnter(Collider coll)
	{
		if(coll.transform.tag == "Item")
		{
			Debug.Log(iteminInv);
			if(iteminInv == ItemType.None)
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
		}else if(Input.GetButton("Shoot") || Input.GetMouseButton(0))
		{
			Shoot();
		}
		if(Input.GetButtonDown("UseItem"))
		{
			GC.UseItem(this.gameObject, iteminInv);
			Debug.Log(iteminInv);
		}
		if(Input.GetButtonDown("ToggleController"))
		{
			if(!usingController)
			{
				usingController = true;
			}else{
				usingController = false;
			}
		}
		if(Input.GetKeyDown(KeyCode.T))
		{
			GC.UseItem(this.gameObject, ItemType.Molotov);
		}
	}

	private float shootCooldown;
	private void Shoot()
	{
		GameObject bullet = Instantiate(Data.prefabs.bullet, transform.position, transform.localRotation) as GameObject;
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

	public void RemoveItem()
	{
		this.iteminInv = ItemType.None;
	}
}
