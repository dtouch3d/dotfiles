/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-*-stlarch-medium-r-*-*-16-*-*-*-*-*-*-*" "," "-*-terminus-medium-r-*-*-16-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#005577";
static const char selbgcolor[]      = "#005577";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */
static const Bool showsystray       = True;     /* False means no systray */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const unsigned int statusmon = 1;        /* On which monitor should the status appear */

//static const char *firefox[]     = { "firefox", NULL };
static const char *browser[]    = { "chromium", NULL };
static const char *vbox[]        = { "virtualbox", NULL };
static const char *file_manager[]      = { "spacefm", NULL };
static const char *music_prev[]    = { "ncmpcpp", "prev", NULL };
static const char *music_next[]    = { "ncmpcpp", "next", NULL };
static const char *music_play[]    = { "ncmpcpp", "toggle", NULL };
static const char *music_stop[]    = { "ncmpcpp", "stop", NULL };
static const char *volume_down[] = { "amixer", "sset", "Master", "3-", NULL };
static const char *volume_up[]   = { "amixer", "sset", "Master", "3+", NULL };
static const char *skype[]       = { "skype", NULL };
static const char *xlock[]    = { "xscreensaver-command", "--lock", NULL };
static const char *suspend[]     = { "systemctl", "suspend", NULL };
static const char *transmission[] = { "transmission-gtk", NULL };
static const char *urxvtc[]       = { "st", "-e", "tmux", "-2", NULL };

/* tagging */
static const char *tags[] = { "web", "code", "vm", "im", "misc" }; //, "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",         NULL,   NULL,       0,            True,        -1 },
	{ "Firefox",      NULL,   NULL,       1,            False,       -1 },
	{ "Chromium",     NULL,   NULL,       1,            False,       -1 },
        { "VirtualBox",   NULL,   NULL,       1 << 2,       False,       -1 },
        { "Transmission", NULL,   NULL,       1 << 4,       False,       -1 },
        { "Sylpheed",     NULL,   NULL,       1 << 3,       False,       -1 },
        { "Skype",        NULL,   NULL,       1 << 3,       False,       -1 }
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "urxvtc", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },

    // My shortcuts
    { MODKEY, XK_f , spawn, {.v = file_manager } },
    { MODKEY, XK_F3, spawn, {.v = browser } },
    { MODKEY, XK_s,  spawn, {.v = skype } },
    { MODKEY, XK_F6, spawn, {.v = xlock } },
    { MODKEY, XK_F5, spawn, {.v = suspend } },
    { MODKEY, XK_v,  spawn, {.v = vbox } },
    //{ MODKEY, XK_F2, spawn, {.v = sylpheed } },
    { MODKEY, XK_F4, spawn, {.v = transmission } },
    { 0, 0x1008ff11, spawn, {.v = volume_down } },
    { 0, 0x1008ff13, spawn, {.v = volume_up } },
    { 0, 0x1008ff14, spawn, {.v = music_play } },
    { 0, 0x1008ff15, spawn, {.v = music_stop } },
    { 0, 0x1008ff16, spawn, {.v = music_prev } },
    { 0, 0x1008ff17, spawn, {.v = music_next } },
    { MODKEY, XK_grave,  spawn, {.v = urxvtc } }
    };

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

