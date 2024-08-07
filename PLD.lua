function get_sets()
    setup_auto_buff()

    sets.idle = {}                  -- Leave this empty
    sets.tp = {}                    -- Leave this empty
    sets.weapon={}                  -- Leave this empty
    sets.ws = {}                    -- Leave this empty
    sets.ja = {}                    -- Leave this empty
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty

    -- Define variables 
    auto_buff_active = 0
    idle_index = 0
    idle_set_names = {"DT",}
    tp_index = 0
    tp_set_names = {"DD",}

    sets.reive={neck="Adoulin's Refuge +1",}

    artifact = {}
    relic={}
    empy={}

    -- Weapon Skill Sets
    sets.ws.base = {
    }

    send_command('input /macro book 15;wait .1;input /macro set 1')
    send_command('bind f9 gs c auto_buff_active')
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

        -- check if majesty should be re-applied
        if not buffactive['Majesty'] then
            if auto_buff_active == 1 then
                send_command('input /ja Majesty <me>')
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
    if command == 'auto_buff_active' then
        if auto_buff_active == 0 then
            auto_buff_active = 1
            windower.add_to_chat(123, '---- Auto buff on ----')
        else 
            auto_buff_active = 0
            windower.add_to_chat(123, '---- Auto buff off ----')
        end
    end
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
end

function setup_auto_buff()
    auto_buffs = S{'Majesty', 'Phalanx'}
end

function buff_change(name, gain, buff_details)
    -- if not gain then
    --     if auto_buffs:contains(name) then
    --         if name == 'Majesty' then
    --             windower.send_command('/ja Majesty <me>')
    --         elseif name = Phalanx then
    --             windower.send_command('/ma Phalanx <me>')
    --         end
    --     end
    -- end
end
