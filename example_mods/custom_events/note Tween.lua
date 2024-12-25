var = {time = 1, alpha = 0}
note = {0, 7} -- 0 ~ 7
hideNote = false
function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'note Tween' then
        --debugPrint('HI')
        if value1 == '' then note = {0, note[2]} end
        if value2 == '' then note = {note[1], 7} end
        if value1 ~= '' then note = {value1, note[2]} end
        if value2 ~= '' then note = {note[1], value2} end
        if value1 == 'visible' then
            if not hideNote then
                for i = 0,7 do
                    noteTweenAlpha('visibleNote'..i, i, 0, 0.0000000001, 'Liner')
                    hideNote = true
                end
            else
                for i = 0,7 do
                    noteTweenAlpha('visibleNote'..i, i, 1, 0.0000000001, 'Liner')
                    hideNote = false
                end
            end
        end

        if not hideNote then
            for i = note[1],note[2] do
                noteTweenAlpha('noteTween'..i, i, var.alpha, var.time, 'liner')
                hideNote = true
                --debugPrint(i, note,'start')
            end
        else
            for i = note[1],note[2] do
                noteTweenAlpha('noteTween'..i, i, 1, var.time, 'liner')
                hideNote = false
                --debugPrint(i, note,'end')
            end
        end
    end
end