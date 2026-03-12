Config = Config or {}

Config.AnimDict = 'amb@world_human_seat_wall_tablet@female@base'
Config.Prop = 'prop_cs_tablet'
Config.Bone = 28422

Config.ShadyMan = {
	ped = "s_m_m_dockwork_01",
	name = "Dockworker",
	animName = "base",
	animDist = "missdocksshowoffcar@idle_a",
	tag ="Union Worker",
	tagcolor = "#378ACF",
}

Config.ShadyWait = 90000--180000

Config.RussianPaymentMin = 1250
Config.RussianPaymentMax = 1750
Config.RussianInfo = {
	ped = "u_m_o_finguru_01",
	name = '"The Russian"',
	animName = "base",
	animDist = "amb@world_human_cop_idles@male@idle_b",
	tag ="Organized Crime Boss",
	tagcolor = "#696969",
	driverPed = "a_m_m_farmer_01",
	driverAnimName = "base",
	driverAnimDist = "misscarsteal4@vendor",
	truckModel = "packer",
	trailerModel = "docktrailer",
}
Config.RussianSpawns = {
	[1] = {
		russian = vector4(1735.28,-1702.97,111.56,167.77),
		truck = vector4(1732.36, -1719.69,112.84,315.8),
		driver = vector4(1732.48,-1702.14, 111.57,255.46),
	},
	[2] = {
		russian = vector4(-730.62,-2166.11,4.99,198.38),
		truck = vector4(-737.1, -2169.26, 5.99, 226.67),
		driver = vector4(-728.01,-2166.48,4.99,112.59),
	},
	[3] = {
		russian = vector4(-1409.49, -457.17, 33.48, 219.21),
		truck = vector4(-1401.61, -455.46, 34.57, 124.32),
		driver = vector4(-1404.68,-459.47,33.48, 66.08),
	},
	[4] = {
		russian = vector4(1528.92,817.1, 76.43,126.62),
		truck = vector4(1521.64,818.18, 77.46,330.61),
		driver = vector4(1529.32, 813.03, 76.44, 66.42),
	},
}

Config.GarageSpawns = {
	["electric"] = vector4(534.42,-1578.8,29.25,320.79),
	["port"] = vector4(1197.04,-3106.26,6.03, 354.85),
    ["garbage"] = vector4(-329.13,-1517.19,27.53,182.92),
	["construction"] = vector4(123.62,-398.57, 41.26,161.31)
}

Config.Car = {
    model = "bison",
    plate = "UNIO"
}

Config.DefaultRep = 2
Config.PortRepBonus = 1
Config.NegativeRep = 100

Config.Pay = 40
Config.PayBonus = 10
Config.UnionDues = 3

Config.ContainerNum = 10

Config.ShadySpawns = {
	[1] = {
		[1] = vector4(778.56,-3062.2, 13.73, 359.9),
		[2] = vector4(753.28,-3197.93,5.07,310.74),
		[3] = vector4(1297.62,-3211.5,4.91,270.63),
	},
	[2] = {
		[1] = vector4(-106.01,-2376.87,8.35,190.8),
		[2] = vector4(125.94,-2461.55,5.0,80.08),
		[3] = vector4(-87.37,-2541.45,5.09,72.04),
	}
}

Config.PortUniforms = {
	['male'] = {
		outfitData = {
			['t-shirt'] = {item = 59, texture = 1}, --Shirt
			['torso2']  = {item = 95, texture = 0}, --Jacket
			['arms']    = {item = 48, texture = 0},
			['pants']   = {item = 9, texture = 6},
			['shoes']   = {item = 25, texture = 0},
            ['hats']    = {item = 175,texture = 12},
		}
	},
	['female'] = {
	 	outfitData = {
			['t-shirt'] = {item = 36, texture = 1}, --Shirt
			['torso2']  = {item = 50, texture = 0}, --Jacket
			['arms']    = {item = 49, texture = 0},
			['pants']   = {item = 38, texture = 3},
			['shoes']   = {item = 24, texture = 0},
            ['hats']    = {item = 174,texture = 12},
	 	}
	},
}

