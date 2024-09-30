function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.tp = {}                    -- Leave this empty
    sets.weapon={}                  -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty

    artifact = {}
    
    relic={}
    
    empy={}
    
    send_command('input /macro book 1;wait .1;input /macro set 1')
end

function precast(spell)
    if spell.prefix == '/jobability' then        
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    elseif spell.prefix == '/weaponskill' then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws.base)
        end
    end
end

function midcast(spell)    
    -- Cancel active sneak 
    if spell.english == 'Sneak' and spell.target.name == player.name then
        send_command('cancel 71;')
    end   
    if spell.english == 'Spectral Jig' then
        send_command('cancel 71;')
    end;
end

function aftercast(spell)
end

function status_change(new,old)
end

function buff_change(name, gain, buff_details)
end

function self_command(command)
    windower.add_to_chat(123,'No commands implemented')
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
end