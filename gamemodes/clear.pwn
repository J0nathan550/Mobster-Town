#include <a_samp>
#include <Pawn.CMD>
#include <streamer>
#include <foreach>
#include <sscanf2>
#include <Pawn.Regex>
#include <a_mysql>

#define MYSQL_HOST "localhost"
#define MYSQL_USER "root"
#define MYSQL_PASS ""
#define MYSQL_BASE "clearProject"

#define SCM SendClientMessage
#define SCMTA SendClientMessageToAll
#define SPD ShowPlayerDialog

#define COLOR_WHITE 0xffffffAA
#define COLOR_GRAY 0x535353AA
#define COLOR_RED 0xff0000AA
#define COLOR_GREEN 0x34bd19AA

new MYSQL:dbHandle;

enum playerClass {
	ID,
	NAME[MAX_PLAYER_NAME],
	PASSWORD[32],
}

new player_Info[MAX_PLAYERS][playerClass];

enum serverDialogs{
	DLG_NONE,
	DLG_REG,
	DLG_LOG,
}

main()
{
	print("\n----------------------------------");
	print("Clear Project started!");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	SetGameModeText("Clear Project");
	AddPlayerClass(102, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // clear maybe later
	
	ConnectMySQL();
	return 1;
}

stock ConnectMySQL(){
	dbHandle = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_BASE);
	
	switch(mysql_errno()) {
		case 0: print("MYSQL is working! Hello J0nathan!\n");
		default: print("MYSQL is not working!! Something ain't right..");
	}
	mysql_log(ERROR | WARNING);
	mysql_set_charset("cp1251");
}


public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	GetPlayerName(playerid, player_Info[playerid][NAME], MAX_PLAYER_NAME);
	static const fmt_query[] = "SELECT `id` FROM `users` WHERE `name` = '%s'";
	new query[sizeof(fmt_query) + (-2 + MAX_PLAYER_NAME)];
	format(query, sizeof(query), fmt_query, player_Info[playerid][NAME]);
	mysql_tquery(dbHandle, query, "checkReg", "i", playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	return 1;
}
//reg
forward checkReg(playerid);

public checkReg(playerid){
	new rows;
	cache_get_row_count(rows);
	if(rows) showLogin(playerid);
	else showReg(playerid);
}

stock showLogin(playerid){
	SCM(playerid, COLOR_WHITE, "Player is registered!");
}

stock showReg(playerid){
	SCM(playerid, COLOR_RED, "Player is not registered!");
}

public OnPlayerDisconnect(playerid, reason)
{
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
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
