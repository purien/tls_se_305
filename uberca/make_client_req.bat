REM @echo off
REM openssl ecparam -name prime256v1 -genkey -noout -out prime256v1-key.pem -param_enc explicit
REM
openssl  ecparam -genkey -name prime256v1 -out clientkey.pem
openssl  req -new -key clientkey.pem -passin pass:pascal -sha256  -out clientreq.pem -config config_client.cnf -reqexts req_extensions
pause

