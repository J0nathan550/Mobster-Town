/* SAMP ZONE Editor by Grimrandomer */
/* Version: 1.0.0.6 */
/* Export: Zone Filterscript */
/* Total zones: 3 */

#include <a_samp>
#include <streamer>

#define MAX_ZONES 3

new zones[MAX_ZONES];
new Float:zones_points_0[] = {
	2086.0,1181.0,2086.0,988.0,2336.0,984.0,2337.0,1181.0,2086.0,1181.0
};
new Float:zones_points_1[] = {
	2079.0,1366.0,2079.0,1207.0,2416.0,1209.0,2416.0,1364.0,2079.0,1366.0
};
new Float:zones_points_2[] = {
	2033.0,1448.0,2033.0,1283.0,1833.0,1288.0,1831.0,1444.0,2033.0,1448.0
};
new zones_text[MAX_ZONES][64] = {
	"capture zone",
	"capture zone 1",
	"capture zone 2"
};


public OnFilterScriptInit() {
	print("--------------------------------------");
	print("GTA SA Zone Editor by Grimrandomer - Exporter");
	print("--------------------------------------");

	zones[0] = CreateDynamicPolygon(zones_points_0);
	zones[1] = CreateDynamicPolygon(zones_points_1);
	zones[2] = CreateDynamicPolygon(zones_points_2);

	return 1;
}

public OnFilterScriptExit() {
	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid) {
	for (new zone=0; zone<MAX_ZONES; zone++) {
		if (areaid==zones[zone]) {
			new msg[90];
			format(msg, 90, "Welcome to %s", zones_text[zone]);
			SendClientMessage(playerid, 0xFFFFFFFF, msg);
		}
	}
	return 1;
}

public OnPlayerLeaveDynamicArea(playerid, areaid) {
	for (new zone=0; zone<MAX_ZONES; zone++) {
		if (areaid==zones[zone]) {
			new msg[90];
			format(msg, 90, "Goodbye from %s", zones_text[zone]);
			SendClientMessage(playerid, 0xFFFFFFFF, msg);
		}
	}
	return 1;
}
