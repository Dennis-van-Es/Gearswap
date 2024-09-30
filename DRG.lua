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

    artifact = {}                               -- Drachen --> Vishap
    artifact.head="Drachen Armet"
    artifact.body="Drachen Mail"
    artifact.hands="Drachen Finger Gauntlets"
    artifact.legs="Drachen Brais" 
    artifact.feet="Drachen Greaves"

    relic={}                                    -- Wyrm --> Pteroslaver
    relic.head="Wyrm Armet"
    relic.body="Wyrm Mail"
    relic.hands="Wyrm Finger Gauntlets"
    relic.legs="Wyrm Brais"
    relic.feet="Wyrm Greaves"

    empy={}                                     -- Lancer --> Peltast's
    empy.head="Peltast's Mezail"
    empy.body="Peltast's Plackart"
    empy.hands="Peltast's Vambraces"
    empy.legs="Peltast's Cuissots"
    empy.feet="Peltast's Schynbalds"

    sets.idle.normal = {}    
    
    sets.tp['Glass Cannon'] = {
        ammo="Aurgelmir Orb",               
        head="Flamma Zucchetto +2",
        neck="Dragoon's Collar +1",
        left_ear="Cessance Earring",
        right_ear="Sroda Earring",
        body="Flamma Korazin +1",
        hands="Sulevia's Gauntlets +2",
        left_ring="Petrov Ring",
        right_ring="Niqmaddu Ring",
        back="Bleating Mantle",
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }

    sets.tp['Normal'] = {      
        ammo="Aurgelmir Orb",
        head="Flamma Zucchetto +2",
        neck="Dragoon's Collar +1",
        left_ear="Cessance Earring",
        right_ear="Sroda Earring",
        body="Flamma Korazin +1",
        hands="Sulevia's Gauntlets +2",
        left_ring="Petrov Ring",
        right_ring="Niqmaddu Ring",
        back="Bleating Mantle",
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }

    sets.tp['DT'] = {
        ammo="Staunch Tathlum",
        head="Flamma Zucchetto +2",
        neck="Dragoon's Collar +1",
        left_ear="Cessance Earring",
        right_ear="Sroda Earring",
        body="Sulevia's Plate. +1",
        hands="Sulevia's Gauntlets +2",
        left_ring="Petrov Ring",
        right_ring="Niqmaddu Ring",
        back="Bleating Mantle",    
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }

    -- Magic sets
    sets.precast.general = {}
    
    -- Weapon Skill Sets
        
    sets.ws['Stardiver'] = {
        neck="Dragoon's Collar +1",
        left_ear="Ishvara Earring",
        right_ear="Sroda Earring",
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
    }

    sets.ws['Diarmuid'] = {
        neck="Dragoon's Collar +1",
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        waist="Sailfi Belt +1",
    }

    sets.ws['Impuls Drive'] = {
        neck="Dragoon's Collar +1",
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
        waist="Sailfi Belt +1",
    }

    sets.ws["Cammlann's Torment"] = {
        neck="Dragoon's Collar +1",
        body="Sulevia's Plate +2",
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
        back="Buquwik Cape",
        waist="Sailfi Belt +1",
        legs="Flamma Dirs +1",
        feet="Flamma Gambieras +2",
    }

    sets.ws['Drakesbane'] = {
        neck="Dragoon's Collar +1",
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
        waist="Sailfi Belt +1",
    }

    sets.ws['Geirskogul'] = {
        neck="Dragoon's Collar +1",
        left_ear="Thrud Earring",
        left_ring="Karieyh Ring",
        right_ring="Niqmaddu Ring",
        waist="Sailfi Belt +1",
    }

    sets.ws['Leg Sweep'] = {
        left_ear="Ishvara Earring",
        left_ring="Karieyh Ring",
    }
    
    -- Job Ability Sets
    sets.ja['Call Wyvern'] = {
        body=relic.body,
    }
    sets.ja['Jump'] = {}
    sets.ja['Spirit Jump'] = {
        legs=empy.legs,
        feet=empy.feet,
    }
    sets.ja['Spirit Link'] = {
        hands=empy.hands,
    }
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
    if player.max_hp - player.hp > 400 then
        CureMe()
    end
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
    if gain then
        if name == 'paralysis' then
            send_command('input //send Mihenni /ma Paralyna Dennis')
        end
        if name == 'petrified' then
            send_command('input //send Mihenni /ma Stona Dennis')
        end
        if name == 'poison' then
            send_command('input //send Mihenni /ma Poisona Dennis')
        end
        if name == 'curse' then
            send_command('input //send Mihenni /ma Cursna Dennis')
        end
        if name == 'plague' then
            send_command('input //send Mihenni /ma Viruna Dennis')
        end
        if name == 'Evasion Down' then
            send_command('input //send Mihenni /ma Erase Dennis')
        end
        windower.add_to_chat(123,'--------- Gained: '..name..' ---------')
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
    if command == 'CureMe' then
        CureMe()
    end
    if command == 'Holy' then
        send_command('input //send Mihenni /ma "Holy" <bt>')
    end
end

function user_unload()
    send_command('unbind f10')
    send_command('unbind f9')    
end

function CureMe()
    windower.add_to_chat(123,'max hp = '..player.max_hp..'. Current = '..player.hp..'. Missing: '..player.max_hp - player.hp)
    if player.max_hp - player.hp > 600 then
        send_command('input //send Mihenni /ma "Cure VI" Dennis')
    elseif player.max_hp - player.hp > 500 then
        send_command('input //send Mihenni /ma "Cure V" Dennis')
    elseif player.max_hp - player.hp > 400 then
        send_command('input //send Mihenni /ma "Cure IV" Dennis')
    elseif player.max_hp - player.hp > 200 then
        send_command('input //send Mihenni /ma "Cure III" Dennis')
    else
        send_command('input //send Mihenni /ma "Regen IV" Dennis')
    end
end