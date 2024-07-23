  function get_sets()
    define_spells() -- Fills variables with spellnames

    auto_buf = 0

    tp_index = 1
    tp_set_names = {"Normal","DT"}
    weapon_index = 1
    weapon_set_names = {"FullAttack","Magic"}
    idle_index = 1
    idle_set_names = {"AF","Relic","Empyrean","DT"}
    learning = 0
    
    sets.idle = {}                  -- Leave this empty
    sets.tp = {}                    -- Leave this empty
    sets.weapon = {}                --Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty

    sets.weapon['FullAttack'] = {main="Naegling",sub="Thibron"}
    sets.weapon['Magic']={main="Naegling",sub="Perfervid Sword"}

    sets.idle["AF"] = {
        head="Assimilator's Keffiyeh",
        body="Assimilator's Jubbah +2",
        hands="Assimilator's Bazubands",
        legs="Assimilator's Shalwar",
        feet="Assimilator's Charuqs",
    }

    sets.idle["Relic"] = {
        head="Mirage Keffiyeh",
        body="Luhlaza Jubbah +1",
        hands="Mirage Bazubands",
        legs="Luhlaza Shalwar +1",
        feet="Mirage Charuqs",
    }

    sets.idle["Empyrean"] = {
        head="Hashishin Kavuk",
        body="Mavi Mintan +1",
        hands="Mavi Bazubands +1",
        leggs="Mavi Tayt +1",
        feet="Mavi Basmak",
    }

    sets.idle["DT"] = {
        ammo="Staunch Tathlum",
        head="Ayanmo Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Ayanmo Manopolas +2",
        legs="Ayanmo Cosciales +2",
        feet="Ayanmo Gambieras +2",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    
    sets.tp['Normal'] = {
        ammo="Aurgelmir Orb",
        head="Adhemar Bonnet",
        neck="Mirage Stole +1",
        left_ear="Mache Earring",
        right_ear="Cessance Earring",
        body="Adhemar Jacket",
        hands="Herculean Gloves",
        left_ring="Ayanmo Ring",
        right_ring="Petrov Ring",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
        waist="Windbuffet Belt +1",
        legs="Taeon Tights",
        feet="Herculean Boots",
    }
    
    sets.tp['DT'] = {
        ammo="Staunch Tathlum",
        head="Ayanmo Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Ayanmo Manopolas +2",
        legs="Ayanmo Cosciales +2",
        feet="Ayanmo Gambieras +2",
        neck="Mirage Stole +1",
        waist="Windbuffet Belt +1",
        left_ear="Mache Earring",
        right_ear="Cessance Earring",
        left_ring="Ayanmo Ring",
        right_ring="Petrov Ring",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }

    sets.tp.spellLearning = {neck="Adoulin's Refuge +1",hands="Assim. Bazu.",}
    
    -- Fast Cast
    sets.precast.fastcast = {
        ammo="Staunch Tathlum",
        head="Jhakri Coronal +2"
        body="Luhlaza Jubbah +1",
        hands="Jhakri Cuffs +2",
        left_ring="Jhakri Ring",
        legs="Ayanmo Cosciales +2",
        feet="Jhakri Pigaches +1",    
    }

    sets.precast.blue = set_combine(sets.precast.fastcast,{body="Mavi Mintan +1"})

    sets.midcast.BlueMagic = {
        ammo="Ghastly Tathlum",
        head="Jhakri Coronal +2",
        neck="Mirage Stole +1",      
        left_ear="Friomisi Earring",
        right_ear="Halasz Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        left_ring="Jhakri Ring",
        right_ring="Acumen Ring",
        back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
        waist="Eschan Stone",
        legs="Jhakri Slops +1",
        feet="Jhakri Pigaches +1",
    }

    -- Weaponskill Sets
    sets.ws.general = {
        right_ear="Moonshade Earring",
        body="Assimilator's Jubbah +2",
        hands="Jhakri Cuffs +2",
        left_ring="Karieyh Ring",
        back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},   
    }

    -- Savage Blade (STR 50% MND 50%)
    sets.ws["Savage Blade"] = {
        ammo="Aurgelmir Orb",
        head="Ayanmo Zucchetto +2",
        neck="Mirage Stole +1",
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        body="Assimilator's Jubbah +2",
        hands="Jhakri Cuffs +2",
        left_ring="Karieyh Ring",
        right_ring="Ifrit Ring",
        back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
        waist="Thunder Belt",
        legs="Ayanmo Cosciales +2",
        feet="Ayanmo Gambieras +2",
    }

    -- Chant du Cygne (DEX 80%)
    sets.ws["Chant du Cygne"] = {
        ammo="Aurgelmir Orb",
        head="Adhemar Bonnet",
        neck="Mirage Stole +1",
        left_ear="Mache Earring",
        right_ear="Cessance Earring",
        body="Assimilator's Jubbah +2",
        hands="Ayanmo Manopolas +2",
        left_ring="Ramuh Ring",
        right_ring="Rajas Ring",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+7','"Dbl.Atk."+10','Damage taken-3%',}},
        waist="Light Belt",
        legs="Adhemar Kecks",
        feet="Adhemar Gamaches",
    }

    -- Requiscat (MND 73% / 76% / 79% / 82% / 85%))
    sets.ws["Requiescat"] = {
        ammo="Aurgelmir Orb",
        waist="Soil Belt",
        left_ear="Moonshade Earring",
        right_ear="Cessance Earring", 
        body="Jhakri Robe +2",       
        hands="Jhakri Cuffs +2",
        right_ring="Petrov Ring",
        legs="Jhakri Slops +1",
        feet="Jhakri Pigaches +1",
    }
    -- Sanguine Blade (STR 30% MND 50%)
    sets.ws["Sanguine Blade"] = {
        head="Jhakri Coronal +2",
        left_ear="Friomisi Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        left_ring="Icesoul Ring",
        back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
        waist="Eschan Stone",
        legs="Jhakri Slops +1",
        feet="Jhakri Pigaches +1",
    }
    
    -- Expiacion (STR 30% INT 30% DEX 20%)
    sets.ws["Expiacion"] = {
        ammo="Aurgelmir Orb",
        neck="Mirage Stole +1",
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        body="Assimilator's Jubbah +2",
        hands="Jhakri Cuffs +2",
        left_ring="Karieyh Ring",
        right_ring="Rajas Ring",
        back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }

    send_command('input /macro book 11;wait .1;input /macro set 1;wait .1;input //lua load blualert;wait .1;input //lua load azuresets')
    send_command('bind f10 gs c toggle TP set')
    send_command('bind ^f10 gs c toggle idle set')
    send_command('bind ^f11 gs c toggle learning')
    send_command('bind f11 gs c toggle weapon set') 
    send_command('bind f9 gs c auto_buf')
