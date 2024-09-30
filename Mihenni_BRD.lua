function get_sets()
    sets.idle = {}                  -- Leave this empty
    sets.melee = {}                 -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.song = {}
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty

    sets.idle.normal = {
        head="Inyanga Tiara +1",
        neck="Focus Collar",
        left_ear="Flashward Earring",
        right_ear="Spellbreaker Earring",
        body="Inyanga Jubbah",
        hands="Inyanga Dastanas +1",
        left_ring="Perception Ring",
        right_ring="Inyanga Ring",
        back="Aptitude Mantle",
        waist="Acipayam Belt",
        legs="Inyanga Shalwar +1",
        feet="Inyanga Crackows +1",
    }    

    -- Specific Song Instruments
    sets.song.default = {
        range="Homestead Flute",
    }
    sets.song['Valor Minuet V'] = {
        range="Terpander",
    }
    -- Job Ability Sets
    sets.ja['Divine Seal'] = {}

    -- Casting Sets
    sets.precast.fastcast = {}

    sets.midcast.cure = {}        
    sets.midcast.divine = {}
    sets.midcast.enhancing = {}
    sets.midcast.dark = {}

    send_command('input /macro book 2;wait .1;input /macro set 1')
end

function precast(spell)
    if spell.type == 'BardSong' then
        if sets.song[spell.name] then
            equip(sets.song[spell.name])
        else
            equip(sets.song.default)
        end
    end
end

function midcast(spell)
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
end

function user_unload()
end