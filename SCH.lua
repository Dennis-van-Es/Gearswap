function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.melee = {}                 -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty
 
    sets.idle.normal = {}    
    
    
    -- Job Ability Sets
    sets.ja['Divine Seal'] = {}

    -- Casting Sets
    sets.precast.fastcast = {}

    sets.midcast.cure = {}        
    
    
    sets.midcast.divine = {}
    sets.midcast.enhancing = {}
    sets.midcast.dark = {}

    send_command('input /macro book 19;wait .1;input /macro set 1')
end
 

function precast(spell)
end
 
function midcast(spell)
    -- Cancel active sneak 
    if spell.english == 'Sneak' and spell.target.name == player.name then
        send_command('cancel 71;')
    end   
end
 
function aftercast(spell)
    idle()
end
 
function idle()
    if player.status=='Engaged' then
        equip(sets.melee.normal)
    elseif player.status == 'Resting' then
        equip(sets.idle.rest)
    else
        equip(sets.idle.normal)       
    end
end
 
function status_change(new,old)
    idle()
end

function self_command(command)
    if command == "Helix" then
        cast_helix()
    end
end

function cast_helix()
    element_to_use = world.real_weather_element
    windower.add_to_chat(122,'Weather = '..element_to_use)
    if element_to_use == "None" then 
        element_to_use = world.day_element
        windower.add_to_chat(122,'Using element '..element_to_use)
    end
    if element_to_use == "Fire" then
        windower.send_command('input /ma Pyrohelix <t>')
    elseif element_to_use == "Earth" then
        windower.send_command('input /ma Geohelix <t>')
    elseif element_to_use == "Water" then
        windower.send_command('input /ma Hydrohelix <t>')
    elseif element_to_use == "Wind" then
        windower.send_command('input /ma Anemohelix <t>')
    elseif element_to_use == "Ice" then
        windower.send_command('input /ma Cryohelix <t>')
    elseif element_to_use == "Lightning" then
        windower.send_command('input /ma Ionohelix <t>')
    elseif element_to_use == "Dark" then
        windower.send_command('input /ma Noctohelix <t>')
    elseif element_to_use == "Light" then
        windower.send_command('input /ma Luminohelix <t>')
    end
end