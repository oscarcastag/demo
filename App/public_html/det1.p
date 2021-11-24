def input parameter v-cli as inte.

for each order where custnum = v-cli no-lock.
    display order WITH width 332.
    FOR EACH orderlin OF order.
        DISP orderlin WITH WIDTH 332.
    END.
end.

