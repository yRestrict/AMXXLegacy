/* Plugin generated by AMXX-Studio */
#include <amxmodx>
#include <hamsandwich>

#define PLUGIN "Rate Guard"
#define VERSION "1.0"
#define AUTHOR "O'Zone"

#define TASK_CHECK 765

public plugin_init() 
{
	register_plugin(PLUGIN, VERSION, AUTHOR);
	RegisterHam(Ham_Spawn, "player", "Spawn", 1);
}

public client_disconnect(id)
	remove_task(id+TASK_CHECK)
	
public Spawn(id) 
{
	if(is_user_alive(id)) 
	{
		if(task_exists(id+TASK_CHECK))
			remove_task(id+TASK_CHECK);
			
		set_task(0.1, "Check", id+TASK_CHECK);
	}
}

public Check(id) 
{
	id -= TASK_CHECK;
	
	if(is_user_connected(id)) 
	{
		cmd_execute(id,"ex_interp 0.01");
		cmd_execute(id,"rate 25000");
		cmd_execute(id,"cl_updaterate 101");
		cmd_execute(id,"cl_cmdrate 101");
		
		set_task(15.0, "Check", id+TASK_CHECK);
	}
}

stock cmd_execute(id, const szText[], any:...) 
{
	message_begin(MSG_ONE, SVC_DIRECTOR, _, id);
	write_byte(strlen(szText) + 2);
	write_byte(10);
	write_string(szText);
	message_end();
	
	#pragma unused szText

	new szMessage[256];

	format_args(szMessage, charsmax(szMessage), 1);

	message_begin(id == 0 ? MSG_ALL : MSG_ONE, 51, _, id);
	write_byte(strlen(szMessage) + 2);
	write_byte(10);
	write_string(szMessage);
	message_end();
}