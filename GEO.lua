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

    send_command('input /macro book 18;wait .1;input /macro set 1')
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
    local commandArgs = command                                 -- First we copy the content of command inside a new variable for our use. 
    if #commandArgs:split(' ') >= 2 then                        -- We check if there is 2 or more words in the commandArgs.
            commandArgs = T(commandArgs:split(' '))             -- If there is indeed 2 or more words, we split each words into a different entry, so commandArgs[1] and commandArgs[2] if there was 2 words.
    end
    
    windower.add_to_chat(123,'No commands supported (yet)')
end