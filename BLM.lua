  function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.melee = {}                 -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty
 
    sets.idle.normal = {}    
    
    sets.melee.normal = {
        main        = "",
        sub         = "",
        range       = "",
        ammo        = "",
        head        = "",
        neck        = "",
        ear1        = "",
        ear2        = "",      
        body        = "",
        hands       = "",
        ring1       = "",
        ring2       = "",
        back        = "",
        waist       = "",
        legs        = "",
        feet        = "",        
    }    
    -- Weapon Skill Sets
    sets.ws['Red Lotus Blade'] = {}    

    -- Job Ability Sets
    sets.ja['Elemental Seal'] = {}

    -- Casting Sets
    sets.precast.fastcast = {}

    sets.midcast.cure = {}        
    sets.midcast.mind = {}
    sets.midcast.int = {}
    sets.midcast.divine = {}
    sets.midcast.enhancing = {}
    sets.midcast.dark = {}

    send_command('input /macro book 7;wait .1;input /macro set 1')
end
 
function precast(spell)
    if spell.prefix == '/jobability' then        
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    elseif spell.prefix == '/weaponskill' then
        if sets.ws['spell.name'] then
            equip(sets.ws['spell.name'])
        end
    end
    if spell.prefix == '/magic' then
        equip(sets.precast.fastcast)
    end
end
 
function midcast(spell)
    if spell.name:match('Cure') or spell.name:match('Cura') then                -- Cure in a cure set
        equip(sets.midcast.cure)
    elseif spell.skill == 'Enfeebling Magic' then                               -- Enfeebling in a MND or INT based enfeebling set
        if spell.type == 'WhiteMagic' then
            equip(sets.midcast.mind)
        elseif spell.type == 'BlackMagic' then
            equip(sets.midcast.int)
        end
    elseif spell.skill == 'Divine Magic' then                                   -- Divine in specialized gear
        equip(sets.midcast.divine)
    elseif spell.skill == 'Elemental Magic' then                                -- Elemental in +int gear
        equip(sets.midcast.int) 
    elseif spell.skill == 'Enhancing Magic' then                                 -- Enhance in specialized gear
        equip(sets.midcast.enhancing)
    elseif spell.skill == 'Dark Magic' then                                      -- Dark magic in dark gear
        equip(sets.midcast.dark)
    end
    
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