# Class 3

## Tasks

### Task 1

Create a function called `random_string`, that gets an alphabet and a count `n` as parameters, and returns a string of random characters of `n` lengh from the alphabet.

```python
def random_string(alphabet: str, n: int) -> str
```

Tests:

```python
assert len(random_string(string.ascii_letters, 5)) == 5
assert len(random_string(string.ascii_letters, 10)) == 10
assert random_string(string.ascii_letters, 0) == ''
assert random_string('a', 5) == 'aaaaa'
assert all([ i in string.ascii_letters for i in random_string(string.ascii_letters, 1000) ])
```

## Task 2

Create a function called `random_password`, that generates a random password with the following parameters:
- between 8 and 12 characters long
- contains both lowercase and uppercase letters
- contains two digits in random places
- contains at least one special character in a random place

```python
def random_password() -> str
```

```python
assert all([ 8 <= len(random_password()) <= 12 for _ in range(100) ]), 'Password length must be between 8 and 12 characters'
assert all([ any([ i in string.ascii_lowercase for i in random_password() ]) for _ in range(100) ]), 'At least one lowercase letter must be in the password'
assert all([ any([ i in string.ascii_uppercase for i in random_password() ]) for _ in range(100) ]), 'At least one uppercase letter must be in the password'
assert all([ sum([ (1 if c in string.digits else 0) for c in random_password() ]) == 2 for _ in range(100) ]), 'Exactly two digits must be in the password'
assert all([ sum([ (1 if c in string.punctuation else 0) for c in random_password() ]) > 0 for _ in range(100) ]), 'At least one punctuation character must be in the password'
assert all( [ (any([ random_password()[i] not in string.digits for _ in range(100) ])) for i in range(8) ] ), 'Digits must be randomly distributed in the password'
```

## Task 3

I generated a list of random numbers at 2025.02.24 22:00:01. I can tell you that the first 4 numbers are: 3746, 8581, 8835, 9312. What are the 5th, 6th, 7th and 8th numbers?

This is the program I used:

```python
random.seed(int(time.time() * 1000))
numbers = [ random.randint(0, 8000-1) +2000 for _ in range(5500) ]
```

```python
import hashlib
assert numbers[0] == 3746 and numbers[1] == 8581 and numbers[2] == 8835 and numbers[3] == 9312
assert hashlib.sha256(''.join([ str(n) for n in numbers[4:8] ]).encode()).hexdigest() == 'aea75378bfd9e13042aec1f521ca5b0f8752eef57a729a54074bf1b52de4dd30'
```
