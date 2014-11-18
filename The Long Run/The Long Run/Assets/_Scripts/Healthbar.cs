using UnityEngine;
using System.Collections;

public class Healthbar : MonoBehaviour {

	public GameObject greenBar;

	private float maxHealth;
	private float currentHealth;

	private float maxWidth;

	public void SetHealth(float _max)
	{
		maxHealth = _max;
		currentHealth = _max;
	}

	public void UpdateBar(float _new)
	{
		currentHealth = _new;
		greenBar.GetComponent<GUITexture>().guiTexture.pixelInset.width = maxWidth * currentHealth / maxHealth;
	}
}
