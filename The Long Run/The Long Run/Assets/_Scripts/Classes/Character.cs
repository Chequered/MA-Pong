using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Character
{
	protected Texture previewImgBackup;
	protected Texture previewImg;
	protected Texture previewImgTaken;
	protected string name;
	protected string desc;
	protected bool selected;
	protected int selectedID;

	public Character(Texture previewImg, Texture previewImgTaken,string name, string desc)
	{
		this.previewImg = previewImg;
		this.previewImgBackup = previewImg;
		this.previewImgTaken = previewImgTaken;
		this.name = name;
		this.desc = desc;
	}

	public bool IsSelected()
	{
		return selected;
	}

	public void Select(int id)
	{
		selected = true;
		previewImg = previewImgTaken;
		this.selectedID = id;
	}

	public Texture GetPreviewImgBackup()
	{
		return previewImgBackup;
	}

	public Texture GetPreviewImg()
	{
		return previewImg;
	}

	public Texture GetPreviewImgTaken()
	{
		return previewImgTaken;
	}

	public string GetName()
	{
		return name;
	}

	public string GetDesc()
	{
		return desc;
	}

	public int GetID()
	{
		return selectedID;
	}
}

