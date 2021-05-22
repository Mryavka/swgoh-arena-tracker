FROM iprobedroid/swgoh-arena-tracker:beta-24 as builder

FROM mcr.microsoft.com/dotnet/runtime:5.0
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["dotnet", "SimpleTracker.dll"]

ENV DISCORD_WEB_HOOK=https://discord.com/api/webhooks/...  \
        ARENA_TYPE=SQUAD \
        ALLY_CODES_URL=http://rotbot.eu/sniper/ac-577794467709583360-squad.json  \
        CUSTOM_MESSAGE_STATUS="**\[%PLAYER_NAME%\](\<https://swgoh.gg/p/%ALLY_CODE%\>/) is at %CURRENT_RANK% \<:crystals:845586958977073172\> %TIME_TO_PO%**" \
        CUSTOM_MESSAGE_CLIMB="\<:b_up:845586958498398209\> **\[%PLAYER_NAME%\](\<https://swgoh.gg/p/%ALLY_CODE%\>/) %PREVIOUS_RANK% \<:r_up:845586960314794024\> %CURRENT_RANK% \<:crystals:845586958977073172\> %TIME_TO_PO%**" \
        CUSTOM_MESSAGE_DROP="\<:b_down:845586958859632640\> **\[%PLAYER_NAME%\](\<https://swgoh.gg/p/%ALLY_CODE%\>/) %CURRENT_RANK% \<:l_down:845586959056896001\> %PREVIOUS_RANK% \<:crystals:845586958977073172\> %TIME_TO_PO%**" \
