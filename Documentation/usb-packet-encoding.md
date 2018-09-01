# Packet Formats

## USB Packet

**size: 64 Bytes**  
```
<CMD:8><LEN:1+7><DATA:N><CRC:16>
```

Max packet size over USB is 64 bytes. Overhead is 4 bytes (CMD, LEN, CRC).
Max data size is 60 bytes;

- Length byte uses lower 7 bits for length, and upper bit is for multi-packet support. 
- Length count is number of data bytes, plus 2 for CRC.
- CRC is calculated across the CMD, LEN, and DATA section.

### Multi-packet support

For messages longer than 60 unpacked bytes, data can be split between an unlimited number of packets. 
The high bit of the LEN packet indicates that a message is incomplete and additional packets will be received.

**Example**  
packet 1:
```
<CMD><LEN><DATA>                  <CRC>
0x30 0xFE 0x55 0x55 0x55 ... 0x55 0xXX 0xXX
```
packet 2:
```
<CMD><LEN><DATA>                  <CRC>
0x30 0x3E 0x55 0x55 0x55 ... 0x55 0xXX 0xXX
```


---
## Control Packet

After 1 or more USB packets have been verified and recombined, they are presented to the applicaton logic as a single Control Packet.

```
<CMD:8><LEN:16><DATA:N>
```

A Control Packet has the command byte, a 16-bit length, and 1 or more data bytes.