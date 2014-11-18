using UnityEngine;
using System.Collections;

public class Healthbar : MonoBehaviour {

	public GameObject greenBar;
	public GameObject redBar;

	private float maxHealth;
	private float currentHealth;

	private float maxWidth;
	private bool visible;

	private Color normalGreen;
	private Color normalRed;

	private void Start()
	{
		normalRed = redBar.guiTexture.color;
		normalGreen = greenBar.guiTexture.color;

		Color green = greenBar.guiTexture.color;
		green.a = 0f;
		Color red = redBar.guiTexture.color;
		red.a = 0f;
		greenBar.guiTexture.color = green;
		redBar.guiTexture.color = red;
	}

	public void SetHealth(float _max)
	{
		maxHealth = _max;
		currentHealth = _max;
		maxWidth = greenBar.guiTexture.pixelInset.width;
	}

	public void UpdatePosition(Vector3 pos)
	{
		Vector3 barPos = Camera.main.WorldToViewportPoint (pos);
		transform.position = barPos;
	}

	public void UpdateBar(float _new)
	{
		currentHealth = _new;
		visible = true;
		greenBar.guiTexture.pixelInset = new Rect(greenBar.guiTexture.pixelInset.x, greenBar.guiTexture.pixelInset.y, maxWidth * currentHealth / maxHealth, greenBar.guiTexture.pixelInset.height);
		greenBar.guiTexture.color = normalGreen;
		redBar.guiTexture.color = normalRed;
	}

	private void Update()
	{
		if(visible)
		{
			Color green = greenBar.guiTexture.color;
			green.a -= 0.0035f;
			Color red = redBar.guiTexture.color;
			red.a -= 0.0035f;
			greenBar.guiTexture.color = green;
			redBar.guiTexture.color = red;
		}
	}
}
