# Covid.v2.tcl

An [Eggdrop](https://www.eggheads.org/) Tcl script for basic bot control — auth/ownership, channel join/part management, moderation commands (kick/ban/voice/op), autogreet, and a small but fairly complete per-channel **protection engine** (flood reaction, deop/kick revenge, join-burst auto-moderation, and a bad-word filter) — built to stay portable across IRC networks rather than hardcoded to one.

Original author: **IJOO A.K.A VICTOR**. Version `3.0b`. Tested on `irc.dal.net` and `irc.evochat.id`, but written to run correctly on any network — see [Portability](#portability).

> `Covid.v2.tcl` is the actively-developed branch. `Covid.tcl` (the original) is kept for reference but no longer receives new features.

## Requirements

- Eggdrop **1.10.x** (developed/tested against 1.10.1)
- Core modules: `channels`, `server`, `ctcp`, `irc`
- No third-party Tcl packages required

## Installation

1. Copy `scripts/Covid.v2.tcl` into your bot's `scripts/` directory.
2. Source it from your config file, after the modules above are loaded:

   ```tcl
   loadmodule channels
   loadmodule server
   loadmodule ctcp
   loadmodule irc

   set owner    "yourhandle"
   set basechan "#yourchannel"
   set nick     "BotNick"
   set nickpass "yournickservpassword"

   source scripts/Covid.v2.tcl
   ```

3. `basechan` (if set before the script loads) is auto-added and gets the default channel settings applied on first load — see [Defaults applied to new channels](#defaults-applied-to-new-channels).
4. Get yourself owner access on a fresh bot the normal eggdrop way (partyline `.chattr` or a `.tcl` one-liner to grant your handle the `n` flag), then `/msg BotNick auth <password>` to pick up the script's own `Z` (authenticated-owner) flag used throughout its commands.

### Optional: SASL

If your network supports SASL, add this near your `nick`/`nickpass` settings — it reuses the same credentials instead of relying only on the post-connect NickServ `identify`:

```tcl
set sasl-mechanism 0
set sasl-username "yournick"
set sasl-password "yournickservpassword"
```

This is a native eggdrop core feature, not something `Covid.v2.tcl` implements — on networks without SASL, eggdrop simply skips it and the script's own `autoident` (NickServ identify) still runs as a fallback.

## Portability

The script deliberately avoids hardcoding behavior to a specific network:

- **IRCv3-aware, not IRCv3-dependent.** It reads `cap enabled` on connect (`evnt:init_server`) and reacts to `account-notify`/extended-join where available (`bind account`, `getaccount` in the autogreet code), but every feature degrades gracefully to plain IRCv3-less behavior when a network doesn't support them.
- **Netsplit-aware.** `SPLT`/`REJN` binds track nicks that split off a channel so a genuine netsplit rejoin is never greeted or mistaken for a join-flood attack.
- **Per-network quirks are centralized**, not scattered `if {$network == ...}` checks. See `cvd_netprofile` near the top of the file (currently holds a DALnet-specific NickServ target/ignore-host entry) — add a network by adding one array entry, not by editing logic.

## Commands

Private commands go via `/msg BotNick <command> ...` and generally require the `n` (owner) or `Z` (script-authenticated-owner) flag. Public/channel commands are prefixed `` ` `` and require the `Z` flag unless noted.

### Access

| Command | Where | Flag | Description |
|---|---|---|---|
| `auth <password>` | msg | `n` | Authenticate — grants the script's own `Z` flag |
| `deauth` | msg / `` `deauth`` | `Z` | Log out (drops `Z`) |
| `` `auth`` | pub | `n` | Show your current auth status in-channel |

### Bot / channel management

| Command | Where | Description |
|---|---|---|
| `join <#chan>` / `` `join <#chan>`` | msg / pub | Join a channel; applies the default flood/chanmode template if it's new |
| `part <#chan>` / `` `part <#chan>`` | msg / pub | Part a channel (random flavor-text reason) |
| `` `cycle`` | pub | Part and immediately rejoin the current channel |
| `nick <newnick> <nickservpass>` | msg | Change the bot's nickname; also remembers the NickServ password for future identify |
| `realname <text>` | msg | Change realname (forces a reconnect — realname can only change at connect time) |
| `identify <password>` | msg | Manually `/msg NickServ identify` |
| `chanset <#chan> <+/-flag> [value]` | msg | Read/set an eggdrop channel setting |
| `` `mode <+/-modes>`` | pub | Raw channel mode change |
| `` `topic <text>`` | pub | Set channel topic |
| `rehash` / `restart` / `die` | msg | Rehash / restart / shut down the bot |
| `ignore <add\|del\|list> ...` | msg | Manage the bot's ignore list |
| `` `ver`` | pub | Bot/host info (OS, memory, CPU, IRCv3 caps negotiated) |
| `` `logo`` | pub | Print the bot's logo |
| `` `deluser <handle>`` | pub | Remove a user from the bot's userfile |
| `` `userlist`` | pub | List all known users and their flags |

### Moderation

| Command | Flag/notes |
|---|---|
| `` `k <nick> <reason>`` | Kick. Reason optional — picks a random line from `kickm` if omitted. Refuses to kick the bot itself, an owner (`Z`), or a friend (`f`). Rate-limited (see `global-flood-kick`). |
| `` `kb <nick> <reason>`` | Kick + ban. Same protections as `` `k``, also refuses other ops. |
| `` `b <nick>`` | Ban only (no kick) |
| `` `ub <nick/hostmask> [#chan]`` | Unban |
| `` `mub [#chan]`` | Mass-unban (clears all bans, 5 at a time) |
| `` `v <nick>`` / `` `dv <nick>`` | Voice / devoice (defaults to yourself if no nick given) |
| `` `mv`` / `` `mdv`` | Mass voice / mass devoice everyone eligible on the channel, batched 6 at a time |
| `` `o <nick>`` / `` `do <nick>`` | Op / deop |
| `` `+f <nick>`` / `` `-f <nick>`` | Add/remove friend (`f` flag — protected from kick/ban/deop, auto-voiced on join if also flagged `v`) |
| `` `+av <nick>`` / `` `-av <nick>`` | Add/remove autovoice (`v` flag — voiced automatically on join) |

Every kick/ban/kickban/mass-unban command also goes through `pub_botcmd` — you can address the bot by name instead of the `` ` `` prefix for a subset of commands (`auth`, `deauth`, `cycle`, `ver`, `+v`, `dv`, `+o`, `do`, `+greet`, `-greet`), e.g. `BotNick: +v somenick`.

### Autogreet

| Command | Description |
|---|---|
| `autogreet <on\|off>` (msg) | Master on/off switch for the greet system bot-wide |
| `` `+greet`` / `` `-greet`` | Per-channel greet toggle (only works while the master switch above is on) |

Autogreet has built-in anti-flood: more than `greet-burst-max` greets within `greet-burst-window` seconds pauses greeting on that channel for `greet-burst-cooldown` seconds (tunable live, see [cvdset](#live-tuning-cvdset)). Netsplit rejoins are never greeted regardless of these numbers.

### Channel protection engine (`` `+guard``)

`` `+guard``/`` `-guard`` is the master switch for a small protection engine layered on top of eggdrop's own flood control:

| Command | Description |
|---|---|
| `` `+guard`` | Turn protection on for this channel; also restores eggdrop's native `flood-*` settings to the configured template and tries to get op if it doesn't have it |
| `` `-guard`` | Turn protection off; also zeroes out eggdrop's native `flood-*` settings for this channel (`0:0` = fully disabled), so "off" really means off |
| `` `status`` | Show what's currently active: flood-protect, deop-revenge, kick-revenge, join-burst thresholds, live baseline flood values, and bad-word filter state |

What `` `+guard`` actually turns on:

- **Flood reaction** — logs flood events eggdrop's own `flood-*` counters already detected, and exempts owners/friends from a false-positive trip (e.g. a friend's client reconnecting quickly).
- **Deop/kick revenge** — if a non-owner/non-friend deops or kicks a recognized owner/friend, the bot kicks the attacker back (and re-ops the victim, if possible). If the bot itself gets deopped, it tries to get re-opped via services rather than fighting back blind.
- **Join-burst auto-moderation** — more than `cvd-automod-max` joins within `cvd-automod-window` seconds sets channel `+m` for `cvd-automod-duration` seconds, then lifts it automatically. Unlike autogreet's anti-flood, this counts netsplit rejoins too, since a mass-rejoin storm is exactly what this guards against.
- **Op self-check** — whenever guard turns on, the bot joins a channel that already has it on, or the bot gets deopped, it tries to (re-)get op and gives up (turning guard back off, and notifying the owner) after `cvd-guard-op-grace` seconds if it can't.

Kick-war protection is independent of guard: if the bot itself gets kicked by anyone other than a recognized owner, it auto-rejoins after `cvd-rejoin-delay` seconds — unless it's been kicked from that channel more than `cvd-rejoin-max` times within `cvd-rejoin-window` seconds, in which case it gives up for `cvd-rejoin-cooldown` seconds instead of fighting a kick-war forever.

### Bad-word filter

| Command | Where | Description |
|---|---|---|
| `!badword <word> [<word2> ...]` | msg, flag `Z` | Add one or more forbidden patterns to the shared word list |
| `` `+badword`` | pub | Turn the filter on for this channel |
| `` `-badword`` | pub | Turn the filter off for this channel |

Independent of `` `+guard`` — a channel can have one on without the other. A plain word matches only as a **whole word**, case-insensitively (`ass` never fires on `class`); patterns can use glob wildcards (`*`, `?`), e.g. `www.*` matches the whole token `www.gay.com`. Owner and friend are always exempt. Matches get kicked. The word list is shared across every channel with the filter on (added via a private command, which has no per-channel context) and is saved to `scripts/covid_badwords.db` — it survives a full bot restart, not just a rehash.

### Live tuning (`cvdset`)

Every threshold above is editable at runtime, no file edit or rehash required:

```
/msg BotNick cvdset                          - list all categories
/msg BotNick cvdset <category>               - list that category's options + current values
/msg BotNick cvdset <category> <option>      - show one value
/msg BotNick cvdset <category> <option> <n>  - set one value (non-negative integer)
```

| Category | Options |
|---|---|
| `greet` | `max`, `window`, `cooldown` |
| `rejoin` | `delay`, `max`, `window`, `cooldown` |
| `automod` | `max`, `window`, `duration` |
| `guard` | `grace` |

## Defaults applied to new channels

Whenever the bot joins a brand-new channel (via `` `join``/`join`, or `basechan` on first load), it applies a template of settings once: `chanmode`, all `flood-*` counters, `aop-delay`, `idle-kick`, `stopnethack-mode`, `revenge-mode`, `ban-time`/`exempt-time`/`invite-time`, and a `global-chanset` flag list (autovoice on, dontkickops, dynamicbans/exempts/invites, statuslog, userbans/exempts/invites, protectops/protecthalfops, etc — see the top of the file to adjust). Channels the bot already knew about are left alone across a rehash, so anything you've customized since sticks.

## Data files

| File | Purpose |
|---|---|
| `scripts/covidk.db` | Running kick counter, shown in every kick reason (`-#N-`) |
| `scripts/covid_badwords.db` | Persisted bad-word list, one pattern per line |

## Non-goals

This script does not aim to be a full-featured protection bot (no clone/ban-on-sight enforcement, no bot-to-bot sync, no seen/DCC-chat console beyond eggdrop's own partyline). If you need that level of coverage, pair it with a dedicated protection script — `Covid.v2.tcl`'s guard engine is meant to cover the common cases (flood, deop/kick revenge, raid join-bursts, bad words) without the overhead of a much larger script.

## License

No explicit license file is attached to this script; treat it as author-retained until one is added.
