package com.codingdojo.peru.full_time_2022.ninja_gold_game.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.peru.full_time_2022.ninja_gold_game.models.Activity;

@Controller
@RequestMapping("/Gold")
public class IndexController {
	
	private int goldCount = 0;
	private int currentGoldCount = 0;
	private ArrayList<Activity> activitiesList = new ArrayList<Activity>();
	private String currentDate = "";
	
	private int getRandomNumber(int min, int max) {
        Random random = new Random();
        return random.nextInt(max - min + 1) + min;
    }
	
	private boolean getRandomBoolean() {
		Random random = new Random();
		return random.nextBoolean();
	}
	
	@GetMapping("")
	public String index(Model model) {
		
		model.addAttribute("goldCount", goldCount);
		model.addAttribute("activitiesList", activitiesList);
		
		for (int i = 0; i < activitiesList.size(); i++) {
			System.out.println(activitiesList.get(i).getText() + " - " + activitiesList.get(i).getEarnOrTake());;
		}
		
		return "index.jsp";
	}
	
	@PostMapping("")
	public String processForm(@RequestParam(value = "farm") int farm,
								@RequestParam(value = "cave") int cave,
								@RequestParam(value = "house") int house,
								@RequestParam(value = "casino") int casino) {
		
		SimpleDateFormat formatter = new SimpleDateFormat("d 'de' MMMM, 'de' YYYY h:mm a");
		Date date = new Date();
		currentDate = formatter.format(date);
		Activity currentActivity = new Activity("", "");

		if (farm == 1) {
			currentGoldCount = getRandomNumber(10, 20);
			currentActivity.setText("You entered a farm and earned " +
			currentGoldCount + " gold. (" + currentDate + ")");
			currentActivity.setEarnOrTake("success");
		}
		if (cave == 1) {
			currentGoldCount = getRandomNumber(5, 10);
			currentActivity.setText("You entered a cave and earned " +
			currentGoldCount + " gold. (" + currentDate + ")");
			currentActivity.setEarnOrTake("success");
		}
		if (house == 1) {
			currentGoldCount = getRandomNumber(2, 5);
			currentActivity.setText("You entered a house and earned " +
			currentGoldCount + " gold. (" + currentDate + ")");
			currentActivity.setEarnOrTake("success");
		}
		if (casino == 1) {
			currentGoldCount = getRandomNumber(0, 50);
			currentActivity.setText("You entered a casino and earned " +
			currentGoldCount + " gold. (" + currentDate + ")");
			currentActivity.setEarnOrTake("success");
			if (!getRandomBoolean()) {
				currentGoldCount *= -1;
				currentActivity.setText("You entered a casino and lost " +
				currentGoldCount + " gold...Ouch. (" + currentDate + ")");
				currentActivity.setEarnOrTake("danger");
			}
		}
		goldCount += currentGoldCount;
		activitiesList.add(currentActivity);
		
		System.out.println(currentGoldCount + " - " + currentActivity.getText() + " - " + currentActivity.getEarnOrTake());
		
		return "redirect:/Gold";
	}
	
	@PostMapping("/Reboot")
	public String rebootApp() {
		
		goldCount = 0;
		activitiesList.clear();
		
		return "redirect:/Gold";
	}
}
