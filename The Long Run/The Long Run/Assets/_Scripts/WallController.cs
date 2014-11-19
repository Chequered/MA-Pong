using UnityEngine;
using System.Collections;

public class WallController : MonoBehaviour {

	public float hp;
	
	void Start () {
	
	}

	void Update () {
	
		if (hp < 1) 
		{
			Destroy(this.gameObject);
		}
	}
}
