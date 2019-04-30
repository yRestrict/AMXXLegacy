/* Plugin generated by AMXX-Studio*/
#include <amxmodx>
#include <amxmisc>
#include <csx>
#include <dhudmessage>

#define PLUGIN "Ranga"
#define VERSION "1.0"
#define AUTHOR "O'Zone"
#define TASK 666

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
}

public client_connect(id)
{
	if(is_user_bot(id))
	return

	new param[1]
	param[0] = id

	set_task(1.0, "rank", TASK+id, param, 1, "b")
}
public client_disconnect(id){
	if(task_exists(TASK+id))
		remove_task(TASK+id)
}

public rank(param[])
{
	new id = param[0]
	static stats[8], body[8]
	new rankpos, rankmax
	rankmax = get_statsnum()
	rankpos = get_user_stats(id, stats, body)
	new liczbafragow = get_user_frags(id)

	new ranga[30]

	if ( stats[0] >= 0 && stats[0] <= 29)
	format(ranga,29,"Lamus")
	else if ( stats[0] >= 30 && stats[0] <= 59)
	format(ranga,29,"Poczatkujacy")
	else if ( stats[0] >= 60 && stats[0] <= 119)
	format(ranga,29,"Wiesniak")
	else if ( stats[0] >= 120 && stats[0] <= 209)
	format(ranga,29,"Sierota")
	else if ( stats[0] >= 210 && stats[0] <= 324)
	format(ranga,29,"Kox")
	else if ( stats[0] >= 325 && stats[0] <= 499)
	format(ranga,29,"Cherlak")
	else if ( stats[0] >= 500 && stats[0] <= 729)
	format(ranga,29,"Kozak")
	else if ( stats[0] >= 730 && stats[0] <= 999)
	format(ranga,29,"Snajper")
	else if ( stats[0] >= 100 && stats[0] <= 1399)
	format(ranga,29,"Macho")
	else if ( stats[0] >= 1400 && stats[0] <= 1849)
	format(ranga,29,"Rambo")
	else if ( stats[0] >= 1850 && stats[0] <= 2299)
	format(ranga,29,"Terminator")
	else if ( stats[0] >= 2300 && stats[0] <= 2899)
	format(ranga,29,"Joker")
	else if ( stats[0] >= 2900 && stats[0] <= 3549)
	format(ranga,29,"Morfeusz")
	else if ( stats[0] >= 4200 && stats[0] <= 4999)
	format(ranga,29,"Wybraniec")
	else if ( stats[0] >= 5000 && stats[0] <= 5899)
	format(ranga,29,"Killer")
	else if ( stats[0] >= 5900 && stats[0] <= 6899)
	format(ranga,29,"Multi Killer")
	else if ( stats[0] >= 6900 && stats[0] <= 7999)
	format(ranga,29,"Mistrz")
	else if ( stats[0] >= 8000 && stats[0] <= 9299)
	format(ranga,29,"Owner")
	else if ( stats[0] >= 9300 && stats[0] <= 9999)
	format(ranga,29,"Mistrz")
	else if ( stats[0] >= 10000 )
	format(ranga,29,"Legenda CS-Reload")

	set_hudmessage(42, 255, 42, 0.65, 0.85, 0, 6.0, 12.0)
	show_dhudmessage(id, "Ranga: %s || Zabojstwa: %d",ranga,stats[0],liczbafragow,rankpos,rankmax)
}  
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ ansicpg1250\\ deff0\\ deflang1045{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ f0\\ fs16 \n\\ par }
*/