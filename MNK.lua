  function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.melee = {}                 -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty
 
    sets.idle.normal = {
        main="Denouements",
        ammo="Aurgelmir Orb",
        head="Skormoth Mask",
        body="Mummu Jacket +2",
        hands={ name="Naga Tekko", augments={'STR+9','Accuracy+13','"Subtle Blow"+6',}},
        legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
        feet={ name="Herculean Boots", augments={'Attack+14','"Triple Atk."+3','DEX+10',}},
        neck="Sanctity Necklace",
        waist="Windbuffet Belt +1",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        left_ring="Petrov Ring",
        right_ring="Enlivened Ring",
        back="Bleating Mantle",
    }    
    
    sets.melee.normal = {
        main="Denouements",
        ammo="Aurgelmir Orb",
        head="Skormoth Mask",
        body="Mummu Jacket +2",
        hands={ name="Naga Tekko", augments={'STR+9','Accuracy+13','"Subtle Blow"+6',}},
        legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
        feet={ name="Herculean Boots", augments={'Attack+14','"Triple Atk."+3','DEX+10',}},
        neck="Sanctity Necklace",
        waist="Windbuffet Belt +1",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        left_ring="Petrov Ring",
        right_ring="Enlivened Ring",
        back="Bleating Mantle",
    }    
    -- Weapon Skill Sets
    sets.ws['Red Lotus Blade'] = {}    

    -- Job Ability Sets
    sets.ja['Dodge'] = {feet="Temple Gaiters",}
    sets.ja['Chakra']={body="Temple Cyclas",hands="Melee Gloves",}
    sets.ja['Focus']={head="Temple Crown",}

    send_command('input /macro book 14;wait .1;input /macro set 1')
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
    idle()
end
 
function idle()
    if player.status=='Engaged' then
        equip(sets.melee.normal)
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