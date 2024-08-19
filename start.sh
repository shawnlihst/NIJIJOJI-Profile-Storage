#!/bin/bash



cat /dev/null >  /mc/mc01/screenlog.0
taskset -c 0,1,2  screen -d -m -L -S "mc01" java  -Xms7G -Xmx7G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=40    -XX:G1MaxNewSizePercent=50    -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=15    -XX:InitiatingHeapOccupancyPercent=20   --add-modules=jdk.incubator.vector -jar  /mc/mc01/purpur-1.21.1-2294.jar --nogui

