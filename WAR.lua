  function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.tp = {}                    -- Leave this empty
    sets.weapon={}                  -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty

    -- Define variables 
    tp_index = 1
    tp_set_names = {"2Handed","SwordandBoard","DualWield"}
    idle_index = 1
    idle_set_names = {"Lockstyle","DT"}
    weapon_index = 1
    weapon_set_names = {"GreatAxe","Trial","SwordandBoard"}
    autohasso = 0
    
    sets.weapon['GreatAxe']={
        main="Instigator",
        sub="Duplus Grip",                      --> Utu Grip
    }

    sets.weapon['Trial']={
        main="Bonesplitter",
        sub="Duplus Grip",                      --> Utu Grip
    }

    sets.weapon['SwordandBoard'] = {
        main="Naegling",
        sub="Koenig Shield",
    }

    sets.reive={neck="Adoulin's Refuge +1",}

    artifact = {}
    artifact.head="Pummeler's Mask +1"
    artifact.body="Pummeler's Lorica +1"
    artifact.hands="Pummeler's Mufflers +1"
    artifact.legs="Pummeler's Cuisses +2"                   --> Upgrade
    artifact.feet="Pummeler's Calligae +2"                  --> Upgrade

    relic={}
    relic.head="Warrior's Mask"         -- Warcry           --> Upgrade to Agoge
    relic.body="Warrior's Lorica"       -- Aggressor        --> Upgrade tp Agoge
    relic.hands="Warrior's Mufflers"    --
    relic.legs="Warrior's Cuisses"
    relic.feet="Warrior's Calligae"     -- Berserk

    empy={}
    empy.head="Ravager's Mask"
    empy.body="Ravager's Lorica"        -- Blood Rage
    empy.hands="Ravager's Mufflers"     -- Restraint
    empy.legs="Ravager's Cuisses"
    empy.feet="Ravager's Calligae"      -- Retaliation

    sets.tp["2Handed"] = {
        ammo="Seething Bomblet +1",             --> Ginsen              --> Coiste Bodhar
        head="Flamma Zucchetto +2",             --> Hjarrandi Helm          --> Boii Mask +2        --> Boii Mask +3
        neck="War. Beads +1",
        left_ear="Cessance Earring",            --> Schere Eaarring
        right_ear="Brutal Earring",             --> Boii Earring        --> Boii Earring +1
        body="Flamma Korazin +1",               --> Valorous Mail           --> Agoge Lorica +2     --> Boii Lorica +2  --> Boii Lorica +3
        hands="Sulevia's Gauntlets +2",         --> Sakpata's Gauntlets
        left_ring="Flamma Ring",                --> Niqmaddu Ring
        right_ring="Petrov Ring",               --> Moonbeam Ring           --> Moonlight Ring
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}, --> Cichol's Mantle dye 0/10, resin 0/5
        waist="Ioskeha Belt",                   --> Ioskeha Belt +1         --> Sailfi Belt +1
        legs=artifact.legs,                     --> Pumm. Cuisses +3       
        feet=artifact.feet,                     --> Pumm. Calligae +3
    }
        
    sets.tp["SwordandBoard"] = {
        ammo="Seething Bomblet +1",             --> Ginsen              --> Coiste Bodhar
        head="Flamma Zucchetto +2",             --> Hjarrandi Helm          --> Boii Mask +2        --> Boii Mask +3
        neck="War. Beads +1",
        left_ear="Cessance Earring",            --> Schere Eaarring
        right_ear="Brutal Earring",             --> Boii Earring        --> Boii Earring +1
        body="Flamma Korazin +1",               --> Valorous Mail           --> Agoge Lorica +2     --> Boii Lorica +2  --> Boii Lorica +3
        hands="Sulevia's Gauntlets +2",         --> Sakpata's Gauntlets
        left_ring="Flamma Ring",                --> Niqmaddu Ring
        right_ring="Petrov Ring",               --> Moonbeam Ring           --> Moonlight Ring
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}, --> Cichol's Mantle dye 0/10, resin 0/5
        waist="Ioskeha Belt",                   --> Ioskeha Belt +1         --> Sailfi Belt +1
        legs=artifact.legs,                     --> Pumm. Cuisses +3       
        feet=artifact.feet,                     --> Pumm. Calligae +3
    }    
    
    sets.tp["DualWield"] = {}

    -- Weapon Skill Sets
    sets.ws.base = {
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        waist="Grunfeld Rope",
    }

    -- Steel Cyclone STR 60% VIT 60%
    sets.ws['Steel Cyclone'] = {
        ammo="Aurgelmir Orb",                   --> Knobkierrie
        head="Skormoth Mask",                   --> Nyame Helm
        neck="War. Beads +1",
        left_ear="Ishvara Earring",             --> Thrud Earring
        right_ear="Moonshade Earring", 
        body="Flamma Korazin +1",               --> Nyame Mail
        hands="Sulevia's Gauntlets +2",         --> Boii Mufflers +3
        left_ring="Karieyh Ring",               --> Regal Ring           
        right_ring="Ifrit Ring",                --> Epaminondas's Ring
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",            --> Boii Cuisses +3
        feet="Sulevia's Leggings +1",           --> Nyame Sollerets
    }

    sets.ws['Upheaval'] = {
        ammo="Aurgelmir Orb",      
        head="Flamma Zucchetto +2",
        neck="War. Beads +1",  
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring", 
        body="Flamma Korazin +1",   
        hands="Sulevia's Gauntlets +2", 
        left_ring="Karieyh Ring",
        right_ring="Ifrit Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
        waist="Sailfi Belt +1",  
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's Leggings +1",
    }
    
    sets.ws['Savage Blade'] = {
        ammo="Aurgelmir Orb",                  
        head="Skormoth Mask",                   
        neck="War. Beads +1",               
        left_ear="Moondshade Earring",            
        right_ear="Ishvara Earring", 
        body="Flamma Korazin +1",                      
        hands="Sulevia's Gauntlets +2",         
        left_ring="Rajas Ring",                    
        right_ring="Petrov Ring",                
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
        waist="Grunfeld Rope",                  
        legs="Sulevia's Cuisses +2",            
        feet="Sulevia's Leggings +1",           
    }

    -- Job Ability Sets
    sets.ja['Warcry'] = { 
        head=relic.head,
    }
    sets.ja['Aggressor'] = {
        body=relic.body,
    }
    sets.ja['Berserk'] = {
        feet=relic.feet,
    }
    sets.ja['Blood Rage'] = {
        body=empy.body,
    }
    sets.ja['Restraint'] = {
        hands=empy.hands,
    }
    sets.ja['Retaliation'] = {
        feet=empy.feet,
    }

    -- Idle sets
    sets.idle['Lockstyle'] = {
        head="Flamma Zucchetto +2",
        body="Flamma Korazin +1",
        hands="Flamma Manopolas +1",
        left_ring="Karieyh Ring",
        legs="Flamma Dirs +1",
        feet="Flamma Gambieras +2",
    }

    sets.idle['DT'] = {
        head="Sulevia's Mask",
        body="Sulevia's Platemail +1",
        hands="Sulevia's Gauntlets +2",
        left_ring="Karieyh Ring",
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's Leggings +1",
    }

    send_command('input /macro book 6;wait .1;input /macro set 1')
    send_command('bind f9 gs c autohasso')
    send_command('bind f10 gs c toggle TP set')
    send_command('bind ^f10 gs c toggle idle set')
    send_command('bind f11 gs c toggle weapon set')
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
        equip(sets.idle[idle_set_names[idle_index]])
    end
    if buffactive['Reive Mark'] then
        equip(sets.reive)
    end
end
 
function status_change(new,old)
    idle()
end

function buff_change(name, gain, buff_details)

end

function self_command(command)
    if command == 'toggle TP set' then
        tp_index = tp_index +1
        if tp_index > #tp_set_names then 
            tp_index = 1 
        end
        windower.add_to_chat(123, ' ----- TP set changed to '..tp_set_names[tp_index]..' -----')
        equip(sets.tp[tp_set_names[tp_index]])
    end
    if command == 'toggle idle set' then
        idle_index = idle_index +1
        if idle_index > #idle_set_names then
            idle_index = 1
        end
        windower.add_to_chat(123, ' ----- idle set changed to '..idle_set_names[idle_index]..' -----')
        equip(sets.idle[idle_set_names[idle_index]])
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
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
end