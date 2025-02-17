# Practice tasks for Class 2

## Task 1

Create an alternate version of the Caesar cipher called `rolling_caesar`. The difference from the normal Caesar is that each subsequent character is incremented by one higher value that the intial key. So if the key is `25`, then the first character is rotated by `25` characters, the second by `26`, third by `1`, and so on... The alphabet should be all lowercase ASCII characters for these tests, but it should work with any alphabet to complete later tasks.

Create the following functions:

```python
def rolling_caesar_encrypt(alphabet: str, key: int, message: str) -> str:
def rolling_caesar_decrypt(alphabet: str, key: int, ciphertext: str) -> str:
```

Tests:

```python
assert rolling_caesar_encrypt(string.ascii_lowercase, 1, "abc") == "bdf"
assert rolling_caesar_encrypt(string.ascii_lowercase, 1, "xyz") == "yac"
assert rolling_caesar_decrypt(string.ascii_lowercase, 3, rolling_caesar_encrypt(string.ascii_lowercase, 3, "hello world")) == "hello world"
assert rolling_caesar_decrypt(string.ascii_lowercase, 18, rolling_caesar_encrypt(string.ascii_lowercase, 18, "hello world")) == "hello world"
```

> Paste these tests into an cell in your ipynb file and run them after creating the cipher. If all of them pass the program is likely to be correct.

## Task 2

I generated the following ciphertext with rolling caesar encryption: `tjrjok gr gwq bnlv izg gjstwxx`. What was the original message and the key?

## Task 3

I generated another message that resulted in this ciphertext: `6!Rf1$-*!80l.FQ(jLl=}\(GlV@VZRzOq-kG`. The alphabet I used is a bit more complicated:

```
yFz'bD?IYBu$/Rn]27p4NHq.LJo}1Gtf!U0*)`Q>x+#%5<(vwrSV@i^{g-9~8\W=[m jlAs&PhCOkcZ_XT,6:Me";E3Kda|
```

One hint I can give you though, is that the first word is: `this`.

> Hint: be careful with the special characters when pasting text into a python string.

## Task 4

Create a cipher that we name `mirror_cipher`. The idea is that for each character you generate a key randomly, and write two characters, both equal distance from the character in your message.

Let's say your alphabet is: `abcdefghijklmnopqrstuvwxyz`

This means that for example if you randomize the key: `2` and the character is `e`, then you will write two characters, both equal distance from e: `cg`. This means that the keys are embedded into the ciphertext itself. As an other example, if your key is `4`, and the character is `c`, your ciphertext will be: `yg`. Make sure you never use 0 as the key!

Also write the decryption version of this cipher.

```python
def mirror_encrypt(alphabet: str, message: str) -> str:
def mirror_decrypt(alphabet: str, ciphertext: str) -> str:
```

## Task 5

I encrypted a string with the mirror cipher: `wegqemrndf rtaicytnnx vf ayykrtrtsiyosq rvmq uiiuye`. Decrypt it!
