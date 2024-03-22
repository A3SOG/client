/*
Validates news data from C# extension

Parameters:
_this select 0: Title <STRING>
_this select 1: Date <STRING>
_this select 2: Content <STRING>
_this select 3: Url <STRING>

Returns:
Array - Validated news entry [title, date, content, url]
*/

params [["_title", ""], ["_date", ""], ["_content", ""], ["_url", ""]];

private _validatedNews = [];

// Validate title 
if (isNil "_title") exitWith {
   ["No title provided"] call BIS_fnc_log;
   _validatedNews
};

if !(_title isEqualType "") exitWith {
   ["Invalid title type"] call BIS_fnc_log;
   _validatedNews
};

// Validate date
if (isNil "_date") exitWith {
   ["No title provided"] call BIS_fnc_log;
   _validatedNews
};

if !(_date isEqualType "") exitWith {
   ["Invalid title type"] call BIS_fnc_log;
   _validatedNews
};

// Validate content
if (isNil "_content") exitWith {
   ["No content provided"] call BIS_fnc_log;
   _validatedNews
};

if !(_content isEqualType "") exitWith {
   ["Invalid content type"] call BIS_fnc_log;
   _validatedNews
};

if (isNil "_url") exitWith {
   ["No content provided"] call BIS_fnc_log;
   _validatedNews
};

// Validate url
if !(_url isEqualType "") exitWith {
   ["Invalid content type"] call BIS_fnc_log;
   _validatedNews
};

// Log news entry
hint format ["Latest News:\n%1 - %2\n%3\nRead more: %4\n\n", _title, _date, _content, _url];

// Return validated news
_validatedNews pushBack [_title, _date, _content, _url];
_validatedNews