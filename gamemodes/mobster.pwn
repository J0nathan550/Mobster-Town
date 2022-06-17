#include <a_samp>
#include <Pawn.CMD>
#include <sampvoice>
#include <sscanf2>
#include <fly>

#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xece807AA
#define COLOR_GREEN 0x3cd217AA
#define COLOR_PURPLE 0xd919f7AA
#define COLOR_BLUE 0x006fffAA

#define COLOR_GANGFREEZE 0x888888AA
#define COLOR_GROVE 0x21ac15AA
#define COLOR_BALLAS 0xd919f7AA
#define COLOR_VAGOS 0xf7d600AA
#define COLOR_AZTEC 0x00f9b6AA
#define COLOR_RIFA 0x531affAA
#define COLOR_CHINA 0xf72602AA
#define COLOR_VIETNAM 0x99c31fAA
#define COLOR_RUSSIANMAFIA 0x096ec8AA
#define COLOR_ITALIANMAFIA 0xdb740cAA

new SV_GSTREAM:gstream = SV_NULL;
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };

// maximum amount of gangzones
new gangzone[4096];

//pickups
new pickup_Garage;
new pickup_Bar;

enum Player_Info
{
	ID,
	NICKNAME,
	LVL,
	PASS,
	SALT,
	EMAIL,
	SKIN,
	GUNS,
	HEALTH,
	ARMOR
}

enum Dialogs
{
	DIALOG_HELP,
	DIALOG_FIGHTSTYLE,
}

main()
{
	print("\n----------------------------------");
	print("Mobster Town started!");
	print("----------------------------------\n");

}

public OnGameModeInit()
{
	SetGameModeText("Mobster Town");
	AddPlayerClass(102, 1958.3783, 1343.1572, 15.3746, 269.1425, 0,0,0,0,0,0);
    gstream = SvCreateGStream(0xffff0000, "Global");
    
    Mapping();

	return 1;
}

public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid)
{
    // Attach player to local stream as speaker if 'B' key is pressed
    if (keyid == 0x42 && lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);
    // Attach the player to the global stream as a speaker if the 'Z' key is pressed
    if (keyid == 0x5A && gstream) SvAttachSpeakerToStream(gstream, playerid);
}

public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    // Detach the player from the local stream if the 'B' key is released
    if (keyid == 0x42 && lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
    // Detach the player from the global stream if the 'Z' key is released
    if (keyid == 0x5A && gstream) SvDetachSpeakerFromStream(gstream, playerid);
}


