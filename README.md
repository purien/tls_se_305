TLS-SE version 3.0.5 (TLS for Secure Element) is a Java Card 3.0.5 application designed for personal Network HSM (pNHSM) servers.
TLS-SE is a hardware security module accessed through shell commands over a protected TLS 1.3 connection.

![alt text](https://github.com/purien/tls_se_305/blob/main/tlsse_stack_s.jpg)

Two accounts are available: root and guest. They use different PSK identities and pre-shared keys. The root account can enable or disable cryptographic features.

The embedded TLS 1.3 server uses pre-shared key (PSK) authentication, a mode resistant to quantum attacks, with an Elliptic Curve Diffie-Hellman Ephemeral (ECDHE) key exchange over the SECP256 prime curve.

A TLS-SE app is associated with a server name stored in the ATR (Answer to Reset) historical bytes (up to 15 bytes).

A TLS-SE app has a public/private key pair (on the SECP256k1 curve) and a certificate.
The Application Certification Procedure (ACP) verifies that the application is genuine.

TLS-SE provides two kinds of cryptographic services: KEYS associated with persistent cryptographic objects and SECRETS associated with on-demand cryptographic objects.

TLS-SE supports the following cryptographic procedures:
<br/>RSA-2048 with PKCS #1 v1.5 signature.
<br/>RSA-2048 encryption (in raw mode) and decryption.
<br/>EC-256 (SECP256r1 and SECP256k1) with ECDSA signatures.
<br/>AES-128 encryption and decryption.
<br/>HMAC-SHA-256.
<br/>HMAC-SHA-512.
<br/>BIP32 with hardened keys.
<br/>TLS 1.3 PSK binder and key derivation procedures.

Two wrap secrets are available, used to compute AES128 keys. Key blobs are built using AES-CCM authenticated encryption with associated data (AEAD) and a 16-byte tag.

TLS-SE provides four large files (up to 1,280 bytes) that can be used to store certificates and four small files (up to 64 bytes) that can be used to store messages.
