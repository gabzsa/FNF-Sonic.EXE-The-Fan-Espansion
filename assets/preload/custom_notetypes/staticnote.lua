function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'staticnote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'StaticNOTE_assets'); 
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties

			makeAnimatedLuaSprite('hitstatic', 'hitStatic', -380, -90);
			luaSpriteAddAnimationByPrefix('hitstatic', 'static', 'staticANIMATION', 24, true);
			setLuaSpriteCamera('hitstatic', 'camHUD')
			setPropertyLuaSprite('hitstatic', 'alpha', 0)
			scaleObject('hitstatic', 3, 3);
			addLuaSprite('hitstatic', true);

			end
		end
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'staticnote'  then
		runTimer('HitStatic', 0.01);
		playSound('hitStatic1', 0.5);
		runTimer('StaticRemove2', 0.5);
	elseif noteType == 'staticnote' then
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.000);
	end
		
 		if tag == 'StaticRemove2' then
		 setPropertyLuaSprite('hitstatic', 'alpha', 0)
     end

		if tag == 'HitStatic' then
		 setPropertyLuaSprite('hitstatic', 'alpha', 0.85)
     end
end
