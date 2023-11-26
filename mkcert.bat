@echo off
set /p var=Type name for domain :  
openssl genrsa -out %var%.key 2048
type %var%.key
openssl rsa -text -in %var%.key –noout
openssl rsa -in %var%.key -pubout -out %var%_public.key
type %var%_public.key
openssl req -new -key %var%.key -out %var%.csr
openssl req -text -in %var%.csr -noout
openssl x509 -req -days 365 -in %var%.csr -signkey %var%.key -out %var%.crt
openssl x509 -text -in %var%.crt -noout
openssl pkcs12 -export -name "My Certificate" -out %var%.p12 -inkey %var%.key -in %var%.crt
