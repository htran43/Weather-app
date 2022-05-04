//
//  Resources.swift
//  FinalProject
//
//  Created by FSE394 on 5/4/22.
//

import Foundation

enum ResourceType {
    case flood, hurricane, earthquake, wildfire, snowstorm, tornado, thunderstorm, duststorm
    
    var title: String {
        switch self {
        case .flood:
            return "Flood"
        case .hurricane:
            return "Hurricane"
        case .earthquake:
            return "Earthquake"
        case .wildfire:
            return "Wildfire"
        case .snowstorm:
            return "Snowstorm"
        case .tornado:
            return "Tornado"
        case .thunderstorm:
            return "Thunderstorm"
        case .duststorm:
            return "Dust Storm"
        }
    }
    var description: String {
        switch self {
        case .flood:
            return "Flooding is a coast-to-coast threat to some part of the United States and its territories nearly every day of the year. Floods occur when an overflow of water submerges land that is usually dry. Floods are often caused by heavy rainfall, rapid snowmelt or a storm surge from a tropical cyclone or tsunami in coastal areas.\n\nPractice these precautions:\n\n-Secure your house before a flood.\n-Be prepared to turn off electrical power when there is standing water.\n-Buy and have a fire extinguisher prepared.\n-Prepare emergency food and water supplies.\n-Bring outdoor possessions inside, such as lawn chairs.\n-Be prepared to evacuate if needed."
        case .hurricane:
            return "Hurricanes are large, swirling storms. They produce winds of 119 kilometers per hour (74 mph) or higher. That's faster than a cheetah, the fastest animal on land. Winds from a hurricane can damage buildings and trees. Hurricanes form over warm ocean waters.\n\nPractice these precautions:\n\n-Always stay out of floodwaters, they likely contain toxic materials and if driving they can sweep away cars.\n-Never use wet electrical devices.\n-If the power is out, use flashlights isntead of candles. Candles may create unnecessary fire risks.\n-Be careful near damaged buildings, they may collapse.\nStay away from power lines.\nCreate emergency supplies of food, water, and first aid materials."
        case .earthquake:
            return "Earthquake is a term used to describe both sudden slip on a fault, and the resulting ground shaking and radiated seismic energy caused by the slip, or by volcanic or magmatic activity, or other sudden stress changes in the earth. The primary effects of earthquakes are ground shaking, ground rupture, landslides, tsunamis, and liquefaction. Fires are probably the single most important secondary effect of earthquakes.\n\nPractice these precautions:\n\n-Learn the safe spots in each room of your home. A safe spot may be underneath a sturdy table away from walls or underneath your covers with a pillow over your head if you are already in bed.\n-Secure potential hazards in your home with L-brackets, items such as bookcases, windows, and other glass.\n-Identify poisonous materials that may be spread during the earthquake if broken.\n-Create emergency supplies of food, water, and first aid materials."
        case .wildfire:
            return "A wildfire is an unplanned fire that burns in a natural area such as a forest, grassland, or prairie. Wildfires are often caused by human activity or a natural phenomenon such as lightning, and they can happen at any time or anywhere.\n\nPractice these precautions:\n\n-Plan to keep wildfire smoke out: Choose a room you can close the outside off from.\n-Set up a portable air cleaner or filter to keep the room clean of smoke.\n-Keep track of dry forest areas near you, as they are potential wildfire zones."
        case .snowstorm:
            return "A snowstorm is a very heavy fall of snow, usually when there is also a strong wind blowing at the same time. To be categorized as a snowstorm, the storm must last for at least three hours and produce a large amount of falling snow. Blizzards also have winds measuring over 56 kilometers (35 miles) per hour. These winds cause a large volume of snow to blow around in the air and near the ground, decreasing visibility.\n\nPractice these precautions:\n\n-Insulate water lines that run along exterior walls, so your water supply is less likely to freeze.\n-Insulate outside walls and attic walls.\n-Insulate windows and other places directly in contact with outside.\n-Cut away branches that may fall on your home and cause an opening during a storm.\n-If using a fireplace, make sure you have a fire extinguisher nearby.\n-Create emergency supplies of food, water, and first aid materials."
        case .tornado:
            return "Tornadoes are signified by a violently rotating column of air touching the ground, usually attached to the base of a thunderstorm. Tornadoes are nature's most violent storms. Spawned from powerful thunderstorms, tornadoes can cause fatalities and devastate a neighborhood in seconds. Winds of a tornado may reach 300 miles per hour.\n\nPractice these precautions:\n\n-Identify a safe place in your home for household members to gather during a tornado.\n-Make sure every house member understands the tornado warning system of your area.\n-Write down a list of everyone's emergency needs (perscriptions, limitations, etc.) in case of emergency.\n-Store valuables in a safe location so they don't get lost (birth certificates, passports, etc.)\n-Create emergency supplies of food, water, and first aid materials."
        case .thunderstorm:
            return "Severe thunderstorms are officially defined as storms that are capable of producing hail that is an inch or larger or wind gusts over 58 mph. Hail this size can damage property such as plants, roofs and vehicles. Wind this strong is able to break off large branches, knock over trees or cause structural damage to trees. Some severe thunderstorms can produce hail larger than softballs or winds over 100 mph, so please pay attention to the weather so you know when severe storms are possible. Thunderstorms also produce tornadoes and dangerous lightning; heavy rain can cause flash flooding.\n\nPractice these precautions:\n\n-Go indoors, find a safe, enclosed shelter.\n-Don't stay in open vehicles and spaces.\n-Avoid using water and electronic equipment."
        case .duststorm:
            return "A dust storm is a wall of dust and debris that is often blown into an area by strong winds from thunderstorms. The wall of dust can be miles long and several thousand feet high. Dust storms can occur anywhere in the US but are most common in the Southwest.\n\nPractice these precautions:\n\n-Insulate your house so the dust that gets in is minimized.\n-Wear a mask to prevent particulates from getting into your body.\n-If driving, watch for sudden visibility changes and be prepared to pull over.\n-Avoid activity, especially if you have a breathing related condition.\n-Create emergency supplies of food, water, and first aid materials."
        }
    }
}

