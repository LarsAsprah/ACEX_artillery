/*
 * Author: Grey-Soldierman
 *
 * Description:
 * Detach a part of the M198 by setting an animation phase and spawning an object
 *
 * Argument:
 * 0: Any object <OBJECT>
 * 1: Player <OBJECT>
 * 2: Animation name <STRING>
 * 3: Part <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target,_player,'hide_right_foot','ACE_M198_Foot_F'] call acex_artillery_m198_howitzer_fnc_detatchPart;
 * Public: Yes
 */
#include "script_component.hpp"
params ["_object","_unloader","_animations","_part"];
//Perform all animations
{
    _x params ["_animName","_animPhase"];
    _object animate [_animName, _animPhase, true];
} foreach _animations;

//Make sure part is a classname
private _partClass = if (_part isEqualType "") then {_part} else {typeOf _part};

//Find a suitable position to spawn the part
private _emptyPosAGL = [_object, _partClass, _unloader] call ace_common_fnc_findUnloadPosition;
TRACE_1("findUnloadPosition",_emptyPosAGL);

//Check there is a suitable position
if ((count _emptyPosAGL) != 3) exitWith {
    TRACE_4("Could not find unload pos",_object,getPosASL _object,isTouchingGround _object,speed _object);
    if ((!isNull _unloader) && {_unloader == ACE_player}) then {
        //display text saying there are no safe places to exit the vehicle
        ["No place to detatch part"] call ace_common_fnc_displayTextStructured;
    };
    false
};

//Spawn the part
private _partObject = createVehicle [_partClass, _emptyPosAGL, [], 0, "NONE"];
_partObject setPosASL (AGLtoASL _emptyPosAGL);