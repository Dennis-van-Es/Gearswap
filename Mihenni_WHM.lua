function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.melee = {}                 -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
     sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty
 
    sets.idle.normal = {
        head="Inyanga Tiara +1",
        neck="Focus Collar",
        left_ear="Flashward Earring",
        right_ear="Spellbreaker Earring",
        body="Inyanga Jubbah +1",
        hands="Inyanga Dastanas +1",
        left_ring="Perception Ring",
        right_ring="Inyanga Ring",
        back="Aptitude Mantle",
        waist="Acipayam Belt",
        legs="Inyanga Shalwar +1",
        feet="Inyanga Crackows +1",
    }    
    
    -- Job Ability Sets
    sets.ja['Divine Seal'] = {}

    -- Casting Sets
    sets.precast.fastcast = {
        back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}},
    }

    sets.midcast.cure = {}        
    sets.midcast.divine = {}
    sets.midcast['Enhancing Magic'] = {
        waist="Olympus Sash",
    }
    sets.midcast.dark = {}

    send_command('input /macro book 1;wait .1;input /macro set 1;wait 6;input /lockstyleset 1')
end

function precast(spell)
    if spell.prefix == "/magic" then
        equip(sets.precast.fastcast)
    end
end

function midcast(spell)
    if sets.midcast[spell.skill] then
        equip(sets.midcast[spell.skill])
    end
    -- Cancel active sneak 
    if spell.english == 'Sneak' and spell.target.name == player.name then
        send_command('cancel 71;')
    end   
end

function aftercast(spell)
    equip(sets.idle.normal)
end

function status_change(new,old)
end

function self_command(command)
    if command == 'C1' then
        CurePt('<p1>')
    elseif command == 'C2' then 
        CurePt('<p0>')
    elseif command == 'C3' then 
        CurePt('<p2>')
    elseif command == 'C4' then 
        CurePt('<p3>')
    elseif command == 'C5' then 
        CurePt('<p4>')
    elseif command == 'C6' then 
        CurePt('<p5>')
    end
end

function CurePt(target)
    send_command('input /ma "Cure V" '..target)
end
