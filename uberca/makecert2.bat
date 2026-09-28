@echo off
REM
set IP=192.168.1.32 
set PORT=8888
set SEN=key7.com
set ID=Client_identity
REM
set PIN=0000
set AID=010203040500
REM
openssl  x509 -days 3000 -req -in clientreq.pem -sha256 -extfile config_client.cnf -extensions certificate_extensions -CA ca2cert.pem -CAkey ca2key.pem -CAcreateserial -out clientcert2.pem
extract clientcert2.pem 1>sha256.txt
set /p hash=<sha256.txt
echo SHA256=%hash%
tlsse -c  -H quiet -H im  -H  aid%AID%  -H pin%PIN%  -H  #.s01%hash%  -h %IP% -p %PORT%  -S %SEN% -H identity%ID% 1>nsig.txt
set /p der=<nsig.txt
echo DER=%der%
sig clientcert2.pem nsig.txt ncert2.pem
openssl verify -CAfile ca2cert.pem  ncert2.pem
copy ncert2.pem ncert2.crt
REM
PAUSE




