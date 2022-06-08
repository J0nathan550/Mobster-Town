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
#define COLOR_BLUE 0x0089cdAA


new MYSQL:dbHandle;

enum playerClass {
	ID,
	REGDATA[13],
	REGIP[16],
	NAME[MAX_PLAYER_NAME],
	PASSWORD[65],
	SALT[11],
	EMAIL[65],
	REFERAL,
	GENDER,
	RACE,
	AGE,
	SKIN,
}

new player_Info[MAX_PLAYERS][playerClass];

enum serverDialogs{
	DLG_NONE,
	DLG_REG,
	DLG_MAIL,
	DLG_REF,
	DLG_GENDER,
	DLG_RACE,
	DLG_AGE,
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

	Mapping();

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
	TogglePlayerSpectating(playerid, 1);
	
	//InterpolateCameraPos(playerid, );
	//InterpolateCameraLookAt(playerid, );
	
	static const fmt_query[] = "SELECT `id` FROM `users` WHERE `name` = '%s'";
	new query[sizeof(fmt_query) + (-2 + MAX_PLAYER_NAME)];
	format(query, sizeof(query), fmt_query, player_Info[playerid][NAME]);
	mysql_tquery(dbHandle, query, "checkReg", "i", playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	return 1;
}
//reg
forward checkReg(playerid);

public checkReg(playerid)
{
	new rows;
	cache_get_row_count(rows);
	if(rows) showLogin(playerid);
	else showReg(playerid);
}

stock showLogin(playerid)
{
	SCM(playerid, COLOR_WHITE, "Player is registered!");
}

stock showReg(playerid){
	new dialog[440 + (-2 + MAX_PLAYER_NAME)];
	format(dialog, sizeof(dialog),
	"{FFFFFF}\t��������� {0089cd}%s,{FFFFFF} ����� ���������� �� {0089cd}�Clean Project�{FFFFFF}\n\
	\t\t\t{f21956}�������� � ����� ����� �� ����������.{ffffff}\n\
	��� ���� �� ����� ������� �� ������ ������ �����������.\n\n\
 	���������� ������� ������ ��� ������ �������� �������� � ������� \"�����\"\n\
	{f27719}����������:\n\
	������ ������ ���� �� {FFFFFF}8-��{F27719} �� {FFFFFF}32-��{F27719} ��������.\n\
	������ ������ �������� ������ �� ���� � ��������� ��������.", player_Info[playerid][NAME]);
	SPD(playerid, DLG_REG, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � ������", dialog, "�����", "�����");
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
	switch(dialogid)
	{
	    case DLG_REG:
		{
			if(response)
			{
				if(!strlen(inputtext))
				{
					showReg(playerid);
					return SCM(playerid, COLOR_RED, "������ ������ �������� �� {FFFFFF}8-��{FF0000} �� {FFFFFF}32-��{FF0000} ��������!");
				}
				if(strlen(inputtext) < 8 || strlen(inputtext) > 32)
				{
					showReg(playerid);
					return SCM(playerid, COLOR_RED, "����� ������ ������ ���� �� {FFFFFF}8-��{FF0000} �� {FFFFFF}32-��{FF0000} ��������!");
				}
				new regex:rg_checkpass = Regex_New("^[a-zA-Z0-9]{1,}$");
				if(Regex_Check(inputtext,rg_checkpass))
				{
				    new salt[11];
				    for(new i; i < 10; i++)
					{
					    salt[i] = random(78) + 46;
					}
					salt[10] = 0;
					SHA256_PassHash(inputtext, salt, player_Info[playerid][PASSWORD], 65);
					strmid(player_Info[playerid][SALT], salt, 0, 11, 11);
					//strmid(player_Info[playerid][PASSWORD], inputtext, 0, strlen(inputtext), 32);
					SPD(playerid, DLG_MAIL, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � Email", "{FFFFFF}������� ��� ��������� {0089cd}E-mail{FFFFFF} ����� � ���� ����\n\
				 	����� �� ������ ������������ �������.", "�����", "����������");
				}
				else
				{
					showReg(playerid);
					Regex_Delete(rg_checkpass);
					return SCM(playerid, COLOR_RED, "������ ������ �������� ������ �� ���� � ��������� ��������!");
				}
				Regex_Delete(rg_checkpass);
			}
			else
			{
				SCM(playerid, COLOR_RED, "�� ���� ������� � �������. ���������� ������� �� ���� ��� �������� � ��� �������: \"/q\"");
				return Kick(playerid);
			}
		}
		case DLG_MAIL:
		{
			if(response)
			{
				if(!strlen(inputtext))
				{
					SPD(playerid, DLG_MAIL, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � Email", "{FFFFFF}������� ��� ��������� {0089cd}E-mail{FFFFFF} ����� � ���� ����\n\
				 	����� �� ������ ������������ �������.", "�����", "����������");
				 	return SCM(playerid, COLOR_RED, "���� �� ����� ���� ������!");
				}
				if(strlen(inputtext) < 4 || strlen(inputtext) > 64)
				{
					SPD(playerid, DLG_MAIL, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � Email", "{FFFFFF}������� ��� ��������� {0089cd}E-mail{FFFFFF} ����� � ���� ����\n\
				 	����� �� ������ ������������ �������.", "�����", "����������");
				 	return SCM(playerid, COLOR_BLUE, "E-mail {FF0000} ����� ������ �������� ����-�� �� 4 �� 64 ��������!");
				}
				new regex:rg_checkEmail = Regex_New("^[a-zA-Z0-9.-_]{1,43}@[a-zA-Z]{1,12}.[a-zA-Z]{1,8}$");
				if(Regex_Check(inputtext,rg_checkEmail))
				{
					strmid(player_Info[playerid][EMAIL], inputtext, 0, strlen(inputtext), 64);
					SPD(playerid, DLG_REF, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � �������", "{FFFFFF}������� ��� {0089cd}������{FFFFFF} ������������� ��� �� ������, � ��� ���������� {ffd500}5-��{FFFFFF} ������ �� �������� �������!\n\
					��� �������:\n\
					{5dd911}� 150.000${FFFFFF}\n\
					{b6e1d1}� + 3 ���� � ���������� ������.{FFFFFF}", "�����", "����������");
				}
				else
				{
					SPD(playerid, DLG_MAIL, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � Email", "{FFFFFF}������� ��� ��������� {0089cd}E-mail{FFFFFF} ����� � ���� ����\n\
				 	����� �� ������ ������������ �������.", "�����", "����������");
 					Regex_Delete(rg_checkEmail);
	                return SCM(playerid, COLOR_BLUE, "E-mail {FF0000} ����� ������ �������� �� ��������� ��������, �����, �����.");
				}
				Regex_Delete(rg_checkEmail);
			}
			else
			{
				SPD(playerid, DLG_REF, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � �������", "{FFFFFF}������� ��� {0089cd}������{FFFFFF} ������������� ��� �� ������, � ��� ���������� {ffd500}5-��{FFFFFF} ������ �� �������� �������!\n\
				��� �������:\n\
				{5dd911}� 150.000${FFFFFF}\n\
				{b6e1d1}� + 3 ���� � ���������� ������.{FFFFFF}", "�����", "����������");
				return SCM(playerid, COLOR_GREEN, "E-mail ������ ����� ����� �������� � ���� �������� ������������!");
			}
		}
		case DLG_REF:
		{
			if(response)
			{
				static const fmt_query[] = "SELECT * FROM `users` WHERE `name` = '%s'";
				new query[sizeof(fmt_query) + (-2 + MAX_PLAYER_NAME)];
				format(query, sizeof(query), fmt_query, inputtext);
				mysql_tquery(dbHandle, query, "checkReferal", "is", playerid, inputtext);
				SPD(playerid, DLG_GENDER, DIALOG_STYLE_MSGBOX, "{0089cd}Clean Project{ffffff} � ����������� � ����� ����","{FFFFFF}�������� ��� ������ �������� ���������:","�������","�������");
			}
			else
			{
			    SPD(playerid, DLG_GENDER, DIALOG_STYLE_MSGBOX, "{0089cd}Clean Project{ffffff} � ����������� � ����� ����","{FFFFFF}�������� ��� �������� ���������:    ","�������","�������");
				return SCM(playerid, COLOR_RED, "�� ������ �� ������� ������ ��� ������������� ��� ������!");
			}
		}
		case DLG_GENDER:
		{
			if(response)
			{
				player_Info[playerid][GENDER] = 1;
			}
			else
			{
				player_Info[playerid][GENDER] = 2;
			}
			SPD(playerid, DLG_RACE, DIALOG_STYLE_LIST ,"{0089cd}Clean Project{ffffff} � ����������� � ����� ����","{FFFFFF}�����������\n���������\n�����������","�������","");
		}
		case DLG_RACE:
		{
			player_Info[playerid][RACE] = listitem + 1;
			SPD(playerid, DLG_AGE, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � �������","{FFFFFF}�������� ������� ������ �������� ��������� �� 18-�� �� 60-��","�����","");
		}
		case DLG_AGE:
		{
			if(response)
			{
				if(!strlen(inputtext))
				{
					SPD(playerid, DLG_AGE, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � �������","{FFFFFF}�������� ������� ������ �������� ��������� �� 18-�� �� 60-��","�����","");
					return SCM(playerid, COLOR_RED, "���� �� ������ ���� ������!");
				}
				if(strval(inputtext) < 18 || strval(inputtext) > 60)
				{
					SPD(playerid, DLG_AGE, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � �������","{FFFFFF}�������� ������� ������ �������� ��������� �� 18-�� �� 60-��","�����","");
					return SCM(playerid, COLOR_RED, "������� ������ ���� �� ����� 18 � �� ����� 60!");
				}
				player_Info[playerid][AGE] = strval(inputtext);

				new maleSkins[9][4] = {
					{19,21,22,28},
					{24,25,36,67},
					{14,142,182,183},
					{29,96,101,26},
					{2,37,72,202},
					{1,3,234,290},
					{23,60,170,180},
					{20,47,48,206},
					{44,58,132,229}
				};
				new femaleSkins[9][2] = {
                    {13,69},
                    {9,190},
                    {10,218},
                    {41,56},
                    {31,151},
                    {39,89},
                    {169,193},
                    {207,225},
                    {54,130}
				};
			    new skinIndex;
			    switch(player_Info[playerid][RACE])
				{
					case 1: {}
					case 2: skinIndex += 2;
					case 3: skinIndex += 5;
				}
				switch(player_Info[playerid][AGE])
				{
					case 18..29: {}
					case 30..45: skinIndex+=2;
					case 46..60: skinIndex+=3;
				}
				if(player_Info[playerid][GENDER] == 1) player_Info[playerid][SKIN] = maleSkins[skinIndex][random(4)];
				else player_Info[playerid][GENDER] = femaleSkins[skinIndex][random(2)];

				new year,month,day;
				getdate(year, month, day);
				new date[13];
				format(date, sizeof(date), "%02d.%02d.%d", day, month, year);
			    new ip[16];
		     	GetPlayerIp(playerid, ip, sizeof(ip));

		    	static const fmt_query[] = "INSERT INTO `users` (`name`, `password`, `salt`, `email`, `referal`, `gender`, `race`, `age`, `skin`, `regData`, `regIP`) VALUES ('%s','%s','%s','%s','%d','%d','%d','%d','%d','%s','%s')";
				new query[sizeof(fmt_query) + (-2 + MAX_PLAYER_NAME) + (-2 + 64) + (-2 + 10) + (-2 + 64) + (-2 + 8) + (-2 + 1) + (-2 + 1) + (-2 + 2) + (-2 + 3) + (-2 + 12) + (-2 + 15)];
				format(query, sizeof(query), fmt_query, player_Info[playerid][NAME], player_Info[playerid][PASSWORD], player_Info[playerid][SALT], player_Info[playerid][EMAIL], player_Info[playerid][REFERAL], player_Info[playerid][GENDER], player_Info[playerid][RACE], player_Info[playerid][AGE], player_Info[playerid][SKIN], date, ip); //player_Info[playerid][]
				mysql_query(dbHandle, query);

				static const fmt_query2[] = "SELECT * FROM `users` WHERE `name` = '%s' AND `password` = '%s'";
				new query2[sizeof(fmt_query2) + (-2 + MAX_PLAYER_NAME) + (-2 + 64)];
				format(query2, sizeof(query), fmt_query2, player_Info[playerid][NAME], player_Info[playerid][PASSWORD]); //player_Info[playerid][]
				mysql_tquery(dbHandle, query2, "playerLogin", "i", playerid);

				SCM(playerid, COLOR_GREEN, "����������� ���������!");
			}
		}
	}
	return 1;
}

forward playerLogin(playerid);
public playerLogin(playerid)
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
	{
	    cache_get_value_name_int(0, "id", player_Info[playerid][ID]);
	    cache_get_value_name(0, "email", player_Info[playerid][EMAIL], 64);
	    cache_get_value_name_int(0, "referal", player_Info[playerid][REFERAL]);
	    cache_get_value_name_int(0, "gender", player_Info[playerid][GENDER]);
	    cache_get_value_name_int(0, "race", player_Info[playerid][RACE]);
	    cache_get_value_name_int(0, "skin", player_Info[playerid][SKIN]);
	    cache_get_value_name(0, "regData", player_Info[playerid][REGDATA], 64);
	    cache_get_value_name(0, "regIP", player_Info[playerid][REGIP], 64);
	    TogglePlayerSpectating(playerid, 0);
	    SetPVarInt(playerid, "logged", 1);
		SetSpawnInfo(playerid, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	    SpawnPlayer(playerid);
	}
	else
	{
	
	}
}

forward checkReferal(playerid, referal[]);
public checkReferal(playerid, referal[])
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
	{
		cache_get_value_name_int(0, "id", player_Info[playerid][REFERAL]);
		return SCM(playerid, COLOR_GREEN, "������� ������� �����!");
	}
	else
	{
		SPD(playerid, DLG_REF, DIALOG_STYLE_INPUT, "{0089cd}Clean Project{ffffff} � ����������� � �������", "{FFFFFF}������� ��� {0089cd}������{FFFFFF}������������� ��� �� ������, � ��� ���������� {ffd500}5-��{FFFFFF}������ �� �������� �������!\n\
 		��� �������:\n\
		{5dd911}150.000${FFFFFF}\n\
		{b6e1d1}+ 3 ���� � ���������� ������.{FFFFFF}", "�����", "����������");
		return SCM(playerid, COLOR_RED, "�������� � ����� ����� �� ����������!");
	}
}

stock Mapping()
{
    CreateVehicle(470, 278.7950, 2013.8074, 17.4350, -88.4401, -1, -1, 100);
	CreateVehicle(470, 278.9742, 2018.7092, 17.4350, -88.4401, -1, -1, 100);
	CreateVehicle(470, 278.7293, 2024.0891, 17.4350, -88.4401, -1, -1, 100);
	CreateVehicle(470, 278.0030, 2029.5181, 17.4350, -88.4401, -1, -1, 100);
	CreateVehicle(470, 277.5179, 2034.9558, 17.4350, -88.4401, -1, -1, 100);
	CreateVehicle(432, 278.4102, 1982.7544, 17.6829, -90.5400, -1, -1, 100);
	CreateVehicle(432, 278.8739, 1989.5643, 17.6829, -90.5400, -1, -1, 100);
	CreateVehicle(432, 278.7140, 1996.5669, 17.6829, -90.5400, -1, -1, 100);
	CreateVehicle(433, 276.0277, 1945.4109, 18.0227, -90.0000, -1, -1, 100);
	CreateVehicle(433, 275.9258, 1951.4244, 18.0227, -90.0000, -1, -1, 100);
	CreateVehicle(433, 275.8920, 1957.4176, 18.0227, -90.0000, -1, -1, 100);
	CreateVehicle(433, 275.9490, 1963.1023, 18.0227, -90.0000, -1, -1, 100);
	CreateVehicle(425, 301.2357, 2054.7830, 18.5387, 0.0000, -1, -1, 100);
	CreateVehicle(425, 316.2587, 2054.1919, 18.5387, 0.0000, -1, -1, 100);
	CreateVehicle(520, 316.2038, 1941.3070, 18.4670, 0.0000, -1, -1, 100);
	CreateVehicle(520, 316.4769, 1955.9780, 18.4670, 0.0000, -1, -1, 100);
	CreateVehicle(520, 316.5130, 1972.0522, 18.4670, 0.0000, -1, -1, 100);
	CreateVehicle(520, 316.2327, 1924.9209, 18.4670, 0.0000, -1, -1, 100);
	CreateVehicle(520, 278.8833, 1933.0540, 18.4670, -91.6800, -1, -1, 100); // ��
}


public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