end
 
function precast(spell)
    if spell.prefix =='/magic' then
        if spell.type == 'BlueMagic' then
            equip(sets.precast.blue)
        else 
            equip(sets.precast.fastcast)
        end
    elseif spell.prefix == '/jobability' then        
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    elseif spell.prefix == '/weaponskill' then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws.general)
        end
    end
end
 
function midcast(spell)
    if sets.midcast[spell.name] then
        equip(sets.midcast[spell.name])
    elseif spell.type == 'BlueMagic' then
        --windower.add_to_chat(123,'Blue Magic detected: '..spell.english)
        if magic_spell:contains(spell.english) then
            equip(sets.midcast.BlueMagic)
        end
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
        equip(sets.tp[tp_set_names[tp_index]])
    elseif player.status == 'Resting' then
        equip(sets.idle.rest)
    else
        equip(sets.idle['DT'])       
    end
end
 
function status_change(new,old)
    idle()
end

function buff_change(name, gain, buff_details)
    if auto_buf == 1 and not gain then
        if name == 'Attack Boost' then
            send_command('input /ma "Nat. Meditation" <me>')
        end
    end
end

function self_command(command)
    if command == 'toggle TP set' then
        tp_index = tp_index + 1
        if tp_index > #tp_set_names then tp_index = 1 end
        windower.add_to_chat('----- TP Set changed to '..tp_set_names[tp_index]..' -----')
        equip(sets.tp[tp_set_names[tp_index]])
    elseif command == 'toggle weapon set' then
        weapon_index = weapon_index + 1
        if weapon_index > #weapon_set_names then weapon_index = 1 end
        windower.add_to_chat('----- Weapon Set changed to '..weapon_set_names[weapon_index]..' -----')
        equip(sets.weapon[weapon_set_names[weapon_index]])
    elseif command == 'toggle idle set' then
        idle_index = idle_index + 1
        if idle_index > #idle_set_names then idle_index = 1 end
        windower.add_to_chat(123, '---- Idle set changed to '..idle_set_names[idle_index]..' ----')        
        equip(sets.idle[idle_set_names[idle_index]])
    elseif command == 'toggle learning' then
        learning = learning + 1
        if learning > 1 then
             learning = 0
             send_command('input //gs enable hands;wait .1;input //gs enable neck')
             windower.add_to_chat(123,'---- Learning off ----')
        else
            equip(sets.tp.spellLearning)
            send_command('input //gs disable hands;wait .1;input //gs disable neck')
            windower.add_to_chat(123,'---- Learning on ----')
        end
    elseif command == 'auto_buf' then
        if auto_buf == 0 then
            auto_buf = 1
            windower.add_to_chat(123, '---- Auto bufs on ----')
        else 
            auto_buf = 0
            windower.add_to_chat(123, '---- Auto bufs off ----')
        end
    else
        windower.add_to_chat(123,'Unkown command')
    end
end

-- Called when this job file is unloaded (eg: job change)
function file_unload(file_name)
    send_command('input //lua unload azuresets;wait .1;input //lua unload blualert')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind ^f10')
    send_command('unbind ^f11')
    send_command('unbind ^f9')
end

function define_spells()
    magic_spell = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Deathray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb',
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast',
        'Eyes on Me','Mysterious Light',
        'Thermal Pulse',
        'Charged Whisker','Gate of Hades',
        'Entomb','Spectral Floe','Subduction','Tenebral Crush','Molting Plumage',
        'Occultation',
    }
end