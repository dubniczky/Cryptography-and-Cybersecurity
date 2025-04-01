# Class 4

## Tasks

### Task 1

I used the SHA-256 feistel encrpytion I showcased on class to encrypt a message. This is the hexadecimal output: `34cdbe8fd0643c0323066b4f21b6c07ef65e88a4c7e78d1d07737b352352b5a9` I used 32 rounds to encrypt, and I used a 4-byte-long integer converted to bytes as the key. I know that the original message contains the following 9 bytes somewhere in it: `XXXXXXXXX`! Decrypt the entire message!

### Task 2

I used standard DES encryption with ECB mode to encrypt a message.

- The first 5 bytes of the key are zeros.
- I used PKCS7 padding.
- The message is a longer standard english text.

This is the ciphertext in hexadecimal form:

```
2389a74e47f83172dd2e284b4e4882614900fc2b274d3c7aaa1797f32d7731e86e5b0fdfa68c50b60a62de982900fedeb7102fe582f8c004846efd9e18286ddf65170140968ed4c70b0515b4e65e12f04dee2c904c65093a4314d5b890e4b2f5041c559cb1c65d18c7f7064ff4b0c019c8f21e122994139534becd287713615fecca145312b3b9bf
```