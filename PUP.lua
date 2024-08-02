  function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.tp = {}                    -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.precast.JA = {}
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty

    pup_config_index = 1
    pup_configs = {"rng", "war", "mnk", "rdm", "whm", "blm", "pld", "overdrive","skillup"}

    tp_index = 1
    tp_set_names = {"Master","Pup","Hybrid","Overdrive","DT","CureBot"}
    
    sets.idle['Normal'] = {}
    sets.idle['DT'] = {}

    sets.tp['Master'] = {
        head="Tali'ah Turban +1",
        neck="Ishtar's Collar",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Tali'ah Manteel +2",
        hands="Herculean Gloves",
        left_ring="Tali'ah Ring",
        right_ring="Petrov Ring",
        back="Visucius's Mantle",
        waist="Kuku Stone",
        legs="Tali'ah Seraweels +1",
        feet="Naga Kyahan",
    }

    sets.tp['Pup'] = {
        head="Tali'ah Turban +1",
        neck="Ishtar's Collar",
        left_ear="Kyrene's Earring",
        right_ear="Mache Earring",
        body="Tali'ah Manteel +2",
        hands="Tali'ah Gages +1",
        left_ring="Tali'ah Ring",
        right_ring="Petrov Ring",
        back="Visucius's Mantle",
        waist="Kuku Stone",
        legs="Tali'ah Seraweels +1",
        feet="Naga Kyahan",
    }

    sets.tp['Hybrid'] = {
        head="Tali'ah Turban +1",
        neck="Ishtar's Collar",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Tali'ah Manteel +2",
        hands="Herculean Gloves",
        left_ring="Tali'ah Ring",
        right_ring="Petrov Ring",
        back="Visucius's Mantle",
        waist="Kuku Stone",
        legs="Tali'ah Seraweels +1",
        feet="Naga Kyahan",
    }

    sets.tp['Overdrive'] = {
        head="Tali'ah Turban +1",
        neck="Ishtar's Collar",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Tali'ah Manteel +2",
        hands="Tali'ah Gages +1",
        left_ring="Tali'ah Ring",
        right_ring="Petrov Ring",
        back="Visucius's Mantle",
        waist="Kuku Stone",
        legs="Tali'ah Seraweels +1",
        feet="Naga Kyahan",
    }

    sets.tp['DT'] = {
        head="Tali'ah Turban +1",
        neck="Ishtar's Collar",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Tali'ah Manteel +2",
        hands="Herculean Gloves",
        left_ring="Tali'ah Ring",
        right_ring="Petrov Ring",
        back="Visucius's Mantle",
        waist="Kuku Stone",
        legs="Tali'ah Seraweels +1",
        feet="Naga Kyahan",
    }

    sets.tp["CureBot"] = {
        head={ name="Naga Somen", augments={'Pet: MP+75','Automaton: "Cure" potency +3%','Automaton: "Fast Cast"+2',}},
        neck="Ishtar's Collar",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Naga Samue",
        hands={ name="Naga Tekko", augments={'Pet: MP+80','Automaton: "Cure" potency +4%','Automaton: "Fast Cast"+3',}},
        left_ring="Tali'ah Ring",
        right_ring="Petrov Ring",
        back="Visucius's Mantle",
        waist="Kuku Stone",
        legs="Tali'ah Seraweels +1",
        feet={ name="Naga Kyahan", augments={'Pet: MP+80','Automaton: "Cure" potency +4%','Automaton: "Fast Cast"+3',}},
    }

    sets.tp['DT'] = {
        hands={ name="Naga Tekko", augments={'STR+9','Accuracy+13','"Subtle Blow"+6',}},
    }

    -- Weapon Skill Sets
    sets.ws['Stringing Pummel'] = {
        head={ name="Taeon Chapeau", augments={'Accuracy+25','"Dual Wield"+2','Weapon skill damage +3%',}},
        body="Tali'ah Manteel +2",
        hands="Tali'ah Gages +1",
        legs={ name="Taeon Tights", augments={'Accuracy+19','Weapon Skill Acc.+18','STR+6 AGI+6',}},
        feet="Tali'ah Crackows +1",
        neck="Ishtar's Collar",
        waist="Kuku Stone",
        left_ear="Mache Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Karieyh Ring",
        right_ring="Ifrit Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Haste+10','Pet: Damage taken -5%',}},
    }

    sets.ws['Howling Fist'] = {
        head={ name="Taeon Chapeau", augments={'Accuracy+25','"Dual Wield"+2','Weapon skill damage +3%',}},
        body="Tali'ah Manteel +2",
        hands={ name="Naga Tekko", augments={'STR+9','Accuracy+13','"Subtle Blow"+6',}},
        legs={ name="Taeon Tights", augments={'Accuracy+19','Weapon Skill Acc.+18','STR+6 AGI+6',}},
        feet="Tali'ah Crackows +1",
        neck="Ishtar's Collar",
        waist="Kuku Stone",
        left_ear="Mache Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Karieyh Ring",
        right_ring="Ifrit Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Haste+10','Pet: Damage taken -5%',}},
    }
    -- Job Ability Sets
    sets.precast.JA.maneuvers = {
        neck="Buffoon's Collar",
        body="Cirque Farsetto +1",
        hands = "Puppetry Dastanas",
        back="Dispersal Mantle",
    }
    sets.ja['Repair'] = {
        feet = "Puppetry Babouches",
    }

    send_command('input /macro book 1;wait .1;input /macro set 1;wait .1;input //lua load autocontrol;wait .1;input //lua load autopup')
    send_command('bind f10 gs c toggle TP set')
    send_command('bind f11 gs c toggle pup config')
    send_command('bind ^f11 gs c set pup')
