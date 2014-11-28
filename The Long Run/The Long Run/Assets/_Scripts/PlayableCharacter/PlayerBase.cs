using UnityEngine;
using System.Collections;

public enum GameCharacter
{
	Castro,
	Stalin,
	Lenin,
	Un
}

public class PlayerBase : MonoBehaviour {

	public int totalHealth;
	public float health;
	public float movementSpeed;
	public float shootingSpeed;
	public float damage;
	public ItemType iteminInv;
	public GameCharacter character;
	private bool alive;
	private bool usingController;
	private int inputIndex;

	private CharacterController con;
	private AudioSource[] audioSources;
	private Vector3 moveDirection;
	private GameController GC;
	private int ID;

	private void Awake()
	{
		con = transform.parent.GetComponent<CharacterController>();
	}

	private void Start()
	{
		GC = GameController.GC;
		audioSources = GetComponents<AudioSource>();
	}

	private void Update()
	{
		if(con)
		{
			if(usingController)
			{
				RotateToAxis();
				MoveToAxis();
			}else{
				RotateToMouse();
			}
			GetInput();
		}
	}

	private void MoveToAxis()
	{
		moveDirection = new Vector3(Input.GetAxis("Horizontal" + ID), 0, Input.GetAxis("Vertical" + ID));
		moveDirection = transform.parent.transform.TransformDirection(moveDirection);
		moveDirection *= movementSpeed;
		con.SimpleMove(moveDirection * Time.deltaTime);
	}

	private void RotateToAxis()
	{
		float angH = Input.GetAxis("RightH" + ID);
		float angV = Input.GetAxis("RightV" + ID);
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
		}else if(Input.GetButton("Shoot" + ID))
		{
			Shoot();
		}
		if(Input.GetButtonDown("UseItem" + ID))
		{
			GC.UseItem(this.gameObject, iteminInv);
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
	}

	private float shootCooldown;
	private void Shoot()
	{
		GameObject bullet = Instantiate(Data.prefabs.bullet, transform.position, transform.localRotation) as GameObject;
		bullet.GetComponent<BulletBase>().SetDamage(damage);
		MuzzleFlashOn();
		shootCooldown = 175;
		PlayGunSound();
	}

	private void PlayGunSound()
	{
		for(int i = 0; i < audioSources.Length; i++)
		{
			if(!audioSources[i].isPlaying)
			{
				audioSources[i].Play();
				audioSources[i].pitch += Random.Range(-0.2f, 0.2f);
				i = audioSources.Length;
			}
		}
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
	
	public GameCharacter GetCharacter()
	{
		return character;
	}

	public void SetCharacter(GameCharacter character)
	{
		this.character = character;
	}

	public void SetID(int id)
	{
		this.ID = id;
	}

	public void RemoveItem()
	{
		this.iteminInv = ItemType.None;
	}
}
