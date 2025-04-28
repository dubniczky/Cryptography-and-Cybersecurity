## Task 1

Complete the following FFDH key exchange: $g = 5$, $p=1495668529$, and the bit size is $32$. Alice's public key is $979656199$, and we know that Bob's private key is $1395051759$. What will be the shared key expressed as an integer?

Test

```python
assert hashlib.sha256(shared_key.to_bytes(bits // 8, 'big')).hexdigest() == 'ab2305fe70ed8c477f1902c5e77df59e2dcbd6b7182901985c6940aef2021c68'
```

## Task 2

Calculate the RSA private key using the following information:

- $e=65537$
- $n=8712603187021717523939354010916076756411319810593558000164001217686772544393$
- $\phi(n)=8712603187021717523939354010916076756210540921134960997679155350453239535380$
- $d=?$

Test

```python
assert d == 4122922358959130347283689914712914665614195120117773859362247965021382085093
```

# Task 3

Using the public key from the last task, write a function that encrypts a message with RSA, and another one that decrypts with RSA.

```python
def rsa_enc(message: bytes, e: int, n: int) -> int:
    pass

def rsa_dec(cipher: int, d: int, n: int) -> bytes:
    pass
```

Test

```python
e = 65537
n = 8712603187021717523939354010916076756411319810593558000164001217686772544393
assert rsa_enc(b'hithere', e, n) == 1790697970084155358625821900374959795377491179827099667551235727235878399706
assert rsa_dec(rsa_enc(b'hithere', e, n), d, n) == b'hithere'
```