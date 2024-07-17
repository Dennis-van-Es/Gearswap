  function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.tp = {}                 -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty

    autohasso = 0
    tp_index = 1
    tp_set_names = {"Normal","DT"}

    sets.idle.normal = {}    
    
    sets.tp['Normal'] = {      
        ammo="Aurgelmir Orb",
        head="Flam. Zucchetto +1",
        neck="Sanctity Necklace",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Flamma Korazin +1",
        hands="Flam. Manopolas +1",
        left_ring="Petrov Ring",
        right_ring="Enlivened Ring",
        back="Bleating Mantle",
        waist="Windbuffet Belt +1",
        legs="Flamma Dirs +1",
        feet="Flam. Gambieras +1",
    }

    sets.tp['DT'] = {
        ammo="Staunch Tathlum",
        head="Sulevia's Mask",
        neck="Ishtar's Collar",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Sulevia's Plate. +1",
        hands="Sulevia's Gauntlets",
        left_ring="Petrov Ring",
        right_ring="Enlivened Ring",
        back="Bleating Mantle",    
        waist="Cetl Belt",
        legs="Sulevia's Cuisses +1",
        feet="Sulevia's Leggings +1",
    }

    -- Magic sets
    sets.precast.general = {}
    
    -- Weapon Skill Sets
        -- Penta Thrust STR20 / DEX20
    sets.ws['Penta Thrust'] = {}
    
    -- Job Ability Sets
    sets.ja['Jump'] = {}
    sets.ja['High Jump'] = {}
    sets.ja['Super Jump'] = {}
    sets.ja['Spirit Jump'] = {}
    sets.ja['Spirit Link'] = {}
    sets.ja['Spirit Bond'] = {}

    send_command('input /macro book 2;wait .1;input /macro set 1')
    send_command('bind ^f10 gs c autohasso')
    send_command('bind f10 gs c toggle TP set')
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
    elseif spell.prefix == '/magic' then
        equip(sets.precast.general)
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
        equip(sets.tp[tp_set_names[tp_index]])
    else
        equip(sets.tp[tp_set_names[tp_index]])
    end
end
 
function status_change(new,old)
    idle()
end

function buff_change(name, gain, buff_details)
    if name == 'Hasso' and not gain then
        if autohasso then
            send_command('input /ja Hasso <me>')
        end
    end
end

function self_command(command)
    if command == 'toggle TP set' then
        tp_index = tp_index +1
        if tp_index > #tp_set_names then tp_index = 1 end
        send_command('@input /echo ----- TP Set changed to '..tp_set_names[tp_index]..' -----')
        equip(sets.tp[tp_set_names[tp_index]])
    end
    if command == 'autohasso' then
        if autohasso == 0 then
            autohasso = 1
            windower.add_to_chat(123, '---- Auto Hasso on ----')
        else 
            autohasso = 0
            windower.add_to_chat(123, '---- Auto Hasso off ----')
        end
    end  
end

function user_unload()
    send_command('unbind f10')
    send_command('unbind ^f10')    
end