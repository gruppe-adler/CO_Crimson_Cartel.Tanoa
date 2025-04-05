params ["_veh"];

private ["_unghi_vert","_search_light_0","_search_light_31","_search_light_32","_poz_0","_poz_31","_poz_32","_pos_search_end","_poz_abs","_poz_rel","_unghi_search","_unghi_car","_poz_lit","_dir_gun","_flash_light","_veh","_veh_turr_beg","_veh_turr_end","_search_light_1","_search_light_2","_search_light_3","_search_light_4","_search_light_5","_search_light_6","_search_light_7","_search_light_8","_search_light_9","_search_light_91","_search_light_92","_search_light_end","_poz_1","_poz_2","_poz_3","_poz_4","_poz_5","_poz_6","_poz_7","_poz_8","_poz_9","_poz_91","_poz_92","_poz_end"];

_veh_turr_beg = getText (configfile >> "CfgVehicles" >> (typeOf _veh) >> "Turrets" >> "MainTurret" >> "gunBeg");
_veh_turr_end = getText (configfile >> "CfgVehicles" >> (typeOf _veh) >> "Turrets" >> "MainTurret" >> "gunEnd");

_veh setVariable ["search_lit_ON", true];
_object_lit = createSimpleObject ["Sign_Sphere10cm_F", [0,0,0], true];
_object_lit setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];
_object_lit attachTo [_veh, [0,0,-0.2], _veh_turr_end];
_object_lit hideObject false;
_object_comp = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d",[0,0,0], true];
_object_comp attachTo [_object_lit, [0,-1.9,0]];
// private _obiect_dec = createVehicleLocal ["Land_FloodLight_F", getpos _veh, [], 0, "CAN_COLLIDE"];
// _obiect_dec disableCollisionWith _veh;
// _obiect_dec attachTo [_veh, [0,0,-0.2],_veh_turr_end];

private _lightPoints = [];

_search_light_1 = "#lightpoint" createVehicleLocal (position _object_comp);  
_lightPoints pushBack _search_light_1;
_search_light_1 setLightAmbient [.9,.8,.5];  
_search_light_1 setLightColor [.9,.8,.5];
_search_light_1 setLightIntensity 1000;
_search_light_1 setLightUseFlare true;
_search_light_1 setLightFlareSize 0;
_search_light_1 setLightFlareMaxDistance 2000;
_search_light_1 setLightAttenuation [3000,60,80,50,0.5,2.5]; 
_search_light_1 setLightDayLight true;	
_search_light_1 attachTo [_object_comp,[0,-1.5,0]];

_search_light_2 = "#lightpoint" createVehicleLocal (position _object_comp);
_lightPoints pushBack _search_light_2;
_search_light_2 setLightAmbient [.9,.8,.5];  
_search_light_2 setLightColor [.9,.8,.5];
_search_light_2 setLightIntensity 1000;
_search_light_2 setLightUseFlare true;
_search_light_2 setLightFlareSize 0;
_search_light_2 setLightFlareMaxDistance 2000;
_search_light_2 setLightAttenuation [3000,60,100,50,0.5,2.5]; 
_search_light_2 setLightDayLight true;	
_search_light_2 attachTo [_object_comp,[0,-3,0]];

_search_light_3 = "#lightpoint" createVehicleLocal (position _veh);
_lightPoints pushBack _search_light_3;
_search_light_3 setLightAmbient [.9,.8,.5];  
_search_light_3 setLightColor [.9,.8,.5];
_search_light_3 setLightIntensity 1000;
_search_light_3 setLightUseFlare true;
_search_light_3 setLightFlareSize 0;
_search_light_3 setLightFlareMaxDistance 2000;
_search_light_3 setLightAttenuation [3000,60,80,50,1,4]; 
_search_light_3 setLightDayLight true;	
_search_light_3 attachTo [_object_comp,[0,-6,0]];

