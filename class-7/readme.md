# Class 7

## Task 1

Implement a Vignere cipher, that uses the key in reverse to encrypt. If the key contains any letters missing from the alphabet, return an error. If the key or the alphabet are less than 3 characters also return an error. In case of an error, return None. If a character in the text is not in the alphabet, then return it unencrypted.

```python
def revigenere_encrypt(alphabet: str, text: str, key: str) -> str | None:
def revigenere_decrypt(alphabet: str, ciphertext: str, key: str) -> str | None:
```

Tests:

```python
import string
assert revigenere_encrypt(string.ascii_letters, 'HELLO', 'KEY') == 'FivJs'
assert revigenere_encrypt(string.ascii_letters, 'secretmessage', 'A') == None
assert revigenere_encrypt(string.ascii_letters, 'secret!message!', 'A!') == None
assert revigenere_encrypt('12', 'A', '11111') == None
assert revigenere_encrypt(string.ascii_letters, 'secretmessage', 'AAA') == revigenere_encrypt(string.ascii_letters, 'secretmessage', 'AAAAAA')
assert revigenere_encrypt(string.ascii_letters, 'secretmessage', 'ABA') == revigenere_encrypt(string.ascii_letters, 'secretmessage', 'ABAABA')
assert revigenere_encrypt(string.ascii_lowercase, 'super secret', 'mykey').count(' ') == 1
assert revigenere_decrypt(string.ascii_letters, revigenere_encrypt(string.ascii_letters, 'super secret', 'bestkey'), 'bestkey') == 'super secret'
assert revigenere_decrypt(string.ascii_letters + ' ', revigenere_encrypt(string.ascii_letters + ' ', 'short key also works', 'key'), 'key') == 'short key also works'
```



## Task 2

I generated a random string with the following code

```python
import random

def gen_randomstr(a: int, b: int) -> str:
    random.seed(b)
    s = ''
    for _ in range(a):
        s += chr(ord('a') + random.randint(0, 25))
    return s

gen_randomstr(?, ?)
```

What two parameters did I use, if the result was: `wkwusizbyqsz`.


## Task 3

I used the following function to generate a ciphertext:

```python
import string
revigenere_encrypt(string.ascii_lowercase, 'super secret message', gen_randomstr(?, ?))
```

The ciphertext is the following: `vsawu hzudrw xwvxpbw`. What is the key that was used used to encrypt the text? The length of the key was between 6 and 12 characters, and the length of the seed is not higher than 100,000. The carcking took less than 10 seconds on my computer.

```python
import string
key = '?'
assert revigenere_encrypt(string.ascii_lowercase, 'super secret message', key) == 'vsawu hzudrw xwvxpbw'
```


# Task 4

Think of a way to speed up Task 3. How would you do it if the key length is between 100 and 500 and the message is 1,400,000 characters long, and we use the standard vignere cipher instead of the reverse? You get +1 points on the exam if you show me good solution by next class!