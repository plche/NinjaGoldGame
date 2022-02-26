package com.codingdojo.peru.full_time_2022.ninja_gold_game.models;

public class Activity {
	
	private String text;
	private String earnOrTake;
	
	public Activity(String text, String earnOrTake) {
		super();
		this.text = text;
		this.earnOrTake = earnOrTake;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getEarnOrTake() {
		return earnOrTake;
	}

	public void setEarnOrTake(String earnOrTake) {
		this.earnOrTake = earnOrTake;
	}
}