Config.Locales = {
	jobStarted = "Truck is in the parking lot. Use your port tablet to register the containers.",
	endjob = "Press ~b~E~w~ to return truck",
	jobEnded = "Good work. Come back later for another shift",
	newContainer = " container(s) left. Move to the next one.",
	returnVan = "Return truck to Union HQ garage",
	stillActive = "Finish the route we already gave you!",
}

Config.Ports = {
	[1] = {
		[1] = {
			front = vector4(1162.84,-2978.77,5.9,88.85),
			side = vector4(1156.66,-2980.31,5.9,0.52),
			back = vector4(1150.04,-2978.71,5.9,271.25),
			bay = "C2",
		},
		[2] = {
			front = vector4(1162.78,-2976.09,5.9,95.49),
			side = nil,
			back = vector4(1150.02,-2976.09,5.9,272.92),
			bay = "C2",
		},
		[3] = {
			front = vector4(1162.8,-2973.49,5.9,92.17),
			side = nil,
			back = vector4(1150.02,-2973.44,5.9,270.14),
			bay = "C2",
		},
		[4] = {
			front = vector4(1162.76,-2970.77,5.9,91.58),
			side = nil,
			back = vector4(1150.05,-2970.85,5.9,268.94),
			bay = "C2",
		},
		[5] = {
			front = vector4(1162.76,-2968.05,5.9,97.4),
			side = vector4(1156.19,-2966.45,5.9,181.61),
			back = vector4(1149.98,-2968.11,5.9,273.41),
			bay = "C2",
		},
		[6] = {
			front = vector4(1148.67,-2978.71,5.9,89.98),
			side = vector4(1142.35,-2980.28,5.9,4.9),
			back = vector4(1135.93,-2978.67,5.9,272.95),
			bay = "C3",
		},
		[7] = {
			front = vector4(1148.72,-2976.05,5.9,89.06),
			side = nil,
			back = vector4(1135.91,-2976.07,5.9,272.52),
			bay = "C3",
		},
		[8] = {
			front = vector4(1148.67,-2973.43,5.9,93.78),
			side = nil,
			back = vector4(1135.96,-2973.4,5.9,268.59),
			bay = "C3",
		},
		[9] = {
			front = vector4(1148.67,-2970.76,5.9,93.49),
			side = nil,
			back = vector4(1135.96,-2970.77,5.9,276.68),
			bay = "C3",
		},
		[10] = {
			front = vector4(1148.68,-2968.13,5.9,90.98),
			side = vector4(1142.45,-2966.46,5.9,178.47),
			back = vector4(1135.87,-2968.19,5.9,271.42),
			bay = "C3",
		},
		[11] = {
			front = vector4(1121.99,-2978.79,5.9,272.74),
			side = vector4(1128.41,-2980.37,5.9,1.96),
			back = vector4(1134.74,-2978.83,5.9,90.43),
			bay = "C4",
		},
		[12] = {
			front = vector4(1121.99,-2976.08,5.9,271.16),
			side = nil,
			back = vector4(1134.73,-2976.16,5.9,90.32),
			bay = "C4",
		},
		[13] = {
			front = vector4(1121.99,-2973.54,5.9,273.86),
			side = nil,
			back = vector4(1134.71,-2973.57,5.9,89.29),
			bay = "C4",
		},
		[14] = {
			front = vector4(1121.96,-2970.84,5.9,269.48),
			side = nil,
			back = vector4(1134.71,-2970.86,5.9,90.56),
			bay = "C4",
		},
		[15] = {
			front = vector4(1121.97,-2968.22,5.9,273.81),
			side = vector4(1128.32,-2966.55,5.9,180.77),
			back = vector4(1134.73,-2968.23,5.9,91.55),
			bay = "C4",
		},
		[16] = {
			front = vector4(1120.52,-3047.6,5.9,87.4),
			side = vector4(1114.53,-3049.17,5.9,357.54),
			back = vector4(1107.71,-3047.6,5.9,269.52),
			bay = "F2",
		},
		[17] = {
			front = vector4(1120.54,-3044.98,5.9,87.97),
			side = nil,
			back = vector4(1107.78,-3044.94,5.9,272.72),
			bay = "F2",
		},
		[18] = {
			front = vector4(1120.5,-3039.66,5.9,88.18),
			side = vector4(1114.31,-3035.32,5.9,182.23),
			back = vector4(1107.78,-3039.74,5.9,267.56),
			bay = "F2",
		},
		[19] = {
			front = vector4(1149.85,-3047.5,5.9,267.74),
			side = vector4(1156.45,-3049.18,5.9,359.08),
			back = vector4(1162.6,-3047.52,5.9,91.58),
			bay = "F5",
		},
		[20] = {
			front = vector4(1149.87,-3042.24,5.9,272.85),
			side = nil,
			back = vector4(1162.65,-3042.22,5.9,87.68),
			bay = "F5",
		},
		[21] = {
			front = vector4(1048.98,-3098.74,5.9,268.37),
			side = nil,
			back = vector4(1061.72,-3098.7,5.9,88.26),
			bay = "H5",
		},
		[22] = {
			front = vector4(1048.98,-3090.82,5.9,266.58),
			side = vector4(1055.33,-3089.18,5.9,181.18),
			back = vector4(1061.76,-3090.82,5.9,89.21),
			bay = "H5",
		},
		[23] = {
			front = vector4(1047.78,-3096.19,5.9,89.39),
			side = nil,
			back = vector4(1035.01,-3096.15,5.9,271.97),
			bay = "H4",
		},
		[24] = {
			front = vector4(1034.24,-3098.81,5.9,81.77),
			side = nil,
			back = vector4(1021.49,-3098.77,5.9,268.59),
			bay = "H3",
		},
		[25] = {
			front = vector4(1034.23,-3093.54,5.9,88.09),
			side = nil,
			back = vector4(1021.41,-3093.54,5.9,271.12),
			bay = "H3",
		},
		[26] = {
			front = vector4(1005.73,-3098.75,5.9,90.64),
			side = nil,
			back = vector4(992.96,-3098.83,5.9,277.22),
			bay = "H1",
		},
		[27] = {
			front = vector4(938.3,-3098.73,5.9,273.75),
			side = nil,
			back = vector4(951.09,-3098.79,5.9,85.4),
			bay = "G4",
		},
		[28] = {
			front = vector4(938.3,-3093.42,5.9,267.52),
			side = nil,
			back = vector4(951.12,-3093.43,5.9,87.61),
			bay = "G4",
		},
		[29] = {
			front = vector4(938.32,-3090.78, 5.9,268.31),
			side = vector4(945.06,-3089.22,5.9,181.08),
			back = vector4(951.08,-3090.81,5.9,89.37),
			bay = "G4",
		},
		[30] = {
			front = vector4(923.32,-3098.74,5.9,89.13),
			side = nil,
			back = vector4(910.48,-3098.81,5.9,271.25),
			bay = "G2",
		},
		[31] = {
			front = vector4(910.57,-3090.8,5.9,271.11),
			side = vector4(917.09,-3089.22,5.9,182.7),
			back = vector4(923.28,3090.79,5.9,87.3),
			bay = "G2",
		},
		[32] = {
			front = vector4(859.08,-3095.93,5.9,267.75),
			side = nil,
			back = vector4(871.84,-3095.94,5.9,86.85),
			bay = "Z4",
		},
		[33] = {
			front = vector4(859.08,-3093.32,5.9,272.87),
			side = nil,
			back = vector4(871.79,3093.27,5.9,89.97),
			bay = "Z4",
		},
		[34] = {
			front = vector4(829.93,-3090.57,5.9,94.19),
			side = vector4(823.34,-3088.88,5.9,178.49),
			back = vector4(817.11,-3090.55,5.9,270.11),
			bay = "Z1",
		},
		[35] = {
			front = vector4(909.29,-3044.71,5.9,90.35),
			side = vector4(903.25,-3043.04,5.9,184.64),
			back = vector4(896.5,-3044.73,5.9,271.21),
			bay = "D1",
		},
		[36] = {
			front = vector4(910.57,-3039.63,5.9,272.57),
			side = nil,
			back = vector4(923.3,-3039.71,5.9,90.05),
			bay = "D2",
		},
		[37] = {
			front = vector4(923.33,-3044.93,5.9,90.54),
			side = nil,
			back = vector4(910.55,-3044.92,5.9,270.72),
			bay = "D2",
		},
		[38] = {
			front = vector4(965.34,-2970.99,5.9,90.92),
			side = nil,
			back = vector4(952.55,-2970.93,5.9,271.34),
			bay = "A1",
		},
		[39] = {
			front = vector4(965.31,-2976.15,5.9,90.09),
			side = nil,
			back = vector4(952.55,-2976.25,5.9,270.79),
			bay = "A1",
		},
		[40] = {
			front = vector4(951.23,-2976.16,5.9,91.8),
			side = vector4(944.28,-2977.82,5.9,359.9),
			back = vector4(938.48,-2976.35,5.9,271.34),
			bay = "A2",
		},
		[41] = {
			front = vector4(924.52,-2971.17,5.9,269.37),
			side = nil,
			back = vector4(937.35,-2971.21,5.9,93.7),
			bay = "A3",
		},
		[42] = {
			front = vector4(910.58,-2973.93,5.9,274.16),
			side = nil,
			back = vector4(923.34,-2973.91,5.9,88.39),
			bay = "A4",
		},
		[43] = {
			front = vector4(910.57,-2979.14,5.9,270.11),
			side = vector4(916.4,-2980.76,5.9,3.73),
			back = vector4(923.28,-2979.12,5.9,93.18),
			bay = "A4",
		},
		[44] = {
			front = vector4(1006.97,-2973.83,5.9,271.32),
			side = nil,
			back = vector4(1019.78,-2973.77,5.9,96.44),
			bay = "B4",
		},
		[45] = {
			front = vector4(1007.06,-2976.5,5.9,270.39),
			side = nil,
			back = vector4(1019.78,-2976.49,5.9,90.52),
			bay = "B4",
		},
		[46] = {
			front = vector4(1007.06,-2979.22,5.9,274.33),
			side = vector4(1013.62,-2980.72, 5.9, 2.04),
			back = vector4(1019.77,-2979.25,5.9,91.31),
			bay = "B4",
		},
		[47] = {
			front = vector4(1034.98,-2968.22,5.9,269.27),
			side = vector4(1041.42,-2966.68,5.9,183.99),
			back = vector4(1047.79,-2968.25,5.9,94.13),
			bay = "B2",
		},
		[48] = {
			front = vector4(1035.05,-2973.5,5.9,270.43),
			side = nil,
			back = vector4(1047.8,-2973.5,5.9,95.46),
			bay = "B2",
		},
		[49] = {
			front = vector4(1049.05,-2979.1,5.9,272.01),
			side = vector4(1054.9,-2980.69,5.9,3.26),
			back = vector4(1061.77,-2979.02,5.9,92.52),
			bay = "B1",
		},
	},
	[2] = {
		[1] = {
			front = vector4(68.43,-2504.5,6.01,234.54),
			side = vector4(73.01,-2509.77,6.01,326.44),
			back = vector4(78.95,-2511.8,6.01,53.58),
			bay = "B01",
		},
		[2] = {
			front = vector4(69.88,-2502.25,6.01,234.54),
			side = nil,
			back = vector4(80.35,-2509.62,6.0,54.34),
			bay = "B02",
		},
		[3] = {
			front = vector4(71.44,-2500.18,6.01,234.78),
			side = nil,
			back = vector4(81.85,-2507.54,6.0,51.79),
			bay = "B03",
		},
		[4] = {
			front = vector4(72.92,-2498.06,6.0,244.41),
			side = nil,
			back = vector4(83.43,-2505.4,6.0,58.17),
			bay = "B04",
		},
		[5] = {
			front = vector4(74.45,-2495.81,6.0,228.32),
			side = vector4(80.48,-2498.08,6.0,145.91),
			back = vector4(84.88,-2503.18,6.0,56.37),
			bay = "B05",
		},
		[6] = {
			front = vector4(56.94,-2496.49,6.01,236.58),
			side = vector4(61.52,-2501.63,6.01,329.61),
			back = vector4(67.4,-2503.72,6.01,55.84),
			bay = "B06",
		},
		[7] = {
			front = vector4(58.41,-2494.32,6.01,238.64),
			side = nil,
			back = vector4(68.85,-2501.67,6.01,53.52),
			bay = "B07",
		},
		[8] = {
			front = vector4(59.87,-2492.14,6.01,237.46),
			side = nil,
			back = vector4(70.41,-2499.48,6.01,55.15),
			bay = "B08",
		},
		[9] = {
			front = vector4(61.46,-2490.04,6.01,238.32),
			side = vector4(67.49,-2492.17,6.01,148.2),
			back = vector4(71.92,-2497.3,6.01,59.42),
			bay = "B09",
		},
		[10] = {
			front = vector4(46.99,-2486.29,6.01,236.23),
			side = nil,
			back = vector4(57.43,-2493.56,6.01,57.28),
			bay = "B13",
		},
		[11] = {
			front = vector4(48.49,-2484.16,6.01,236.6),
			side = nil,
			back = vector4(58.93,-2491.46,6.01,52.89),
			bay = "B14",
		},
		[12] = {
			front = vector4(49.96,-2482.04,6.01,237.85),
			side = nil,
			back = vector4(60.5,-2489.2,6.01,49.39),
			bay = "B15",
		},
		[13] = {
			front = vector4(51.55,-2479.75,6.01,245.77),
			side = vector4(57.71,-2482.11,6.01,144.13),
			back = vector4(62.03,-2487.14,6.01,49.42),
			bay = "B16",
		},
		[14] = {
			front = vector4(36.14,-2525.76,6.01,240.37),
			side = vector4(40.34,-2530.59,6.01,322.95),
			back = vector4(46.6,-2533.02,6.01,58.7),
			bay = "A01",
		},
		[15] = {
			front = vector4(37.7,-2523.56,6.01,233.61),
			side = nil,
			back = vector4(48.13,-2530.85,6.01,52.93),
			bay = "A02",
		},
		[16] = {
			front = vector4(39.18,-2521.45,6.01,242.04),
			side = nil,
			back = vector4(49.64,-2528.7,6.0,52.15),
			bay = "A03",
		},
		[17] = {
			front = vector4(40.72,-2519.27,6.0,241.85),
			side = nil,
			back = vector4(51.11,-2526.58,6.0,52.22),
			bay = "A04",
		},
		[18] = {
			front = vector4(42.17,-2517.09,6.0,234.61),
			side = vector4(48.24,-2519.26,6.0,146.62),
			back = vector4(52.65,-2524.38,6.0,52.83),
			bay = "A05",
		},
		[19] = {
			front = vector4(24.7,-2517.71,6.01,235.76),
			side = vector4(29.14,-2522.74,6.01,325.18),
			back = vector4(35.12,-2525.04,6.01,56.75),
			bay = "A06",
		},
		[20] = {
			front = vector4(26.2,-2515.57,6.01,231.08),
			side = nil,
			back = vector4(36.65,-2522.84,6.01,54.7),
			bay = "A07",
		},
		[21] = {
			front = vector4(27.73,-2513.4,6.01,232.56),
			side = nil,
			back = vector4(38.19,-2520.64,6.01,60.58),
			bay = "A08",
		},
		[22] = {
			front = vector4(29.22,-2511.2,6.01,235.33),
			side = vector4(35.56,-2513.6,6.0,143.27),
			back = vector4(39.65,-2518.55,6.0,56.87),
			bay = "A09",
		},
		[23] = {
			front = vector4(14.72,-2507.55,6.01,237.64),
			side = nil,
			back = vector4(25.6,-2514.83,6.01,58.72),
			bay = "A13",
		},
		[24] = {
			front = vector4(17.75,-2503.23,6.01,237.88),
			side = nil,
			back = vector4(28.24,-2510.44,6.01,55.6),
			bay = "A15",
		},
		[25] = {
			front = vector4(19.24,-2501.9,6.01,234.55),
			side = vector4(25.48,-2503.4,6.01,148.36),
			back = vector4(29.74,-2508.32,6.01,56.14),
			bay = "A16",
		},
		[26] = {
			front = vector4(6.75,-2461.39,6.01,231.18),
			side = vector4(11.09,-2466.52,6.01,328.1),
			back = vector4(17.17,-2468.71,6.01,57.99),
			bay = "D01",
		},
		[27] = {
			front = vector4(-0.2,-2446.9,6.01,229.72),
			side = nil,
			back = vector4(10.24, -2454.19,6.01,56.08),
			bay = "D02",
		},
		[28] = {
			front = vector4(9.77,-2457.08,6.01,235.13),
			side = nil,
			back = vector4(20.17,-2464.4,6.01,55.9),
			bay = "D03",
		},
		[29] = {
			front = vector4(11.25,-2454.9,6.01,234.75),
			side = vector4(17.22,-2457.19,6.01,145.95),
			back = vector4(21.68,-2462.25,6.01,56.57),
			bay = "D04",
		},
		[30] = {
			front = vector4(-3.25,-2451.27,6.01,236.92),
			side = vector4(1.08,-2456.2,6.01,323.12),
			back = vector4(7.21,-2458.62,6.01,54.64),
			bay = "D07",
		},
		[31] = {
			front = vector4(-1.72,-2449.1,6.01,238.56),
			side = nil,
			back = vector4(8.73,-2456.4,6.01,55.68),
			bay = "D08",
		},
		[32] = {
			front = vector4(-0.19,-2446.91,6.01,234.85),
			side = nil,
			back = vector4(10.28,-2454.14,6.01,56.47),
			bay = "D09",
		},
		[33] = {
			front = vector4(1.32,-2444.76,6.01,236.4),
			side = vector4(7.57,-2447.21,6.01,144.69),
			back = vector4(11.77,-2452.0,6.01,54.88),
			bay = "D10",
		},
		[34] = {
			front = vector4(-16.26,-2445.35,6.01,236.73),
			side = vector4(-12.01,-2450.35,6.01,322.67),
			back = vector4(-5.77,-2452.67,6.01,57.87),
			bay = "D12",
		},
		[35] = {
			front = vector4(-14.72,-2443.24,6.01,235.48),
			side = nil,
			back = vector4(-4.21,-2450.47,6.01,59.03),
			bay = "D13",
		},
		[36] = {
			front = vector4(-13.17,-2440.99,6.01,235.03),
			side = nil,
			back = vector4(-2.69,-2448.27,6.01,56.51),
			bay = "D14",
		},
		[37] = {
			front = vector4(-11.71,-2438.88,6.01,234.91),
			side = nil,
			back = vector4(-1.2,-2446.12,6.01,58.01),
			bay = "D15",
		},
		[38] = {
			front = vector4(-10.22,-2436.82,6.01,242.12),
			side = vector4(-4.01,-2439.06,6.01,145.86),
			back = vector4(0.29,-2443.99,6.01,58.18),
			bay = "D16",
		},
		[39] = {
			front = vector4(-83.45,-2474.61,6.03,238.71),
			side = vector4(-79.23,-2479.54,6.03,320.38),
			back = vector4(-72.94,-2481.81,6.03,61.92),
			bay = "F01",
		},
		[40] = {
			front = vector4(-82.0,-2472.41,6.03,235.17),
			side = nil,
			back = vector4(-71.48,-2479.81,6.03,49.95),
			bay = "F02",
		},
		[41] = {
			front = vector4(-80.41,-2470.28,6.03,237.89),
			side = nil,
			back = vector4(-69.94,-2477.53,6.03,56.78),
			bay = "F03",
		},
		[42] = {
			front = vector4(-78.94,-2468.01,6.03,235.34),
			side = nil,
			back = vector4(-68.41,-2475.33,6.03,55.38),
			bay = "F04",
		},
		[43] = {
			front = vector4(-77.39,-2465.97,6.02,235.18),
			side = vector4(-71.21,-2468.2,6.03,145.42),
			back = vector4(-66.93,-2473.28,6.03,51.67),
			bay = "F05",
		},
		[44] = {
			front = vector4(-94.85,-2466.5,6.02,236.83),
			side = vector4(-90.47,-2471.67,6.02,327.33),
			back = vector4(-84.45,-2473.86,6.03,58.78),
			bay = "F06",
		},
		[45] = {
			front = vector4(-135.7,-2451.68,6.02,234.04),
			side = vector4(-129.44,-2454.02,6.02,147.77),
			back = vector4(-125.2,-2458.89,6.02,57.1),
			bay = "E26",
		},
		[46] = {
			front = vector4(-137.18,-2453.8,6.02,234.76),
			side = nil,
			back = vector4(-126.72,-2461.05,6.02,56.37),
			bay = "E25",
		},
		[47] = {
			front = vector4(-138.7,-2455.93,6.02,237.77),
			side = nil,
			back = vector4(-128.19,-2463.19,6.02,56.48),
			bay = "E24",
		},
		[48] = {
			front = vector4(-140.24,-2458.15,6.02,231.87),
			side = nil,
			back = vector4(-129.72,-2465.38,6.03,55.69),
			bay = "E23",
		},
		[49] = {
			front = vector4(-141.76,-2460.3,6.02,237.55),
			side = vector4(-137.4,-2465.24,6.02,329.89),
			back = vector4(-131.23,-2467.52,6.03,59.44),
			bay = "E22",
		},
	}
}



