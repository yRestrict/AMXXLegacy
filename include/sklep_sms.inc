#if defined _shop_sms_included
	#endinput
#endif
#define _shop_sms_included

#pragma library "shop_sms"

#define VERSION "3.6.6"

#define SS_OK -1
#define SS_ERROR -2
#define SS_STOP -3
#define SS_BAD_ARGS -4

#define MAX_ID 32

#define TYPE_NICK 1<<0
#define TYPE_IP 1<<1
#define TYPE_SID 1<<2

#define ADMIN_FLAG_V (1<<21)
#define ADMIN_FLAG_W (1<<22)
#define ADMIN_FLAG_X (1<<23)

native ss_register_service(const service_id[]);
/*------------------------------
 * Rejestruje usluge, ktora bedzie pozniej dostepna w sklepie
 * ---------------------------
 * service_id[] - id uslugi
------------------------------*/

native ss_show_sms_info(id);
/*------------------------------
 * Kontynuuje proces zakupu po zwroceniu wartosci SS_STOP w forwardzie ss_service_chosen
 * ---------------------------
 * id - index gracza dokonujacego zakupu
------------------------------*/

forward ss_service_data(name[], flags[]);
/*------------------------------
 * Forward wysylany ( do pluginu z ktorego zostala zarejstrowana usluga )
 * w momencie pobrania danych o usludze.
 * ---------------------------
 * name[] - nazwa uslugi
 * flags[] - flagi danej uslugi
 * ---------------------------
 */

forward ss_service_addingtolist(id, flags[]);
/*------------------------------
 * Forward wysylany ( do pluginu z ktorego zostala zarejstrowana usluga )
 * w momencie dodawania uslugi do menu z uslugami.
 * Funkcja powinna zwraca jedna z dwoch wartosci:
 *  ITEM_ENABLED - usluga ma byc dostepna
 *  ITEM_DISABLED - usluga ma byc niedostepna
 * ---------------------------
 * id - index gracza dokonujacego zakupu
 * flags[] - flagi danej uslugi
------------------------------*/

forward ss_service_chosen(id, amount);
/*------------------------------
 * Forward wysylany ( do pluginu z ktorego zostala zarejstrowana usluga )
 * w momencie wybrania uslugi.
 * Funkcja powinna zwraca jedna z dwoch wartosci:
 *  SS_OK
 *  SS_STOP - gdy chcemy na pewien czas zatrzymac proces wykupowania uslugi.
 *		Potem musimy go wznowic za pomoca natywu ss_show_sms_info.
 * ---------------------------
 * id - index gracza dokonujacego zakupu
 * amount - wybrana ilosc ( opcja )
------------------------------*/

forward ss_service_bought(id, amount);
/*------------------------------
 * Forward wysylany ( do pluginu z ktorego zostala zarejestrowana usluga ) w momencie zakupu uslugi.
 * Mozna zwrocic wartosc SS_ERROR w przypadku wystapienia bledu przy dodawaniu uslugi.
 * ---------------------------
 * id - index gracza dokonujacego zakupu
 * amount - ilosc wykupionej uslugi
------------------------------*/

stock pause_plugin()
{
	static file[32];

	get_plugin(-1, file, sizeof file);

	pause("ad", file);
}
