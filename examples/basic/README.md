# Basic Example

What it shows: the snapshot you take before you start guessing, and the three
commands that follow from what it says.

## Run

No cluster needed to see the shape of it:

```sh
docker run --rm --net=host fabiocicerchia/mtr-toolbox:0.1.0 \
  -c 'netreport github.com'
```

```text
===== LINKS =====
lo               UNKNOWN        <LOOPBACK,UP,LOWER_UP>
eth0             UP             <BROADCAST,MULTICAST,UP,LOWER_UP>

===== ADDRS =====
lo               UNKNOWN        127.0.0.1/8 ::1/128
eth0             UP             10.42.0.17/24

===== ROUTES =====
default via 10.42.0.1 dev eth0
10.42.0.0/24 dev eth0 scope link src 10.42.0.17

===== DNS =====
nameserver 10.43.0.10
search default.svc.cluster.local svc.cluster.local cluster.local

===== RESOLVE github.com =====
140.82.121.4

===== PING github.com =====
3 packets transmitted, 3 received, 0% packet loss

===== PATH github.com =====
  1. 10.42.0.1        0.0%  0.4ms
  2. ???             100.0%
  3. 140.82.121.4     0.0%  22.1ms
```

Save it before you touch anything:

```sh
docker run --rm --net=host fabiocicerchia/mtr-toolbox:0.1.0 \
  -c 'netreport api.example.com' | tee incident-1234.txt
```

## In a pod, which is where it is actually useful

```sh
kubectl debug -it my-pod --image=fabiocicerchia/mtr-toolbox:0.1.0 \
  --target=app --profile=netadmin -- netreport api.example.com
```

Run from inside the pod, `DNS` shows the *cluster* resolver and search domains
— which is how you find out that the name resolves fine from your laptop and
not from where it matters.

## Reading it

**`RESOLVE` empty, everything else fine.** DNS, not the network. Compare the
pod's resolver against a public one:

```sh
dig api.example.com ; dig @1.1.1.1 api.example.com
```

**`PING` loses packets at a fixed hop in `PATH`.** Real loss on the path.
Confirm it is not just ICMP deprioritised at that hop by testing the port
itself:

```sh
tcptraceroute api.example.com 443
```

**`PATH` clean but the app still fails.** It is not routing. Check whether the
port answers and whether anything arrives:

```sh
nc -vz api.example.com 443
tcpdump -ni any -c 50 'port 443 and host api.example.com'
```

Note the `???` hop with 100% loss in the sample above: that is a router
declining to answer ICMP, not a broken hop. Loss that starts at a hop and
continues through the last one is real; loss confined to a middle hop is not.