end
 
function precast(spell)
    if string.find(spell.english, "Maneuver") then
        equip(sets.precast.JA.maneuvers)
    elseif spell.prefix == '/jobability' then
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    elseif spell.prefix == '/weaponskill' then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
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
        equip(sets.tp[tp_set_names[tp_index]])
    end
end
 
function status_change(new,old)
    idle()
end

function self_command(command)
    if command == 'toggle TP set' then
        tp_index = tp_index + 1
        if tp_index > #tp_set_names then tp_index = 1 end
        windower.add_to_chat('----- TP Set changed to '..tp_set_names[tp_index]..' -----')
        equip(sets.tp[tp_set_names[tp_index]])
    elseif command == 'toggle pup config' then
        pup_config_index = pup_config_index +1
        if pup_config_index > #pup_configs then pup_config_index = 1 end
        windower.add_to_chat(123,'----- pup config set to '..pup_configs[pup_config_index]..' -----')
    elseif command == 'set pup' then
        command = 'input //acon equipset '..pup_configs[pup_config_index]        
        windower.add_to_chat(123,'--- activating '..pup_configs[pup_config_index]..' ---')
        send_command(command)
        generatemaneuvers()
    end
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
    send_command('input //lua unload autopup;wait .1;input //lua unload autocontrol')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind ^f11')
end

function generatemaneuvers()
    local man_command
    man_command = 'wait .1;input //pup fire 0;wait .1;input //pup ice 0;wait .1;input //pup light 0;wait .1;input //pup dark 0;wait .1;input //pup thunder 0;wait .1;input //pup earth 0;wait .1;input //pup wind 0;wait .1;input //pup water 0;wait .1'
    if pup_config_index == 1 then --rng
        man_command = man_command..';input //pup wind 3'
    elseif pup_config_index == 2 then  --war
        man_command = man_command..';input //pup fire 2;wait .1;input //pup wind 1'
    elseif pup_config_index == 3 then --mnk
        man_command = man_command..';input //pup fire 1;wait .1;input //pup wind 1;wait .1;input //pup light 1'
    elseif pup_config_index == 4 then -- rdM
        man_command = man_command..';input //pup ice 1;wait .1;input //pup dark 1;wait .1;input //pup light 1'
    elseif pup_config_index == 5 then -- whm
        man_command = man_command..';input //pup Light 1;wait .1;input //pup dark 1;wait .1;input //ice light 1'
    elseif pup_config_index == 6 then -- blm
        man_command = man_command..';input //pup ice 3;'
    elseif pup_config_index == 7 then --pld
        man_command = man_command..';input //pup fire 2;wait .1;input //pup light 1'
    elseif pup_config_index == 8 then --overdrive
        man_command = man_command..';input //pup Light 1;wait .1;input //pup fire 1;wait .1;input //pup thunder 1'
    elseif pup_config_index == 9 then -- skillup
        man_command = man_command..';input //pup Light 2;wait .1;input //pup water 1'
    end
    send_command(man_command)
end