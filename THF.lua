  function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.tp = {}                 -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty
    sets.ranged = {}                -- leave this empty
    
    tp_index = 1
    tp_set_names = {"Normal","TH","DT"}
 
    sets.idle.normal = {
        head="Meghanada Visor +1",
        body="Meghanada Cuirie +1",
        hands="Meghanada Gloves +1",
        legs="Meghanada Chausses +2",
        feet="Jute Boots +1",
    }
    
    sets.tp['Normal'] = {
        ammo="Aurgelmir Orb",
        head="Adhemar Bonnet",
        neck="Ishtar's Collar",
        left_ear="Mache Earring",
        right_ear="Cessance Earring",
        body="Mummu Jacket +2",
        hands="Adhemar Wristbands",
        left_ring="Oneiros Ring",
        right_ring="Petrov Ring",
        legs="Meghanada Chausses +2",
        feet="Plunderer's Poulaines +1",
        waist="Chuq'aba Belt",
        back="Toutasis's Cape",    
    }

    sets.tp['TH'] = {
        hands="Plunderer's Armlets",
        feet="Skulker's Poulaines",
    }

    sets.tp['DT'] = {
        ammo="Staunch Tathlum",
        head="Meghanada Visor +1",
        body="Meghanada Cuirie +1",
        hands="Meghanada Gloves +1",
        legs="Mummu Kecks +1",
        feet="Meghanada Jambeaux +1",
    }

    -- Weapon Skill Sets
    sets.ws['Evisceration'] = {
        ammo="Yetshila",
        head="Mummu Bonnet +1",
        body="Adhemar Jacket",
        hands="Adhemar Wristbands",
        left_ear="Moonshade Earring",
        hands="Mummu Wristbands +1",
        left_ring="Mummu Ring",
        feet="Mummu Gamashes +1"
    }

    sets.ws['Aeolian Edge'] = {
        left_ear="Moonshade Earring",
        right_ear="Friomisi Earring",
        right_ring="Acumen Ring",
        legs="Shneddick Tights +1",
        feet="Adhemar Gamashes",
        back="Toro Cape",
        waist="Eschan Stone",
    }

    sets.ws['Dancing Edge'] = {
        body="Meghanada Cuirie +1",
        left_ear="Mache Earring",
        hands="Meghanada Gloves +1",
        back="Toutasis's Cape",
    }

    sets.ws["Rudra's Storm"] = set_combine(sets.tp['Normal'],{
        head="Adhemar Bonnet",
        left_ear="Moonshade Earring",
        body="Meghanada Cuirie +1",
        hands="Adhemar Wristbands",
        right_ring="Ramuh Ring",
        feet="Adhemar Gamashes",
    })

    sets.ws["Mandalic Stab"] = sets.ws["Rudra's Storm"]
   
    -- Job Ability Sets
    sets.ja['Steal'] = {
        head = "Rogue's Bonnet",
        hands="Rogue's Armlets",
        legs = "Rogue's Culottes",
    }

    sets.ja['Flee'] = {
        feet="Rogue's Poulaines",
    }

    sets.ja['Sneak Attack'] = { 
        body="Meghanada Cuirie +1",         -- DEX
        right_ring="Ramuh Ring",
    }

    sets.ja['Trick Attack'] = {
    }
    
    sets.ja['Hide']= {
        body="Pillager's Vest",
    }

    sets.ja['Quickstep'] = sets.tp["TH"]

    send_command('input /macro book 3;wait .1;input /macro set 1')
    send_command('bind f10 gs c toggle TP set')
end
 
function precast(spell)
    if spell.prefix == '/jobability' then
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    elseif spell.prefix == '/weaponskill' then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        end
    end;    
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
        equip(sets.idle.normal)       
    end
end
 
function status_change(new,old)
    idle()
end

function self_command(command)
    if command == 'toggle TP set' then
        tp_index = tp_index +1
        if tp_index > #tp_set_names then tp_index = 1 end
        send_command('@input /echo ----- TP Set changed to '..tp_set_names[tp_index]..' -----')
        equip(sets.tp[tp_set_names[tp_index]])
    end    
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind f10')
end