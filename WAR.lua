  function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.tp = {}                 -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty

    -- Define variables 
    tp_index = 1
    tp_set_names = {"Normal","DT","DualWield"}
    idle_index = 1
    idle_set_names = {"Normal"}
    weapon_index = 1
    weapon_set_names = {"GreatAxe","SwordAndBoard","DualWield"}
    autohasso = 0

    sets.idle["Normal"] = {}
    
    sets.tp["Normal"] = {
        ammo="Aurgelmir Orb",
        head="Skormoth Mask",
        neck="Sanctity Necklace",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Flam. Korazin +1",
        hands="Flam. Manopolas +1",
        left_ring="Enlivened Ring",
        right_ring="Petrov Ring",
        back="Bleating Mantle",
        waist="Windbuffet Belt +1",
        legs="Sulevia's Cuisses +1",
        feet="Flam. Gambieras +1",
    }
        
    sets.tp["DT"] = {}    
    sets.tp["DualWield"] = {}

    -- Weapon Skill Sets
    sets.ws.base = {
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        waist="Grunfeld Rope",
    }
    sets.ws['Red Lotus Blade'] = {}    

    -- Job Ability Sets
    sets.ja['Berserk'] = {}

    send_command('input /macro book 6;wait .1;input /macro set 1')
    send_command('bind ^f10 gs c autohasso')
    send_command('bind f10 gs c toggle TP set')
    send_command('bind f11 gs c toggle weapon set')
end
 
function precast(spell)
    if spell.prefix == '/jobability' then        
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    elseif spell.prefix == '/weaponskill' then
        if sets.ws['spell.name'] then
            equip(sets.ws['spell.name'])
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
    idle()
end
 
function idle()
    if player.status=='Engaged' then
        equip(sets.tp[tp_set_names[tp_index]])
    else
        equip(sets.idle[idle_set_names[idle_index]])       
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
        if tp_index > #tp_set_names then 
            tp_index = 1 
        end
        windower.add_to_chat(123, ' ----- TP Set changed to '..tp_set_names[tp_index]..' -----')
        equip(sets.tp[tp_set_names[tp_index]])
    end
    if command == 'toggle weapon set' then
        weapon_index = weapon_index +1
        if weapon_index > #weapon_set_names then 
            weapon_index = 1 
        end
        windower.add_to_chat(123, ' ----- Weapon Set changed to '..weapon_set_names[weapon_index]..' -----')
        equip(sets.weapon[weapon_set_names[weapon_index]])
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

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind f10')
    send_command('unbind ^f10')
    send_command('unbind f11')
end