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
    tp_set_names = {"Normal","Glass Cannon", "DT"}

    sets.idle.normal = {}    
    
    sets.tp['Glass Cannon'] = {
        ammo="Aurgelmir Orb",               
        head="Flamma Zucchetto +2",
        neck="Sanctity Necklace",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Flamma Korazin +1",
        hands="Sulevia's Gauntlets +2",
        left_ring="Petrov Ring",
        right_ring="Enlivened Ring",
        back="Bleating Mantle",
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }

    sets.tp['Normal'] = {      
        ammo="Aurgelmir Orb",
        head="Flamma Zucchetto +2",
        neck="Sanctity Necklace",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Flamma Korazin +1",
        hands="Sulevia's Gauntlets +2",
        left_ring="Petrov Ring",
        right_ring="Enlivened Ring",
        back="Bleating Mantle",
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }

    sets.tp['DT'] = {
        ammo="Staunch Tathlum",
        head="Flamma Zucchetto +2",
        neck="Ishtar's Collar",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Sulevia's Plate. +1",
        hands="Sulevia's Gauntlets +2",
        left_ring="Petrov Ring",
        right_ring="Enlivened Ring",
        back="Bleating Mantle",    
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }

    -- Magic sets
    sets.precast.general = {}
    
    -- Weapon Skill Sets
        
    sets.ws['Stardiver'] = {
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
    }

    sets.ws['Diarmuid'] = {
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        waist="Sailfi Belt +1",
    }

    sets.ws['Impuls Drive'] = {
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        waist="Sailfi Belt +1",
    }

    sets.ws["Cammlann's Torment"] = {
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
    }

    sets.ws['Drakesbane'] = {
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        waist="Sailfi Belt +1",
    }

    sets.ws['Geirskogul'] = {
        left_ear="Thrud Earring",
        left_ring="Karieyh Ring",
        waist="Sailfi Belt +1",
    }

    sets.ws['Leg Sweep'] = {
        left_ear="Ishvara Earring",
        left_ring="Karieyh Ring",
    }
    
    -- Job Ability Sets
    sets.ja['Call Wyvern'] = {}
    sets.ja['Jump'] = {}
    sets.ja['Spirit Jump'] = {}
    sets.ja['Spirit Link'] = {}
    sets.ja['Angon'] = {}
    sets.ja['Elemental Breath'] = {}
    sets.ja['Healing Breath'] = {}
    sets.ja['Ancient Circle'] = {}
    
    sets.ja['Spirit Surge'] = sets.ja['Call Wyvern']
    sets.ja['High Jump'] = sets.ja['Jump']
    sets.ja['Soul Jump'] = sets.ja['Jump']

    send_command('input /macro book 2;wait .1;input /macro set 1')
    send_command('bind f9 gs c autohasso')
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
         -- check if Hasso should be re-applied
         if not buffactive['Hasso'] then
            if autohasso == 1 then
                send_command('input /ja Hasso <me>')
            end
        end
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
            if player.status=='Engaged' then
                send_command('input /ja Hasso <me>')
            end
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
    send_command('unbind f9')    
end