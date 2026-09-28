@echo off
REM
set IP=192.168.1.32
set PORT=8888
set SEN=key7.com
set ID=Client_identity
set PSK=0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20
REM
echo openssl: generate fake certificate
openssl  x509 -days 3000 -req -in clientreq.pem -sha256 -extfile config_client.cnf -extensions certificate_extensions -CA ca2cert.pem -CAkey ca2key.pem -CAcreateserial -out clientcert2.pem
echo extract: compute certificate hash
extract clientcert2.pem 1>sha256.txt
set /p hash=<sha256.txt
echo SHA256=%hash%
echo sign hash with pNHSM
echo .s01%hash%|openssl s_client -quiet -tls1_3 -connect %IP%:%PORT% -servername %SEN% -psk %PSK% -psk_identity %ID% -groups P-256 -cipher DHE -ciphersuites TLS_AES_128_CCM_SHA256 -no_ticket 2>nul 1>nsig.txt 
set /p der=<nsig.txt
echo signature DER= %der%
echo sig: make new certificate
sig clientcert2.pem nsig.txt ncert2.pem
echo openssl: verify new certficate
openssl verify -CAfile ca2cert.pem  ncert2.pem
REM
PAUSE




