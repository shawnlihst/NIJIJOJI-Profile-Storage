#!/bin/bash



cat /dev/null >  /mc/mc01/screenlog.0
taskset -c 0,1,2,3  screen -d -m -L -S "mc01" java  -Xms8G -Xmx8G -XX:+UseZGC -XX:AllocatePrefetchStyle=1 -XX:-ZProactive -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+AlwaysActAsServerClassMachine -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:AllocatePrefetchStyle=3 -XX:NmethodSweepActivity=1 -XX:ReservedCodeCacheSize=400M -XX:NonNMethodCodeHeapSize=12M -XX:ProfiledCodeHeapSize=194M -XX:NonProfiledCodeHeapSize=194M -XX:-DontCompileHugeMethods -XX:+PerfDisableSharedMem -XX:+UseFastUnorderedTimeStamps -XX:+UseCriticalJavaThreadPriority -XX:+EagerJVMCI -Dgraal.TuneInlinerExploration=1 -XX:+UseTransparentHugePages -XX:LargePageSizeInBytes=2m --add-modules=jdk.incubator.vector -Dfile.encoding=UTF-8 -Djava.security.egd=file:/dev/urandom -Dpaper.playerconnection.keepalive=60  -jar  /mc/mc01/purpur-1.21.1-2298.jar --nogui