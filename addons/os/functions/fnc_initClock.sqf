_timeCtrl = _this select 0;
while { (dialog) and (alive player) } do {
    _hour = floor dayTime;
    _strHour = str(_hour);
    if (_hour < 10) then {
        _strHour = format ["0%1", _hour];
    };

    _minute = floor ((dayTime - _hour) * 60);
    _strMinute = str(_minute);
    if (_minute < 10) then {
        _strMinute = format ["0%1", _minute];
    };

    _second = floor (((((dayTime) - (_hour))*60) - _minute)*60);
    _strSecond = str(_second);
    if (_second < 10) then {
        _strSecond = format ["0%1", _second];
    };

    _time24 = format ["%1:%2:%3", _strHour, _strMinute, _strSecond];
    _timeCtrl ctrlSetText _time24;
    sleep 1;
};