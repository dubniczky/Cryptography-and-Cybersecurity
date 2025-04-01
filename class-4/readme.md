# Class 4

## Tasks

### 1. Random Padding

Create a padding algorithm called `random_pad`. It takes a message and a block size and fills the remaining space with random bytes. If no padding is necessary to achieve the block size, then you don't add any more data.

```python
def random_pad(data: bytes, block_size: int) -> bytes
```

Tests

```python
assert len(random_pad(b'', 8)) == 8
assert len(random_pad(b'1', 8)) == 8
assert len(random_pad(b'11111111', 8)) == 8
assert len(random_pad(b'111111111', 8)) == 16
```

### 2. Counter Padding

Create a padding algorithm called `counter_pad` and `counter_unpad`. It takes a message and a block size and fills the remaining space by counting from zero to the number of bytes added by the padding. For example: `0x0505` padded to 8 bytes is `0x0505000102`.

```python
def counter_pad(data: bytes, block_size: int) -> bytes:
def counter_unpad(data: bytes, block_size: int) -> bytes:
```

Tests

```python
import secrets
assert counter_pad(b'aabb', 8) == (b'aabb\x00\x01\x02\x03')
assert counter_pad(b'aabb', 4) == (b'aabb\x00\x01\x02\x03')
assert len(counter_pad(b'aabbccdd', 8)) == 16
assert counter_pad(b'', 8) == (b'\x00\x01\x02\x03\x04\x05\x06\x07')
assert counter_unpad(counter_pad(b'aabb', 8), 8) == b'aabb'
assert all([ len(counter_unpad(counter_pad(secrets.token_bytes(i), 8), 8)) == i for i in range(100) ])
```

### 3. PKCS7 Padding

Implement the PKCS#7 Padding scheme. (https://en.wikipedia.org/wiki/Padding_(cryptography)#PKCS%235_and_PKCS%237).

```python
def pad(data: bytes, block_size: int) -> bytes:
def unpad(data: bytes, block_size: int) -> bytes:
```

Tests

```python
assert pad(b'hello', 8) == b'hello\x03\x03\x03'
assert pad(b'welcome stranger', 8) == b'welcome stranger\x08\x08\x08\x08\x08\x08\x08\x08'
assert pad(b'welcome stranger!', 8) == b'welcome stranger!\x07\x07\x07\x07\x07\x07\x07'
assert pad(b'', 4) == b'\x04\x04\x04\x04'
assert unpad(b'\x02\x02\x02\x02') == b'\x02\x02'
assert unpad(pad(b'hello', 8)) == b'hello'
assert unpad(pad(b'this is a long message, taking up multiple blocks', 4)) == b'this is a long message, taking up multiple blocks'
```


### 4. MD5 mining

Create a mining algorithm that finds an md5 hash that starts with the specified number of a given byte. For example the MD5 hash digest of `b'\xaf'` is: `b'\x00\xd9q.\xc5\xebp\x80zs\xb8\xd2\xd6\xea\xd9\r'` and it starts starts with one zero byte. The function should return the message and the hash in a tuple. (_For context: on my M4 MacBook Pro the search finishes in less than 5 seconds._)

```python
def find_md5_by_prefix(prefix: bytes, count: int) -> tuple[bytes, bytes]:
```

```python
assert find_md5_by_prefix(b'\x00', 1)[1].startswith(b'\x00')
assert find_md5_by_prefix(b'\x00', 2)[1].startswith(b'\x00\x00')
assert find_md5_by_prefix(b'\xff', 2)[1].startswith(b'\xff\xff')
assert find_md5_by_prefix(b'\x00', 3)[1].startswith(b'\x00\x00\x00')
```