Config.Cities = {
	"Jakarta, Indonesia",
	"Moscow, Russia",
	"Shanghai, China",
	"Busan, South Korea",
	"Hong Kong, China",
	"Rotterdam, Netherlands",
	"Los Angeles, USA",
	"New York-New Jersey, USA",
	"Valencia, Spain",
	"Ho Chi Minh City, Vietnam",
	"Manila, Philippines",
	"Tokyo, Japan",
	"Mundra, India",
	"Santos, Brazil",
	"Port Said, Egypt",
	"Barcelona, Spain",
	"Vancouver, Canada",
	"Halifax, Canada",
	"Montreal, Canada",
	"Saint John, Canada",
	"Toronto, Canada",
	"Houston, USA",
	"New Orleans, USA",
	"Baltimore, USA",
	"Boston, USA",
	"Singapore",
	"Shenzhen, China",
	"Ningbo-Zhoushan, China",
	"Guangzhou, China",
	"Qingdao, China",
	"Tianjin, China",
	"Jebel Ali, UAE",
	"Port Klang, Malaysia",
	"Antwerp, Belgium",
	"Kaohsiung, Taiwan",
	"Melbourne, Australia",
	"Brisbane, Australia",
	"Saint Petersburg, Russia",
}

Config.Cargo = {
	[1] = {
		"Hazardous Waste, Solid",
		"Hazardous Waste, Liquid",
		"Propane, Frozen Solid",
		"Nitrogen, Refrigerated Liquid",
		"Ethane, Pressurized Gas",
	},
	[2] = {
		"16 pallets, Cola Drinks",
		"41 boxes, Chocolate Bars",
		"21 crates, Alcoholic Beverages",
		"32 cartons, Cigarettes",
		"29 boxes, Lighters",
	},
	[3] = {
		"56 crates, E-Cigarettes",
		"41 cartons, Cigarettes",
		"83 boxes, Imported Cigars",
		"12 pallets, Smoking Tobacco",
		"39 boxes, Chewing Tobacco",
	},
	[4] = {
		"Vinyl Chloride, Flammable Gas",
		"Sulfuric Acid, Refrigerated Liquid",
		"Tetrabutyltin, Corrosive Liquid",
		"Potassium Bromate, Crystalized Chemical",
		"Formaldehyde, Frozen Liquid",
	},
	[5] = {
		"Dichloromethane, Pressurized Gas",
		"Benzyl Chloride, Frozen Liquid",
		"Petroleum Jelly, Gelatinous",
		"Vanadium Pentoxide, Powdered Chemical",
		"Sodium Hydroxide, Refrigerated Liquid",
	},
	[6] = {
		"12 pallets, Running Shoes",
		"47 boxes, Tracksuit Pants",
		"14 crates, Winter Masks",
		"83 boxes, Sports Hats",
		"12 boxes, Tracksuit Jackets",
	},
	[7] = {
		"56 cases, Bandage Shears",
		"32 boxes, Painkillers",
		"63 boxes, Medical Supply Bandage",
		"Ammonia, Pressurized Liquid",
		"Benzene, Refrigerated Liquid",
	},
	[8] = {
		"30 pallets, Frozen Pizza",
		"13 pallets, Soft Drinks",
		"28 boxes, Fishy Stix",
		"16 crates, Orange Juice",
		"102 pallets, Potato Chips",
	},
	[9] = {
		"12 boxes, Scalpel Sets",
		"Nitrous Oxide, Pressurized Gas",
		"4 pallets, Dental Chairs",
		"35 boxes, Orthodontic Braces",
		"67 boxes, Dental Extraction Forceps",
	},
	[10] = {
		"Glyphosate, Liquid Herbicide",
		"Methyl Bromide, Pesticide Gas",
		"Red Phosporus, Powdered Plant Nutrient",
		"Nicotine Powder, Toxic Insecticide",
		"Atrazine, Liquid Herbicide",
	},
	[11] = {
		"72 pallets, Plain Flour",
		"43 pallets, Canned Tuna",
		"129 pallets, Crackles Breakfast Cereal",
		"2 pallets, Strawberry Rails Breakfast Cereal",
		"51 crates, Apple Juice",
	},
	[12] = {
		"68 crates, Fresh Mango",
		"782 boxes, Chewing Gum",
		"12 boxes, Baking Soda",
		"82 pallets, Hot Sauce",
		"354 pallets, Ramen Noodles",
	},
	[13] = {
		"15 crates, Sunglasses",
		"42 pallets, Cloth Bolts",
		"12 boxes, Wool Socks",
		"48 crates, Leather Jackets",
		"122 pallets, Magazine Publications",
	},
	[14] = {
		"14 pallets, Rose Buds",
		"24 pallets, Pink Carnations",
		"18 pallets, Yellow Chrysanthemums",
		"21 pallets, Red Poppies",
		"33 pallets, Pink Lilies",
	},
	[15] = {
		"92 pallets, Canned Corn",
		"65 pallets, Coffee Beans",
		"48 crates, Mayonnaise",
		"14 pallets, Canned Peas",
		"71 boxes, Various Nuts",
	},
	[16] = {
		"Acrylonite, Pressurized Liquid",
		"Hydrazine, Flammable Chemical",
		"Hydrochloric Acid, Refrigerated Liquid",
		"Mercury, Liquid Chemical",
		"Sulphur Dioxide, Pressurized Gas",
	},
	[17] = {
		"102 crates, Cigars",
		"12 pallets, Top Hats",
		"702 boxes, Hot Dogs",
		"300 crates, Condiments",
		"443 crates, Hot Dog Buns",
	},
	[18] = {
		"42 pallets, Computer Parts",
		"29 boxes, Laptops",
		"2 pallets, Office Chairs",
		"10 crates, Computer Cables",
		"91 pallets, Computer Monitors",
	},
	[19] = {
		"15 pallets, Vehicle Parts",
		"82 pallets, Fenders",
		"92 crates, Car Tires",
		"45 crates, Steering Wheels",
		"22 pallets, Car Windshields",
	},
	[20] = {
		"12 boxes, Precious Gems",
		"102 crates, Unrefined Gold",
		"4 crates, Refined Copper",
		"44 pallets, Refined Aluminum",
		"111 crates, Unrefined Iron",
	},
	[21] = {
		"46 pallets, Corn",
		"11 pallets, Cucumber",
		"90 pallets, Watermelon",
		"23 pallets, Eggplant",
		"26 crates, Adult Toys",
	},
	[22] = { 
		"54 crates, Apples",
		"91 crates, Dragonfruit",
		"54 crates, Grapfruit",
		"12 pallets, Grapes",
		"78 boxes, Blueberries",
	},
	[23] = {
		"12 Sectional Couches",
		"8 Mattresses",
		"12 pallets, Lamps",
		"84 Side Tables",
		"9 boxes, Alarm Clocks",
	},
	[24] = {
		"12 pallets, Sugar",
		"77 crates, Cinnamon",
		"54 boxes, Tarragon",
		"90 crates, Black Pepper",
		"4 pallets, Sea Salt",
	},
	[25] = { 
		"43 pallets, Vulcanized Rubber",
		"12 pallets, Recycled Plastic",
		"78 crates, Empty Plastic Bottles",
		"32 pallets, Cardboard Boxes",
		"44 pallets, Recycled Glass",
	},
}