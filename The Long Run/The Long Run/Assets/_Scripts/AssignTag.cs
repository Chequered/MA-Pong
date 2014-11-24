using UnityEngine;
using System.Collections;

public class AssignTag : MonoBehaviour 
{
	
	void onTriggerStay(Collider other)
	{
		if(other.gameObject.tag == "playerOutside")
		{
			other.gameObject.tag = "playerInside";
		}
	}
}
