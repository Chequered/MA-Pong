using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class CameraController : MonoBehaviour {

	public CameraController cam;
	public float screenShakeStrength;
	public int screenShakes;

	private bool screenShaking;
	private List<Vector3> screenShakeVects = new List<Vector3>();

	private void Awake()
	{
		cam = this;
	}

	private void Start()
	{
		ScreenShake();
	}

	public void ScreenShake()
	{
		for(int i = 0; i < screenShakes; i++)
		{
			float range = Random.Range(0, screenShakeStrength);
			float side = Random.Range(0, 2);
			Vector3 vect = new Vector3(0,0,0);
			if(side == 1)
			{
				vect = new Vector3(this.transform.position.x + range, this.transform.position.y, this.transform.position.z + range );
				Debug.Log(vect);
			}else{
				vect = Vector3.left + range;
				vect = new Vector3(this.transform.position.x - range, this.transform.position.y, this.transform.position.z - range );
				Debug.Log(vect);
			}
			screenShakeVects.Add(vect);
		}
		screenShaking = true;
	}

	private void Update()
	{
		if(screenShakeVects.Count > 0)
		{
			if(transform.position != screenShakeVects[0])
			{
				this.transform.position = Vector3.MoveTowards(transform.position,  screenShakeVects[0], 0.2f);
			}else{
				screenShakeVects.Remove(screenShakeVects[0]);
			}
		}
	}
}
