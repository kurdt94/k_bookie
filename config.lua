-------------------
---Bookie  v1.B0---
---GLOBAL CONFIG---
-------------------
---

Config = {}

Config.max_pot = 150
Config.min_bet = 5
Config.max_bet = 20
Config.step = 1
Config.time_till_next_match = 60000 -- Ms
Config.prompt_group_name = "Bookie" --Main Prompt Group Name
Config.start_control = 0xC7B5340A -- [ENTER]
Config.start_control_name = "Place Bet" --Place Bet
Config.bet_control = 0x6319DB71 -- [UP]
Config.bet_control_down = 0x05CA7C52 -- [DOWN]
Config.bet_control_name = "Bet $ "
Config.select_control = 0xDEB34313 -- [RIGHT]
Config.debugger = false
Config.show_names = true
Config.show_bookie_pot = true
Config.fake_bets = true
--- Max of 2 Players ( fighters )
Config.players = {
    [1] = {
        ped = nil,
        pos = {X= -245.25675964355, Y= 663.33233642578, Z= 112.34589385986, H= 277.64520263672},
        model = "U_M_M_AsbPrisoner_01",
        voice = "0130_G_M_M_UNICRIMINALS_01_WHITE_01",
        fake_name = "Bob Lazar",
        isNetwork = true,
        max_health = 200,
    },
    [2] = {
        ped = nil,
        pos= {X= -227.55389404297, Y= 667.76770019531, Z= 112.30582427979, H= 103.1782913208},
        model= "U_M_M_AsbPrisoner_02",
        voice= "0131_G_M_M_UNICRIMINALS_01_WHITE_02",
        fake_name = "Eric Smith",
        isNetwork = true,
        max_health = 200,
    },
}
--- One (or more) Bookies
Config.bookies = {
    [1] = {
        ped = nil,
        --pos = {X= -237.13830566406, Y= 655.77703857422, Z= 112.32099914551, H= 322.51000976563},
        pos = {X= -240.97523498535, Y= 658.92657470703, Z= 112.32802581787, H= 156.49337768555},
        model = "U_M_M_ARMUNDERTAKER_01",
        voice = "1080_U_M_M_ARMUNDERTAKER_01",
        fake_name = "Bookmaker",
        isNetwork = false,
    },
}