/*
 * Author: Brandon (TCVM)
 * Computes the possible angles the shell can be fired from and hit the target
 * Math taken from https://en.wikipedia.org/wiki/Projectile_motion#Angle_.7F.27.22.60UNIQ--postMath-0000003A-QINU.60.22.27.7F_required_to_hit_coordinate_.28x.2Cy.29
 *
 * Arguments:
 * 0: Shell Velocity <FLOAT>
 * 1: Current Grid <ARRAY>
 * 2: Target Grid <ARRAY>
 * 3: Current Height <FLOAT>
 * 4: Target Height <FLOAT>
 *
 * Return Value:
 * Array of gun angles [Shallow, High] <ARRAY>
 *
 * Example:
 * [740.5, [021,333], [53, 223], 50.0, 30.0] call ace_common_fnc_imanexample
 *
 * Public: Yes
 */
#define GRAVITY 9.8066
params["_shellVel", "_curGrid", "_targetGrid", "_curHeight", "_targetHeight"];

private _heightDiff = _targetHeight - _curHeight;
private _xGrid = (_targetGrid select 0) - (_curGrid select 0);
private _yGrid = (_targetGrid select 1) - (_curGrid select 1);

private _distance = 10 * sqrt((_xGrid^2) + (_yGrid^2));

private _shelVelSqr = _shellVel^2;

private _gd2hv = ((GRAVITY * _distance)^2) + (2 * (_heightDiff * _shellVel^2));
private _eqSqr = (_shelVelSqr * _shelVelSqr) - GRAVITY * _gd2hv;
if (_eqSqr <= 0) exitWith {
    objNull
};

private _eqRoot = sqrt(_eqSqr);
private _gd = GRAVITY * _distance;

private _shallowAngle = (_shelVelSqr - _eqRoot) / _gx;
private _highAngle =    (_shelVelSqr + _eqRoot) / _gx;

[_shallowAngle, _highAngle]

