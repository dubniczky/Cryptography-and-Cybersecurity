# Class 9

## Tasks

### Task 0

Encrypt the following message (with ASCII encoding) using AES ECB encyption and PKCS7 padding. The key was encoded into a hex string.

Message: `we will rock you!` (ascii)
Key: `31323334353637383930313233343536` (hex)

Tests

```python
assert ciphertext == b'\xc0\x0bcc\x85\xe9\xd1\x12\x17\x1b@\x1dl\x165p\xde\xba\xdcN\xcc\xae\x16U\x92j\xe4=\xe4\xc9\x17\xe0'
```

### Task 1

Find which AES-128 mode of operation was used to encrypt the plaintext. You don't need to find the key, just observe the ciphertexts. The options are: ECB, CBC, CTR. The IV for CBC was generated randomly. The ciphertexts are shown as hex strings.

|Cipher|Data|
|--|--|
|Plaintext|`hellohellohello!hellohellohello!`|
|?|`a359179a9cc0dd5b3f7c1deb637f55836010861d972c0618f6ced452ac4ec6baf81b8996947f5cff8b35525a413c8fcb`|
|?|`e839a867fb04e3df571cf2b87430588be839a867fb04e3df571cf2b87430588b`|
|?|`b782b607cb6996c852e92fc1fb4ef22db8cc9f5a93572e455289767621ed5749`|

### Task 2

I encrypted the same data twice with the same key with either CBC or ECB. Which one was it if I got these ciphers:

Cipher 1: `5e11398c3607cbb61563426798c2aa9029238370137791f338bb36376d07d87c5c22b09743caa14384b0c11f42fc8ad09d9e30db0403bbcb16ba8efe7175cfb707c67f2a4b28626d71dd7d84e5e3535f` (hex)
Cipher2: `c15c0d2ac3f417f9ef9bdcdab153c46ccc093f70ab15c004bb9c39c45e705d5332bf3acb54662c183093a2bc4e5cf6c56a3ec84caf8d9765c9cba8845e97180e32d535a693d6a6efefcc6a55ef81c5f5` (hex)

### Task 3

Recover the original message that was encrypted using AES in CBC mode. I do not remember if I used AES-128 or AES-256 though.

Key: `eaaff985724355286b8176e6b4b4b35ca3051e4c8c6186c3e3619ab7dc3850b2` (hex)
Initialization Vector: `29c793116cc51ab2337240ae6dccd861` (hex)
Cipher: `07a0bf2dfc426dee1933d85066f3991078c31229c10b1b85db8f8e317a4c78a9` (hex)

Tests

```python
message = '?'
assert message.startswith(b'the most')
```

### Task 4 

Implement message encryption and MAC generation using the Glaois Counter Mode. It should take the key and the message as arguments. Make sure buth the 16 and 32 byte keys are accepted and any length of message can be used. The result should be a tuple with the nonce, the MAC and the ciphertext appended in this order.

```python
def aes_gcm_encrypt(key: bytes, message: bytes) -> bytes
```

Now implement the decryption algorithm for your function. If the MAC is invalid, then return None instead of the invalid bytes.

```python
def aes_gcm_decrypt(key: bytes, ciphertext: bytes) -> bytes | None
```

Tests

```python
key = get_random_bytes(32)
message = b'1299 661'
assert aes_gcm_decrypt(key, aes_gcm_encrypt(key, message)) == message
assert aes_gcm_decrypt(key, aes_gcm_encrypt(key, message) + b'\x12') == None
```

### Task 5

We intercepted two messages that were encrypted using AES in CTR mode. The target might be using the CTR mode incorrectly. We also know the plaintext of the first that was sent to log into the website: `{"username":"admin", "password":"admin1234"}`. We tested and since then, they modified the username and the password, likely in the second message. Can you decrypt the message and get the new username and password?

First message: `d863d9f029fe502ee781e303d36e4114331093470f720aefd215cb107f69d94b37eab41e58d1e4abe9698a35`
Second message: `d863d9f029fe502ee781e303d34e6134133093470f720aefd215cb107f69d94b37c7bf3f7dd099a8e86e8a35`

Test:

```python
import hashlib
assert hashlib.sha256(m2).hexdigest() == '42c6e1d9c3c2b7c8c1dc27ff444ccf4b43d05302b5c754c68d4fb556f0eaf9e7'
```

> FYI: It's not worth trying to brute force the hash in the test, it will take too long.