public OnGameModeExit()
{
	if (gstream) SvDeleteStream(gstream);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

stock Mapping()
{
	//mapping
	
    //pickups
    pickup_Garage = CreatePickup(1441, 1, 2035.0396, 1361.6172, 10.8203);
    pickup_Bar = CreatePickup(1441, 1, 2034.8722, 1367.0808, 10.8203);
    //gangzones (LV)
    gangzone[0] = GangZoneCreate(2780.1306, 836.9087, 2893.1174, 1022.8575);
    GangZoneShowForAll(gangzone[0], COLOR_ITALIANMAFIA);
    
    gangzone[1] = GangZoneCreate(2716.3254, 913.1459, 2558.7681,784.5040);
    GangZoneShowForAll(gangzone[1], COLOR_ITALIANMAFIA);
    
    gangzone[2] = GangZoneCreate(2695.6702,766.2436, 2500.8196,685.3663);
    GangZoneShowForAll(gangzone[2], COLOR_ITALIANMAFIA);
    
    gangzone[3] = GangZoneCreate(2466.7202,755.2827, 2275.6660,626.3752);
    GangZoneShowForAll(gangzone[3], COLOR_ITALIANMAFIA);
    
    gangzone[4] = GangZoneCreate(2145.0220,627.0905, 2278.3235,719.1583);
    GangZoneShowForAll(gangzone[4], COLOR_ITALIANMAFIA);
    
    gangzone[5] = GangZoneCreate(2139.2815,794.8557, 1994.2645,663.0446);
    GangZoneShowForAll(gangzone[5], COLOR_ITALIANMAFIA);
    
    gangzone[6] = GangZoneCreate(1982.4894,627.5399, 1865.7662,779.7348);
    GangZoneShowForAll(gangzone[6], COLOR_ITALIANMAFIA);
    
    gangzone[7] = GangZoneCreate(1578.7458,782.1077, 1757.0007,663.7283);
    GangZoneShowForAll(gangzone[7], COLOR_ITALIANMAFIA);
    
    gangzone[8] = GangZoneCreate(1556.3108, 795.6321, 1398.5050,664.5108);
    GangZoneShowForAll(gangzone[8], COLOR_ITALIANMAFIA);
    
    gangzone[9] = GangZoneCreate(1558.6066,904.7491, 1502.2683,1141.9264);
    GangZoneShowForAll(gangzone[9], COLOR_ITALIANMAFIA);
    
    gangzone[10] = GangZoneCreate(1496.4453,1122.3997,1338.4067,975.7130);
    GangZoneShowForAll(gangzone[10], COLOR_ITALIANMAFIA);
    
    gangzone[11] = GangZoneCreate(1036.2841,939.6501, 1177.0286,1180.9656);
    GangZoneShowForAll(gangzone[11], COLOR_ITALIANMAFIA);
    
    gangzone[12] = GangZoneCreate(1176.8467,1204.3909, 1016.3938,1366.7909);
    GangZoneShowForAll(gangzone[12], COLOR_ITALIANMAFIA);
    
    gangzone[13] = GangZoneCreate(1018.8672,1392.7798, 1175.8083,1701.8917);
    GangZoneShowForAll(gangzone[13], COLOR_ITALIANMAFIA);
    
    gangzone[14] = GangZoneCreate(1179.3691,1823.8394, 1017.7008,2043.9038);
    GangZoneShowForAll(gangzone[14], COLOR_ITALIANMAFIA);
    
    gangzone[15] = GangZoneCreate(1000.1537,1945.8191, 905.4627,1843.2915);
    GangZoneShowForAll(gangzone[15], COLOR_ITALIANMAFIA);
    
    gangzone[16] = GangZoneCreate(898.5928,1963.1521, 1016.6399,2182.9219);
    GangZoneShowForAll(gangzone[16], COLOR_ITALIANMAFIA);
    
    gangzone[17] = GangZoneCreate(1016.7376,2200.0251, 897.8315,2287.3293);
    GangZoneShowForAll(gangzone[17], COLOR_ITALIANMAFIA);
    
    gangzone[18] = GangZoneCreate(914.3967,2299.6057, 1096.2544,2456.7026);
    GangZoneShowForAll(gangzone[18], COLOR_ITALIANMAFIA);
    
    gangzone[19] = GangZoneCreate(1197.4751,2516.8132, 1529.0580,2717.8523);
    GangZoneShowForAll(gangzone[19], COLOR_ITALIANMAFIA);
    
    gangzone[20] = GangZoneCreate(1533.2119,2724.5818, 1419.2827,2881.7192);
    GangZoneShowForAll(gangzone[20], COLOR_ITALIANMAFIA);
    
    gangzone[21] = GangZoneCreate(1534.9121,2864.7944, 1696.7251,2722.9924);
    GangZoneShowForAll(gangzone[21], COLOR_ITALIANMAFIA);
    
    gangzone[22] = GangZoneCreate(1703.4019,2724.3206, 1916.1505,2881.9741);
    GangZoneShowForAll(gangzone[22], COLOR_ITALIANMAFIA);
    
    gangzone[23] = GangZoneCreate(1917.3105,2782.8801, 2137.7820,2630.1206);
    GangZoneShowForAll(gangzone[23], COLOR_ITALIANMAFIA);
    
    gangzone[24] = GangZoneCreate(2138.0933, 2842.4434, 2236.7292,2778.5459);
    GangZoneShowForAll(gangzone[24], COLOR_ITALIANMAFIA);
    
    gangzone[25] = GangZoneCreate(2237.0288,2767.0828, 2097.3333,2699.4451);
    GangZoneShowForAll(gangzone[25], COLOR_ITALIANMAFIA);
    
    gangzone[26] = GangZoneCreate(2237.9451,2822.8420, 2397.1304,2722.8420);
    GangZoneShowForAll(gangzone[26], COLOR_ITALIANMAFIA);

	gangzone[27] = GangZoneCreate(1866.6665,1069.9446, 1854.9214,1087.7604);
    GangZoneShowForAll(gangzone[28], COLOR_ITALIANMAFIA);

	gangzone[28] = GangZoneCreate(2027.2742,1103.5626, 1837.7408,1263.3098);
    GangZoneShowForAll(gangzone[28], COLOR_ITALIANMAFIA);

    gangzone[29] = GangZoneCreate(1837.8186,1283.5619,1976.9702,1442.7234);
    GangZoneShowForAll(gangzone[29], COLOR_ITALIANMAFIA);

    gangzone[30] = GangZoneCreate(2087.6072,1443.5372, 2182.2085,1523.0677);
    GangZoneShowForAll(gangzone[30], COLOR_ITALIANMAFIA);

    gangzone[31] = GangZoneCreate(2195.9153,1522.9434, 2234.7583,1432.3925);
    GangZoneShowForAll(gangzone[31], COLOR_ITALIANMAFIA);

    gangzone[32] = GangZoneCreate(2236.5596,1422.7924, 2088.2422,1384.0930);
    GangZoneShowForAll(gangzone[32], COLOR_ITALIANMAFIA);

    gangzone[33] = GangZoneCreate(2257.5818,1383.4468, 2357.0093,1522.7397);
    GangZoneShowForAll(gangzone[33], COLOR_ITALIANMAFIA);

    gangzone[34] = GangZoneCreate(2378.4990,1522.2550, 2416.4883,1483.3832);
    GangZoneShowForAll(gangzone[34], COLOR_ITALIANMAFIA);

    gangzone[35] = GangZoneCreate(2417.2864,1463.5771, 2376.9333,1381.6709);
    GangZoneShowForAll(gangzone[35], COLOR_ITALIANMAFIA);

    gangzone[36] = GangZoneCreate(2417.1096,1363.5779, 2087.3821,1203.3601);
    GangZoneShowForAll(gangzone[36], COLOR_ITALIANMAFIA);

    gangzone[37] = GangZoneCreate(2082.9036,1183.2590,2337.1587,983.5641);
    GangZoneShowForAll(gangzone[37], COLOR_ITALIANMAFIA);

    gangzone[38] = GangZoneCreate(2273.5618,966.7815 , 2234.3115,943.8890);
    GangZoneShowForAll(gangzone[38], COLOR_ITALIANMAFIA);

    gangzone[39] = GangZoneCreate(2217.1514,961.0815, 2159.8223,925.3903);
    GangZoneShowForAll(gangzone[39], COLOR_ITALIANMAFIA);

    gangzone[40] = GangZoneCreate(2137.1047,962.5212, 2098.1313,883.9355);
    GangZoneShowForAll(gangzone[40], COLOR_ITALIANMAFIA);

    gangzone[41] = GangZoneCreate(2357.4350,963.4935, 2417.7024,1067.2642);
    GangZoneShowForAll(gangzone[41], COLOR_ITALIANMAFIA);

    gangzone[42] = GangZoneCreate(2437.1692,1063.5051, 2517.7383,1023.0013);
    GangZoneShowForAll(gangzone[42], COLOR_ITALIANMAFIA);

    gangzone[43] = GangZoneCreate(2534.3108,1004.2103, 2496.6101,961.9875);
    GangZoneShowForAll(gangzone[43], COLOR_ITALIANMAFIA);

    gangzone[44] = GangZoneCreate(2477.3110,963.3362, 2437.6125,1003.3688);
    GangZoneShowForAll(gangzone[44], COLOR_ITALIANMAFIA);

    gangzone[45] = GangZoneCreate(2457.8521,942.3980, 2536.4670,904.1665);
    GangZoneShowForAll(gangzone[45], COLOR_ITALIANMAFIA);

    gangzone[46] = GangZoneCreate(2855.6775,1228.2167, 2798.3459,1382.3074);
    GangZoneShowForAll(gangzone[46], COLOR_ITALIANMAFIA);

    gangzone[47] = GangZoneCreate(1197.4751,2516.8132, 1529.0580,2717.8523);
    GangZoneShowForAll(gangzone[47], COLOR_ITALIANMAFIA);

    gangzone[48] = GangZoneCreate(2597.0095,1483.6498, 2438.1936,1602.4409);
    GangZoneShowForAll(gangzone[48], COLOR_ITALIANMAFIA);

    gangzone[49] = GangZoneCreate(2537.2227,1622.7201, 2337.5513,1703.6000);
    GangZoneShowForAll(gangzone[49], COLOR_ITALIANMAFIA);
}


public OnPlayerConnect(playerid)
{
	// Checking for plugin availability
    if (SvGetVersion(playerid) == SV_NULL)
    {
        SendClientMessage(playerid, -1, "Could not find plugin sampvoice.");
    }
    // Checking for a microphone
    else if (SvHasMicro(playerid) == SV_FALSE)
    {
        SendClientMessage(playerid, -1, "The microphone could not be found.");
    }
    // Create a local stream with an audibility distance of 40.0, an unlimited number of listeners
    // and the name 'Local' (the name 'Local' will be displayed in red in the players' speakerlist)
    else if ((lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0xff0000ff, "Local")))
    {
        SendClientMessage(playerid, COLOR_GREEN, "Press Z to talk to global chat and B to talk to local chat!");

        // Attach the player to the global stream as a listener
        if (gstream) SvAttachListenerToStream(gstream, playerid);

        // Assign microphone activation keys to the player
        SvAddKey(playerid, 0x42);
        SvAddKey(playerid, 0x5A);
    }

	Mapping();
 	InitFly(playerid);
	
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	// Removing the player's local stream after disconnecting
    if (lstream[playerid])
    {
        SvDeleteStream(lstream[playerid]);
        lstream[playerid] = SV_NULL;
    }
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

CMD:givegun(playerid, params[])
{
	if(sscanf(params, "ii", params[0], params[1])) return SendClientMessage(playerid, COLOR_RED, !"/givegun [ID (1-46)], [Amount (0 - 10000)]");
	if(params[0] < 1 || params[0] > 46) return SendClientMessage(playerid, COLOR_RED, !"You can only pick ID 1-46!");
 	if(params[1] < 1 || params[1] > 10000) return SendClientMessage(playerid, COLOR_RED, !"You can only have 1 - 10000, amount of bullets!");
	GivePlayerWeapon(playerid, params[0], params[1]);
	
    return 1;
}
CMD:kill(playerid, params[])
{
	SetPlayerHealth(playerid, -1);

    return 1;
}
CMD:fightstyle(playerid, params[])
{
	if(sscanf(params, "i", params[0])) return ShowPlayerDialog(playerid, DIALOG_FIGHTSTYLE, DIALOG_STYLE_LIST, "Fightstyle - Select Fightstyle!","{FFFFFF}Normal Style\n{ffbf00}Boxing Style\n{ff006a}Kungfu Style\n{00ff44}Kneehead Style\n{00b3ff}Grabkick Style","Select","Close");
	if(params[0] < 4 || params[0] > 15) return SendClientMessage(playerid, COLOR_RED, !"You can only pick ID 4-15!");
	switch(params[0])
	{
		case 4: SendClientMessage(playerid, COLOR_BLUE, "Fightstyle set: Normal!");
		case 5: SendClientMessage(playerid, COLOR_BLUE, "Fightstyle set: Boxing!");
		case 6: SendClientMessage(playerid, COLOR_BLUE, "Fightstyle set: Kungfu!");
		case 7: SendClientMessage(playerid, COLOR_BLUE, "Fightstyle set: Kneehead!");
		case 15: SendClientMessage(playerid, COLOR_BLUE, "Fightstyle set: Grabkick!");
		default: return SendClientMessage(playerid, COLOR_RED, "Invalid ID of fighting style!");
	}
	SetPlayerFightingStyle(playerid, params[0]);
    return 1;
}
CMD:setskin(playerid, params[])
{
	if(sscanf(params, "i", params[0])) return SendClientMessage(playerid, COLOR_RED, !"/setskin (0-311)");
	if(params[0] < 1 || params[0] > 311) return SendClientMessage(playerid, COLOR_RED, !"You can only pick ID 0-311!");
	SendClientMessage(playerid, COLOR_GREEN, "Skin successfully changed!");
	SetPlayerSkin(playerid, params[0]);
    return 1;
}
CMD:veh(playerid, params[])
{
	if(sscanf(params, "iii", params[0], params[1], params[2])) return SendClientMessage(playerid, COLOR_RED, !"/veh (400-611), (color1 0-255), (color2 0-255)");
	if(params[0] < 400 || params[0] > 611) return SendClientMessage(playerid, COLOR_RED, !"You can only pick ID number of 400-611!");
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
 	CreateVehicle(params[0], x + 5, y, z, 0, params[1], params[2], -1, 0);
	SendClientMessage(playerid, COLOR_GREEN, "Car successfully created!");
	return 1;
}
CMD:delveh(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid == 0) SendClientMessage(playerid, COLOR_RED, "Sit in the car first!");
	DestroyVehicle(vehicleid);
	SendClientMessage(playerid, COLOR_GREEN, "Car successfully destroyed!");
	return 1;
}
CMD:fixcar(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid == 0) SendClientMessage(playerid, COLOR_RED, "Sit in the car first!");
	RepairVehicle(vehicleid);
	SendClientMessage(playerid, COLOR_GREEN, "Car successfully repaired!");
	return 1;
}
CMD:fly(playerid, params[])
{
	StartFly(playerid);
}
CMD:stopfly(playerid, params[])
{
	StopFly(playerid);
}


public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == pickup_Garage)
	{
        SetPlayerPos(playerid, 611.35,-147.55,997.99);
        SetPlayerInterior(playerid, 2);
	}
	else if(pickupid == pickup_Bar)
	{
        SetPlayerPos(playerid, 501.95,-70.56,998.75);
        SetPlayerInterior(playerid, 11);
	}
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_HELP:
		{
			if(response)
			{
				return 1;
			}
		}
		case DIALOG_FIGHTSTYLE:
		{
		    switch(listitem)
			{
				case 0: SetPlayerFightingStyle(playerid, 4);
			    case 1: SetPlayerFightingStyle(playerid, 5);
			    case 2: SetPlayerFightingStyle(playerid, 6);
			    case 3: SetPlayerFightingStyle(playerid, 7);
			    case 4: SetPlayerFightingStyle(playerid, 15);
			}
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
