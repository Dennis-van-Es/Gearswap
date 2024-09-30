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
    weapon_set_names = {"GreatAxe","SwordandBoard","DualWield"}
    autobuff = 0
    panic = 0

    sets.weapon['GreatAxe']={
        main="Kaja Chopper",
        sub="Utu Grip",
    }

    sets.weapon['SwordandBoard'] = {
        main="Naegling",
        sub="Blurred Shield",
    }

    sets.weapon['DualWield'] = {
        main="Naegling",
        sub="Perfervid Sword",
    }

    sets.reive={neck="Adoulin's Refuge +1",}

    artifact = {}
    artifact.head="Pummeler's Mask +1"
    artifact.body="Pummeler's Lorica +2"                    --> Upgrade
    artifact.hands="Pummeler's Mufflers +1"
    artifact.legs="Pummeler's Cuisses +2"                   --> Upgrade
    artifact.feet="Pummeler's Calligae +2"                  --> Upgrade

    relic={}
    relic.head="Agoge Mask +1"             -- Warcry           --> Upgrade to Agoge
    relic.body="Warrior's Lorica"       -- Aggressor        --> Upgrade tp Agoge
    relic.hands="Warrior's Mufflers"    --
    relic.legs="Warrior's Cuisses"
    relic.feet="Warrior's Calligae"     -- Berserk

    empy={}
    empy.head="Boii Mask +2"
    empy.body="Boii Lorica"        -- Blood Rage
    empy.hands="Boii Mufflers +2"        -- Restraint
    empy.legs="Boii Cuisses +2"
    empy.feet="Boii Calligae"      -- Retaliation

    sets.tp["2Handed"] = {
        ammo="Ginsen",                          --> Coiste Bodhar
        head=empy.head,       
        neck="War. Beads +1",
        left_ear="Cessance Earring",            --> Schere Eaarring
        right_ear="Boii Earring",               --> Boii Earring +1
        body="Flamma Korazin +1",               --> Valorous Mail           --> Agoge Lorica +2     --> Boii Lorica +2  --> Boii Lorica +3
        hands="Sulevia's Gauntlets +2",         --> Sakpata's Gauntlets
        left_ring="Petrov Ring",                 --> Moonbeam Ring           --> Moonlight Ring
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        waist="Ioskeha Belt",                   --> Ioskeha Belt +1         --> Sailfi Belt +1
        legs=artifact.legs,                     --> Pumm. Cuisses +3       
        feet=artifact.feet,                     --> Pumm. Calligae +3
    }
        
    sets.tp["SwordandBoard"] = {
        ammo="Ginsen",                          --> Coiste Bodhar
        head=empy.head,
        neck="War. Beads +1",
        left_ear="Cessance Earring",            --> Schere Eaarring
        right_ear="Boii Earring",               --> Boii Earring +1
        body="Flamma Korazin +1",               --> Valorous Mail           --> Agoge Lorica +2     --> Boii Lorica +2  --> Boii Lorica +3
        hands="Sulevia's Gauntlets +2",         --> Sakpata's Gauntlets
        right_ring="Petrov Ring",               --> Moonbeam Ring           --> Moonlight Ring
        right_ring="Niqmaddu Ring",                --> Niqmaddu Ring
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        waist="Ioskeha Belt",                   --> Ioskeha Belt +1         --> Sailfi Belt +1
        legs=empy.legs,                     --> Pumm. Cuisses +3       
        feet=artifact.feet,                     --> Pumm. Calligae +3
    }    

    sets.tp["DT"]={
        ammo="Staunch Tathlum",
        head=empy.head,
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck={ name="War. Beads +1", augments={'Path: A',}},
        waist="Ioskeha Belt",
        left_ear="Cessance Earring",
        right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+9','Mag. Acc.+9',}},
        left_ring="Sulevia's Ring",
        right_ring="Warden's Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    
    sets.tp["DualWield"] = {
        ammo="Seething Bomblet +1",             --> Ginsen              --> Coiste Bodhar
        head=empy.head,
        neck="War. Beads +1",
        left_ear="Cessance Earring",            --> Schere Eaarring
        right_ear="Boii Earring",               --> Boii Earring +1
        body="Flamma Korazin +1",               --> Valorous Mail           --> Agoge Lorica +2     --> Boii Lorica +2  --> Boii Lorica +3
        hands="Sulevia's Gauntlets +2",         --> Sakpata's Gauntlets
        left_ring="Niqmaddu Ring", 
        right_ring="Petrov Ring",               --> Moonbeam Ring           --> Moonlight Ring
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        waist="Sailfi Belt +1",
        legs=artifact.legs,                     --> Pumm. Cuisses +3       
        feet=artifact.feet,                     --> Pumm. Calligae +3
    }

    -- Weapon Skill Sets
    sets.ws.base = {
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        body=artifact.body,                      
        hands=empy.hands,         
        left_ring="Karieyh Ring",
        waist="Grunfeld Rope",
    }

    -- Steel Cyclone STR 60% VIT 60%
    sets.ws['Steel Cyclone'] = {
        ammo="Aurgelmir Orb",             --> Knobkierrie
        head="Skormoth Mask",                   --> Nyame Helm
        neck="War. Beads +1",
        left_ear="Thrud Earring",   
        right_ear="Moonshade Earring", 
        body=artifact.body,               --> Nyame Mail
        hands=empy.hands,
        left_ring="Karieyh Ring",               --> Regal Ring           
        right_ring="Ifrit Ring",                --> Epaminondas's Ring
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",            --> Boii Cuisses +3
        feet="Sulevia's Leggings +2",           --> Nyame Sollerets
    }

    sets.ws['Upheaval'] = {
        ammo="Aurgelmir Orb",       
        head="Flamma Zucchetto +2",
        neck="War. Beads +1",  
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring", 
        body=artifact.body,   
        hands=empy.hands,       
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
        waist="Sailfi Belt +1",  
        legs="Odyssean Cuisses",
        feet="Sulevia's Leggings +2",
    }

    sets.ws["Ukko's Fury"] = {
        ammo="Yetshila",
        head=empy.head,
        neck="War. Beads +1",  
        left_ear="Cessance Earring",
        right_ear="Moonshade Earring", 
        body=artifact.body,   
        hands="Flamma Manopolas +1",       
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Damage taken-5%',}},
        waist="Sailfi Belt +1",  
        legs=empy.legs,            --> Agoge
        feet="Sulevia's Leggings +2",       --> Boii
    }


    sets.ws["King's Justice"] = {
        ammo="Aurgelmir Orb", 
        head="Flamma Zucchetto +2",
        neck="War. Beads +1",  
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring", 
        body=artifact.body,   
        hands=empy.hands,  
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
        waist="Sailfi Belt +1",  
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's Leggings +2",
    }
    
    sets.ws['Savage Blade'] = {
        ammo="Aurgelmir Orb",            
        head="Skormoth Mask",                   
        neck="War. Beads +1",               
        left_ear="Moondshade Earring",            
        right_ear="Thrud Earring", 
        body=artifact.body,                      
        hands=empy.hands,         
        left_ring="Rajas Ring",                    
        right_ring="Niqmaddu Ring",                
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
        waist="Sailfi Belt +1",                  
        legs="Sulevia's Cuisses +2",            
        feet="Sulevia's Leggings +2",           
    }

    -- Job Ability Sets
    sets.ja['Warcry'] = { 
        head=relic.head,
    }

    sets.ja['Aggressor'] = {
        head=artifact.head,
        body=relic.body,
    }
    sets.ja['Berserk'] = {
        body=artifact.body,
        feet=relic.feet,
    }
    sets.ja['Blood Rage'] = {
        body=empy.body,
    }
    sets.ja['Restraint'] = {
        hands=empy.hands,
    }
    sets.ja['Retaliation'] = {
        hands=artifact.hands,
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
        head="Sulevia's Mask +2",
        body="Sulevia's Platemail +2",
        hands="Sulevia's Gauntlets +2",
        left_ring="Karieyh Ring",
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's Leggings +2",
    }

    send_command('input /macro book 6;wait .1;input /macro set 1;wait 6;input /lockstyleset 5')
    send_command('bind f9 gs c autobuff')
    send_command('bind f10 gs c toggle TP set')
    send_command('bind ^f10 gs c toggle idle set')
    send_command('bind !f10 gs c panic')
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
        if panic == 0 then
            equip(sets.tp[tp_set_names[tp_index]])
        else
            equip(sets.tp['DT'])
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
    if player.status == 'Engaged' then
        use_buffs()
    else
        if autobuff == 3 then
            windower.add_to_chat('-- Attempting next fight --')
            send_command('wait 1;exec nextfight')
        end
    end
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
    if command=='panic' then
        panic = panic+1
        if panic > 1 then
            panic = 0
        end
        if panic == 1 then 
            equip(sets.tp['DT'])
            windower.add_to_chat(123, '---- Panic Mode Enabled ----')
        else
            windower.add_to_chat(123, '---- Panic Mode Disabled ----')
        end
    end
    if command == 'autobuff' then
        autobuff = autobuff + 1
        if autobuff > 3 then
            autobuff = 0
        end
        if autobuff == 0 then
            windower.add_to_chat(123, '---- No auto buffs ----')
        elseif autobuff == 1 then
            windower.add_to_chat(123, '---- Auto Hasso on ----')
        elseif autobuff == 2 then
            windower.add_to_chat(123,'---- Auto Hasso and Retalliation on ----')
        elseif autobuff == 3 then
            windower.add_to_chat(123,'---- Auto Hasso, Retalliation and auto fight on ----')
        end
    end
    if command == 'HealMe' then
        HealMe()
    end
end

function sub_job_change(new,old)
    if new == 'SAM' then
        send_command('input /macro book 6;wait .1;input /macro set 1')
        tp_index = 1        -- 2 handed
        weapon_index = 1    -- great axe
    elseif new == 'DRG' then
        send_command('input /macro book 6;wait .1;input /macro set 2')
        tp_index = 2        -- SwordandBoard
        weapon_index = 3    -- SwordandBoard
    elseif new == 'NIN' then
        send_command('input /macro book 6;wait .1;input /macro set 3')
        tp_index = 3        -- DualWield
        weapon_index = 3    -- xxx
    elseif new == 'DNC' then
        send_command('input /macro book 6;wait .1;input /macro set 1')
        tp_index = 3        -- DualWield
        weapon_index = 3    -- xxx
    end
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind ^f10')
    send_command('unbind !f10')
    send_command('unbind f11')
end

function use_buffs()
    command=''
    -- check if Hasso should be re-applied
    if not buffactive['Hasso'] then
        if autobuff > 0 then
            if weapon_index == 1 then
                command = command..'input /ja Hasso <me>;wait 2;'
                windower.add_to_chat(123,'--- Auto Hasso ---')
            end
        end
    end
    if not buffactive['Retaliation'] then
        if autobuff > 2 then
            command = command..'input /ja Retaliation <me>;wait 2;'
            windower.add_to_chat(123,'--- Auto Retaliation ---')
        end
    end
    if autobuff > 0 then
        if not buffactive['Berserk'] then
            command = command..'input /ja Berserk <me>;wait 2;'
            windower.add_to_chat(123,'--- (trying) Auto Berserk ---')
        end
        if not buffactive['Restraint'] then
            command = command..'input /ja Restraint <me>;wait 2;'
            windower.add_to_chat(123,'--- (trying) Auto Restraint ---')
        end
    end
    if command ~= '' then
        send_command(command)
    end
end

function HealMe()
    if buffactive['petrification'] then
        send_command('input //send Mihenni /ma Stona Dennis')
    elseif buffactive['curse'] then
        send_command('input //send Mihenni /ma Cursna Dennis')
    elseif buffactive['plague'] then
        send_command('input //send Mihenni /ma Viruna Dennis')
    elseif buffactive['sleep'] then
        send_command('input //send Mihenni /ma Curaga Dennis')
    elseif buffactive['paralysis'] then
        send_command('input //send Mihenni /ma Paralyna Dennis')    
    elseif buffactive['disease'] then
        send_command('input //send Mihenni /ma Viruna Dennis')
    elseif buffactive['blindness'] then
        send_command('input //send Mihenni /ma Blindna Dennis')
    elseif buffactive['Poison'] then
        send_command('input //send Mihenni /ma Poisona Dennis')
    end
end