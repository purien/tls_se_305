@echo off
set IP=192.168.1.32 
set PORT=8888
set SEN=key7.com
set ID=Client_identity
REM
set PIN=0000
set AID=010203040500
REM
set privk=0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF
REM set pubk=04D8CD12EA5C67F2F8A00C1124893EDCFA6754C4D6CEDE6BE13BDF2295C810A97FA5A89D2D2A360C0CA9A4D6C7C9ED4B28D3E199D6627F2E696D689C310A5B0F48
REM
tlsse -c  -H im    -H  aid%AID%  -H pin%PIN%  -H  #C01 -H #G01 -H #?02  -h %IP% -p %PORT%  -S %SEN% -H identity%ID%
tlsse -c -H quiet -H im  -H  aid%AID%  -H pin%PIN%  -H  #.p01  -h %IP% -p %PORT%  -S %SEN% -H identity%ID% 1>ca2pub.txt
set /p pubk=<ca2pub.txt
echo CAPub= %pubk%
makek %privk% %pubk% ca2key.pem
openssl req -config openssl.cnf -x509   -new -sha256 -nodes -key ca2key.pem -days 3650 -outform PEM -out ca2cert.pem
openssl x509 -pubkey -noout -in ca2cert.pem  > ca2pubkey.pem
PAUSE

