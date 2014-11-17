using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class CameraController : MonoBehaviour {

	public CameraController cam;
	public float screenShakeStrength;
	public int screenShakes;

	private bool screenShaking;
	private bool backToOrigin;
	private List<Vector3> screenShakeVects = new List<Vector3>();

	private void Awake()
	{
		cam = this;
	}

	public void ScreenShake()
	{
		for(int i = 0; i < screenShakes; i++)
		{
			float range = Random.Range(0, screenShakeStrength);
			float side = Random.Range(0, 2);
			Vector3 vect = this.transform.position;
			if(side == 1)
			{
				vect = new Vector3(this.transform.position.x - range, this.transform.position.y, this.transform.position.z - range );
			}else{
				vect = new Vector3(this.transform.position.x + range, this.transform.position.y, this.transform.position.z + range );
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
				this.transform.position = Vector3.MoveTowards(transform.position,  screenShakeVects[0], 0.45f);
			}else{
				screenShakeVects.Remove(screenShakeVects[0]);
			}
		}else if(!backToOrigin){
			this.transform.position = Vector3.MoveTowards(transform.position,  new Vector3(0, this.transform.position.y, 0), 0.45f);
		}
	}
}
