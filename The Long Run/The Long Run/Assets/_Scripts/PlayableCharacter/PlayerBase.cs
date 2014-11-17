using UnityEngine;
using System.Collections;

public class PlayerBase : MonoBehaviour {

	public int totalHealth;
	public float movementSpeed;
	public float shootingSpeed;
	protected bool alive;

	private CharacterController con;
	private Vector3 moveDirection;

	private void Awake()
	{
		con = transform.parent.GetComponent<CharacterController>();
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

	private void GetInput()
	{
		if(Input.GetButtonDown("Shoot"))
		{
			Shoot();
		}
	}

	private void Shoot()
	{
		Instantiate(Data.prefabs.bulletPrefab, transform.position, transform.localRotation);
	}

	private double RadianToDegree(double angle)
	{
		return angle * (180.0 / System.Math.PI);
	}

	public bool isAlive()
	{
		return alive;
	}
}
