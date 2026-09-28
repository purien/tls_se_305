@echo off
set IP=192.168.1.32 
set PORT=8888
set SEN=key7.com
set ID=Client_identity
REM
set PIN=0000
set AID=010203040500
REM
set BLOBSECRET=1234
set BLOB00=001180EC00000100F8D81105FA680FCA4299EF06BED42C592B0AFA0157476800E6F38CDFA9D9B6B5BD91172031EAFAEFF550E64FFA453988FC62127D57C6A37824AC93
set type=00
set keyindex=11
set param=80
set keyid=EC000001
REM
REM
tlsse -c -H im -H  aid%AID%  -H pin%PIN%  -H  #?30%BLOBSECRET%  -H  #?02 -h %IP% -p %PORT%  -S %SEN% -H identity%ID%
tlsse -c -H quiet -H im -H  aid%AID%  -H pin%PIN%  -H  #.?33%type%%keyindex%%param%%keyid% -h %IP% -p %PORT%  -S %SEN% -H identity%ID%  1>blob.txt
set /p BLOB=<blob.txt
echo BLOB=%BLOB%
echo %BLOB% 1>blob_%keyid%.txt
tlsse -c  -H im    -H  aid%AID%  -H pin%PIN%  -H  #c%keyindex% -H #?34%BLOB%  -H #p%keyindex% -H #?02  -h %IP% -p %PORT%  -S %SEN% -H identity%ID%
REM
PAUSE