_search_light_4 = "#lightpoint" createVehicleLocal (position _veh);
_lightPoints pushBack _search_light_4;
_search_light_4 setLightAmbient [.9,.8,.5];  
_search_light_4 setLightColor [.9,.8,.5];
_search_light_4 setLightIntensity 1000;
_search_light_4 setLightUseFlare true;
_search_light_4 setLightFlareSize 0;
_search_light_4 setLightFlareMaxDistance 2000;
_search_light_4 setLightAttenuation [3000,60,80,50,1,6]; 
_search_light_4 setLightDayLight true;	
_search_light_4 attachTo [_object_comp,[0,-12,0]];

_search_light_5 = "#lightpoint" createVehicleLocal (position _veh);
_lightPoints pushBack _search_light_5;
_search_light_5 setLightAmbient [.9,.8,.5];  
_search_light_5 setLightColor [.9,.8,.5];
_search_light_5 setLightIntensity 1000;
_search_light_5 setLightUseFlare true;
_search_light_5 setLightFlareSize 0;
_search_light_5 setLightFlareMaxDistance 2000;
_search_light_5 setLightAttenuation [3000,60,80,50,1.5,8]; 
_search_light_5 setLightDayLight true;	
_search_light_5 attachTo [_object_comp,[0,-20,0]];	

_search_light_6 = "#lightpoint" createVehicleLocal (position _veh);
_lightPoints pushBack _search_light_6;
_search_light_6 setLightAmbient [.9,.8,.5];  
_search_light_6 setLightColor [.9,.8,.5];
_search_light_6 setLightIntensity 1000;
_search_light_6 setLightUseFlare true;
_search_light_6 setLightFlareSize 0;
_search_light_6 setLightFlareMaxDistance 2000;
_search_light_6 setLightAttenuation [3000,60,80,50,1.5,10]; 
_search_light_6 setLightDayLight true;	
_search_light_6 attachTo [_object_comp,[0,-31,0]];

_search_light_7 = "#lightpoint" createVehicleLocal (position _veh);
_lightPoints pushBack _search_light_7;
_search_light_7 setLightAmbient [.9,.8,.5];  
_search_light_7 setLightColor [.9,.8,.5];
_search_light_7 setLightIntensity 1000;
_search_light_7 setLightUseFlare true;
_search_light_7 setLightFlareSize 0;
_search_light_7 setLightFlareMaxDistance 2000;
_search_light_7 setLightAttenuation [3000,60,80,50,2,12]; 
_search_light_7 setLightDayLight true;	
_search_light_7 attachTo [_object_comp,[0,-45,0]];

_search_light_8 = "#lightpoint" createVehicleLocal (position _veh);
_lightPoints pushBack _search_light_8;
_search_light_8 setLightAmbient [.9,.8,.5];  
_search_light_8 setLightColor [.9,.8,.5];
_search_light_8 setLightIntensity 1000;
_search_light_8 setLightUseFlare true;
_search_light_8 setLightFlareSize 0;
_search_light_8 setLightFlareMaxDistance 2000;
_search_light_8 setLightAttenuation [3000,60,80,50,2,15]; 
_search_light_8 setLightDayLight true;	
_search_light_8 attachTo [_object_comp,[0,-62,0]];

_object_lit setVectorDirAndUp [(_veh selectionPosition _veh_turr_beg) vectorFromTo (_veh selectionPosition _veh_turr_end),[0,0,1]];

private _handler = [
	{
		params ["_args", "_handle"];
		_args params ["_veh", "_object_lit", "_veh_turr_beg", "_veh_turr_end", "_lightPoints", "_object_comp"];

		if (!(alive _veh) || ((date select 3) >= 6)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			{
				deleteVehicle _x;				
			} forEach _lightPoints;
			deleteVehicle _object_lit;
			deleteVehicle _object_comp;
		};

		private _dir_gun = (_veh selectionPosition _veh_turr_beg) vectorFromTo (_veh selectionPosition _veh_turr_end);
		_object_lit setVectorDirAndUp [_dir_gun,[0,0,1]];
		// private _unghi_gun = (_dir_gun select 0) atan2 (_dir_gun select 1);
		// _obiect_dec setDir _unghi_gun+90;
	},
	0.1,
	[_veh, _object_lit, _veh_turr_beg, _veh_turr_end, _lightPoints, _object_comp]
] call CBA_fnc_addPerFrameHandler;
