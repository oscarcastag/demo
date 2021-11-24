def input parameter v-tabla as char.

for each _file where _file-name = v-tabla no-lock.
    display _file-name.
    FOR EACH _field OF _file.
        DISP _field WITH WIDTH 332.
    END.
end.

