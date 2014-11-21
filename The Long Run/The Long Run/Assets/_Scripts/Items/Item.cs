using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public enum ItemType
{
	None,
	Buildpack,
	Vokda,
	Molotov,
	IronCurtain
}

public class Item : MonoBehaviour {

	public ItemType type;

	private void Start()
	{
		System.Array vals = System.Enum.GetValues(typeof(ItemType));
		Random ran = new Random();
		ItemType type = (ItemType)vals.GetValue(Random.Range(0, vals.Length));
	}

	public ItemType GetItemType()
	{
		return type;
	}
}
