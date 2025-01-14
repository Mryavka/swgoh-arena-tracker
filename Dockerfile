FROM iprobedroid/swgoh-arena-tracker:beta-24 as builder

FROM mcr.microsoft.com/dotnet/runtime:5.0
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["dotnet", "SimpleTracker.dll"]

ENV DISCORD_WEB_HOOK=https://discord.com/api/webhooks/845578018726346782/vev4ZvDqeUKguBWkdBnoYn_7YJUvTPRI0dLYI0uQszLtzx90VlOlc2Lz55ocaqPEO0Vj \
        ARENA_TYPE=SQUAD \
        ALLY_CODES_URL=https://gist.github.com/Mryavka/e3ed0883fc6194af5320f219efe68eb2/raw \
        CUSTOM_MESSAGE_STATUS="**%USER_ICON% [%PLAYER_NAME%](<https://swgoh.gg/p/%ALLY_CODE%>/) is at %CURRENT_RANK% <:crystals:845586958977073172> %TIME_TO_PO%**" \
        CUSTOM_MESSAGE_CLIMB="%USER_ICON% <:b_up:845586958498398209> **[%PLAYER_NAME%](<https://swgoh.gg/p/%ALLY_CODE%>/) %PREVIOUS_RANK% <:r_up:845586960314794024> %CURRENT_RANK% <:crystals:845586958977073172> %TIME_TO_PO%**" \
        CUSTOM_MESSAGE_DROP="%USER_ICON% <:b_down:845586958859632640> **[%PLAYER_NAME%](<https://swgoh.gg/p/%ALLY_CODE%>/) %CURRENT_RANK% <:l_down:845586959056896001> %PREVIOUS_RANK% <:crystals:845586958977073172> %TIME_TO_PO%**" \
