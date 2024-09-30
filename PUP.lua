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
        ranged="Animator P",
        ammo="Automat. Oil +3",
        head="Tali'ah Turban +2",
        neck="Sanctity Necklace",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body={ name="Taeon Tabard", augments={'Accuracy+25','"Counter"+1','STR+10',}},
        hands={ name="Herculean Gloves", augments={'Attack+29','"Triple Atk."+3',}},
        left_ring="Petrov Ring",
        right_ring="Niqmaddu Ring",
        back="Visucius's Mantle",
        waist="Windbuffet Belt +1",
        legs={ name="Taeon Tights", augments={'Accuracy+19','Weapon Skill Acc.+18','STR+6 AGI+6',}},
        feet={ name="Herculean Boots", augments={'Attack+14','"Triple Atk."+3','DEX+10',}},
    }

    sets.tp['Pup'] = {
        ranged="Animator P",
        ammo="Automat. Oil +3",
        head="Tali'ah Turban +2",
        neck="Sanctity Necklace",
        left_ear="Kyrene's Earring",
        right_ear="Mache Earring",
        body="Karagoz Farsetto +2",
        hands="Tali'ah Gages +2",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        back="Visucius's Mantle",
        waist="Klouskap Sash +1",
        legs="Tali'ah Seraweels +2",
        feet="Naga Kyahan",
    }

    sets.tp['Hybrid'] = {
        ranged="Animator P",
        ammo="Automat. Oil +3",
        head="Tali'ah Turban +1",
        neck="Sanctity Necklace",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Karagoz Farsetto +2",
        hands="Herculean Gloves",
        left_ring="Niqmaddu Ring",
        right_ring="Varar Ring +1",
        back="Visucius's Mantle",
        waist="Klouskap Sash +1",
        legs="Tali'ah Seraweels +2",
        feet="Naga Kyahan",
    }

    sets.tp['Overdrive'] = {
        ranged="Animator P",
        ammo="Automat. Oil +3",
        head="Tali'ah Turban +2",
        neck="Sanctity Necklace",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Karagoz Farsetto +2",
        hands="Tali'ah Gages +2",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        back="Viscucius's Mantle",
        waist="Klouskap Sash +1",
        legs="Tali'ah Seraweels +2",
        feet="Naga Kyahan",
    }

    sets.tp['DT'] = {
        ranged="Animator P",
        ammo="Automat. Oil +3",
        head="Tali'ah Turban +2",
        neck="Sanctity Necklace",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body="Karagoz Farsetto +2",
        hands="Herculean Gloves",
        left_ring="Tali'ah Ring",
        right_ring="Warden's Ring",
        back="Visucius's Mantle",
        waist="Kuku Stone",
        legs="Tali'ah Seraweels +2",
        feet="Naga Kyahan",
    }

    sets.tp["CureBot"] = {
        ranged="Animator P",
        ammo="Automat. Oil +3",
        head={ name="Naga Somen", augments={'Pet: MP+75','Automaton: "Cure" potency +3%','Automaton: "Fast Cast"+2',}},
        neck="Sanctity Necklace",
        left_ear="Cessance Earring",
        right_ear="Mache Earring",
        body={ name="Naga Samue", augments={'Pet: MP+80','Automaton: "Cure" potency +4%','Automaton: "Fast Cast"+3',}},
        hands={ name="Naga Tekko", augments={'Pet: MP+80','Automaton: "Cure" potency +4%','Automaton: "Fast Cast"+3',}},
        left_ring="Tali'ah Ring",
        right_ring="Petrov Ring",
        back="Visucius's Mantle",
        waist="Kuku Stone",
        legs={ name="Naga Hakama", augments={'Pet: MP+80','Automaton: "Cure" potency +4%','Automaton: "Fast Cast"+3',}},
        feet={ name="Naga Kyahan", augments={'Pet: MP+80','Automaton: "Cure" potency +4%','Automaton: "Fast Cast"+3',}},
    }

    sets.tp['TH'] = { ammo = "Perfect Lucky Egg",}

    -- Weapon Skill Sets
    sets.ws['Stringing Pummel'] = {
        ranged="Animator P",
        ammo="Automat. Oil +3",
        head={ name="Taeon Chapeau", augments={'Accuracy+25','"Dual Wield"+2','Weapon skill damage +3%',}},
        body="Karagoz Farsetto +2",
        hands="Tali'ah Gages +2",
        legs={ name="Taeon Tights", augments={'Accuracy+19','Weapon Skill Acc.+18','STR+6 AGI+6',}},
        feet="Tali'ah Crackows +1",
        neck="Sanctity Necklace",
        waist="Flame Belt",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Haste+10','Pet: Damage taken -5%',}},
    }

    sets.ws['Dragon Kick'] = {
        ranged="Animator P",
        ammo="Automat. Oil +3",
        head={ name="Taeon Chapeau", augments={'Accuracy+25','"Dual Wield"+2','Weapon skill damage +3%',}},
        body="Karagoz Farsetto +2",
        hands={ name="Naga Tekko", augments={'STR+9','Accuracy+13','"Subtle Blow"+6',}},
        legs={ name="Taeon Tights", augments={'Accuracy+19','Weapon Skill Acc.+18','STR+6 AGI+6',}},
        feet="Tali'ah Crackows +1",
        neck="Sanctity Collar",
        waist="Grunfelt Rope",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Haste+10','Pet: Damage taken -5%',}},
    }

    sets.ws['Shijin Spiral'] = {
        ranged="Animator P",
        ammo="Automat. Oil +3",
        head={ name="Taeon Chapeau", augments={'Accuracy+25','"Dual Wield"+2','Weapon skill damage +3%',}},
        body="Karagoz Farsetto +2",
        hands={ name="Naga Tekko", augments={'STR+9','Accuracy+13','"Subtle Blow"+6',}},
        legs={ name="Taeon Tights", augments={'Accuracy+19','Weapon Skill Acc.+18','STR+6 AGI+6',}},
        feet="Tali'ah Crackows +1",
        neck="Shifting Necklace +1",
        waist="Light Belt",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Haste+10','Pet: Damage taken -5%',}},
    }
    -- Job Ability Sets
    sets.precast.JA.maneuvers = {
        neck="Buffoon's Collar",
        body="Karagoz Farsetto +2",
        hands = "Puppetry Dastanas",
        back="Dispersal Mantle",
    }
    sets.ja['Repair'] = {
        feet = "Puppetry Babouches",
    }

    send_command('input /macro book 1;wait .1;input /macro set 1;wait .1;input //lua load autocontrol;wait .1;input //lua load autopup')
    send_command('bind f10 gs c toggle TP set')
    send_command('bind f11 gs c toggle pup config')
    send_command('bind ^p gs c set pup')
end
 
function precast(spell)
    if string.find(spell.english, "Maneuver") then
        equip(sets.precast.JA.maneuvers)
    elseif spell.prefix == '/jobability' then
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        elseif spell.name == 'Provoke' then
            equip(sets.tp['TH'])
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
    send_command('unbind ^p')
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