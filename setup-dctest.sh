#!/bin/sh

# Create NAT rules
iptables -N PLACEMAT -t filter
iptables -N PLACEMAT -t nat
iptables -t nat -A POSTROUTING -j PLACEMAT
iptables -t filter -A FORWARD -j PLACEMAT

# Configure Bridge Network
# internet
ip link add internet type bridge
ip link set internet up
ip addr add 10.0.0.1/24 dev internet
iptables -t filter -A PLACEMAT -i internet -j ACCEPT
iptables -t filter -A PLACEMAT -o internet -j ACCEPT
iptables -t nat -A PLACEMAT -j MASQUERADE --source 10.0.0.0/24 ! --destination 10.0.0.0/24
# core-to-s1
ip link add core-to-s1 type bridge
ip link set core-to-s1 up
iptables -t filter -A PLACEMAT -i core-to-s1 -j ACCEPT
iptables -t filter -A PLACEMAT -o core-to-s1 -j ACCEPT
# core-to-s2
ip link add core-to-s2 type bridge
ip link set core-to-s2 up
iptables -t filter -A PLACEMAT -i core-to-s2 -j ACCEPT
iptables -t filter -A PLACEMAT -o core-to-s2 -j ACCEPT
# core-to-ext
ip link add core-to-ext type bridge
ip link set core-to-ext up
iptables -t filter -A PLACEMAT -i core-to-ext -j ACCEPT
iptables -t filter -A PLACEMAT -o core-to-ext -j ACCEPT
# core-to-op
ip link add core-to-op type bridge
ip link set core-to-op up
iptables -t filter -A PLACEMAT -i core-to-op -j ACCEPT
iptables -t filter -A PLACEMAT -o core-to-op -j ACCEPT
# core-node0
ip link add core-node0 type bridge
ip link set core-node0 up
iptables -t filter -A PLACEMAT -i core-node0 -j ACCEPT
iptables -t filter -A PLACEMAT -o core-node0 -j ACCEPT
# core-ntp0
ip link add core-ntp0 type bridge
ip link set core-ntp0 up
iptables -t filter -A PLACEMAT -i core-ntp0 -j ACCEPT
iptables -t filter -A PLACEMAT -o core-ntp0 -j ACCEPT
# core-ntp1
ip link add core-ntp1 type bridge
ip link set core-ntp1 up
iptables -t filter -A PLACEMAT -i core-ntp1 -j ACCEPT
iptables -t filter -A PLACEMAT -o core-ntp1 -j ACCEPT
# bmc
ip link add bmc type bridge
ip link set bmc up
ip addr add 10.72.16.1/20 dev bmc
# s1-to-r0-1
ip link add s1-to-r0-1 type bridge
ip link set s1-to-r0-1 up
iptables -t filter -A PLACEMAT -i s1-to-r0-1 -j ACCEPT
iptables -t filter -A PLACEMAT -o s1-to-r0-1 -j ACCEPT
# s1-to-r0-2
ip link add s1-to-r0-2 type bridge
ip link set s1-to-r0-2 up
iptables -t filter -A PLACEMAT -i s1-to-r0-2 -j ACCEPT
iptables -t filter -A PLACEMAT -o s1-to-r0-2 -j ACCEPT
# s1-to-r1-1
ip link add s1-to-r1-1 type bridge
ip link set s1-to-r1-1 up
iptables -t filter -A PLACEMAT -i s1-to-r1-1 -j ACCEPT
iptables -t filter -A PLACEMAT -o s1-to-r1-1 -j ACCEPT
# s1-to-r1-2
ip link add s1-to-r1-2 type bridge
ip link set s1-to-r1-2 up
iptables -t filter -A PLACEMAT -i s1-to-r1-2 -j ACCEPT
iptables -t filter -A PLACEMAT -o s1-to-r1-2 -j ACCEPT
# s1-to-r2-1
ip link add s1-to-r2-1 type bridge
ip link set s1-to-r2-1 up
iptables -t filter -A PLACEMAT -i s1-to-r2-1 -j ACCEPT
iptables -t filter -A PLACEMAT -o s1-to-r2-1 -j ACCEPT
# s1-to-r2-2
ip link add s1-to-r2-2 type bridge
ip link set s1-to-r2-2 up
iptables -t filter -A PLACEMAT -i s1-to-r2-2 -j ACCEPT
iptables -t filter -A PLACEMAT -o s1-to-r2-2 -j ACCEPT
# s2-to-r0-1
ip link add s2-to-r0-1 type bridge
ip link set s2-to-r0-1 up
iptables -t filter -A PLACEMAT -i s2-to-r0-1 -j ACCEPT
iptables -t filter -A PLACEMAT -o s2-to-r0-1 -j ACCEPT
# s2-to-r0-2
ip link add s2-to-r0-2 type bridge
ip link set s2-to-r0-2 up
iptables -t filter -A PLACEMAT -i s2-to-r0-2 -j ACCEPT
iptables -t filter -A PLACEMAT -o s2-to-r0-2 -j ACCEPT
# s2-to-r1-1
ip link add s2-to-r1-1 type bridge
ip link set s2-to-r1-1 up
iptables -t filter -A PLACEMAT -i s2-to-r1-1 -j ACCEPT
iptables -t filter -A PLACEMAT -o s2-to-r1-1 -j ACCEPT
# s2-to-r1-2
ip link add s2-to-r1-2 type bridge
ip link set s2-to-r1-2 up
iptables -t filter -A PLACEMAT -i s2-to-r1-2 -j ACCEPT
iptables -t filter -A PLACEMAT -o s2-to-r1-2 -j ACCEPT
# s2-to-r2-1
ip link add s2-to-r2-1 type bridge
ip link set s2-to-r2-1 up
iptables -t filter -A PLACEMAT -i s2-to-r2-1 -j ACCEPT
iptables -t filter -A PLACEMAT -o s2-to-r2-1 -j ACCEPT
# s2-to-r2-2
ip link add s2-to-r2-2 type bridge
ip link set s2-to-r2-2 up
iptables -t filter -A PLACEMAT -i s2-to-r2-2 -j ACCEPT
iptables -t filter -A PLACEMAT -o s2-to-r2-2 -j ACCEPT
# r0-node1
ip link add r0-node1 type bridge
ip link set r0-node1 up
iptables -t filter -A PLACEMAT -i r0-node1 -j ACCEPT
iptables -t filter -A PLACEMAT -o r0-node1 -j ACCEPT
# r0-node2
ip link add r0-node2 type bridge
ip link set r0-node2 up
iptables -t filter -A PLACEMAT -i r0-node2 -j ACCEPT
iptables -t filter -A PLACEMAT -o r0-node2 -j ACCEPT
# r1-node1
ip link add r1-node1 type bridge
ip link set r1-node1 up
iptables -t filter -A PLACEMAT -i r1-node1 -j ACCEPT
iptables -t filter -A PLACEMAT -o r1-node1 -j ACCEPT
# r1-node2
ip link add r1-node2 type bridge
ip link set r1-node2 up
iptables -t filter -A PLACEMAT -i r1-node2 -j ACCEPT
iptables -t filter -A PLACEMAT -o r1-node2 -j ACCEPT
# r2-node1
ip link add r2-node1 type bridge
ip link set r2-node1 up
iptables -t filter -A PLACEMAT -i r2-node1 -j ACCEPT
iptables -t filter -A PLACEMAT -o r2-node1 -j ACCEPT
# r2-node2
ip link add r2-node2 type bridge
ip link set r2-node2 up
iptables -t filter -A PLACEMAT -i r2-node2 -j ACCEPT
iptables -t filter -A PLACEMAT -o r2-node2 -j ACCEPT

# Configure Node
# Create volume node=boot-0 volume=root
qemu-img create -f qcow2 -o backing_file=${NECO_DIR}/dctest/output/cybozu-ubuntu-18.04-server-cloudimg-amd64.img /var/scratch/placemat/volumes/boot-0/root.img
# Create volume node=boot-0 volume=seed
cloud-localds /var/scratch/placemat/volumes/boot-0/seed.img ${NECO_DIR}/dctest/output/seed_boot-0.yml --network-config ${NECO_DIR}/dctest/output/network.yml
# Create tap
ip tuntap add pm0 mode tap
ip link set pm0 master r0-node1
ip link set pm0 up
ip tuntap add pm1 mode tap
ip link set pm1 master r0-node2
ip link set pm1 up
# Start VM
qemu-system-x86_64 \
 -enable-kvm \
 -smp 8 \
 -m 2G \
 -nographic \
 -serial unix:/tmp/boot-0.socket,server,nowait \
 -smbios type=1,serial=fb8f2417d0b4db30050719c31ce02a2e8141bbd8 \
 -drive if=virtio,cache=writeback,aio=threads,file=/var/scratch/placemat/volumes/boot-0/root.img \
 -drive if=virtio,cache=none,aio=native,file=/var/scratch/placemat/volumes/boot-0/seed.img \
 -drive file=fat:16:${NECO_DIR}/dctest/output/sabakan,format=raw,if=virtio,read-only=on \
 -netdev tap,id=r0-node1,ifname=pm0,script=no,downscript=no,vhost=on -device virtio-net-pci,netdev=r0-node1,mac=52:54:00:19:90:f1 \
 -netdev tap,id=r0-node2,ifname=pm1,script=no,downscript=no,vhost=on -device virtio-net-pci,netdev=r0-node2,mac=52:54:00:6c:b2:17 \
 -virtfs local,path=/mnt/placemat/boot-0,mount_tag=placemat,security_model=none \
 -boot reboot-timeout=30000 \
 -chardev socket,id=char0,path=/tmp/boot-0.guest,server,nowait \
 -device virtio-serial \
 -device virtserialport,chardev=char0,name=placemat \
 -monitor unix:/tmp/boot-0.monitor,server,nowait \
 -object rng-random,id=rng0,filename=/dev/urandom \
 -device virtio-rng-pci,rng=rng0 \
 -cpu host &
# Create volume node=rack0-cs1
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack0-cs1/data1.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack0-cs1/data2.img 30G
# Create tap
ip tuntap add pm2 mode tap
ip link set pm2 master r0-node1
ip link set pm2 up
ip tuntap add pm3 mode tap
ip link set pm3 master r0-node2
ip link set pm3 up
# Start VM
qemu-system-x86_64 \
 -enable-kvm \
 -smp 8 \
 -m 16G \
 -nographic \
 -serial unix:/tmp/rack0-cs1.socket,server,nowait -smbios type=1,serial=ba49d9a971c5a0344edfda5c8116745ea16fa4dd \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack0-cs1/data1.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack0-cs1/data2.img \
 -netdev tap,id=r0-node1,ifname=pm2,script=no,downscript=no,vhost=on -device virtio-net-pci,netdev=r0-node1,mac=52:54:00:fb:b2:08 \
 -netdev tap,id=r0-node2,ifname=pm3,script=no,downscript=no,vhost=on -device virtio-net-pci,netdev=r0-node2,mac=52:54:00:4c:0f:da \
 -virtfs local,path=/mnt/placemat/rack0-cs1,mount_tag=placemat,security_model=none -boot reboot-timeout=30000 \
 -chardev socket,id=char0,path=/tmp/rack0-cs1.guest,server,nowait -device virtio-serial \
 -device virtserialport,chardev=char0,name=placemat \
 -monitor unix:/tmp/rack0-cs1.monitor,server,nowait \
 -object rng-random,id=rng0,filename=/dev/urandom \
 -device virtio-rng-pci,rng=rng0 \
 -cpu host &
# Create volume node=rack0-ss1
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack0-ss1/data1.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack0-ss1/data2.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack0-ss1/data3.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack0-ss1/data4.img 30G
# Create tap
ip tuntap add pm4 mode tap 
ip link set pm4 master r0-node1
ip link set pm4 up
ip tuntap add pm5 mode tap
ip link set pm5 master r0-node2
ip link set pm5 up
# Start VM
qemu-system-x86_64 \
 -enable-kvm \
 -smp 2 \
 -m 10G \
 -nographic \
 -serial unix:/tmp/rack0-ss1.socket,server,nowait \
 -smbios type=1,serial=ed19caa9ae4759273e785282a74971451a248828 \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack0-ss1/data1.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack0-ss1/data2.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack0-ss1/data3.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack0-ss1/data4.img \
 -netdev tap,id=r0-node1,ifname=pm4,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r0-node1,mac=52:54:00:aa:80:7a \
 -netdev tap,id=r0-node2,ifname=pm5,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r0-node2,mac=52:54:00:d6:eb:b6 \
 -virtfs local,path=/mnt/placemat/rack0-ss1,mount_tag=placemat,security_model=none \
 -boot reboot-timeout=30000 \
 -chardev socket,id=char0,path=/tmp/rack0-ss1.guest,server,nowait \
 -device virtio-serial \
 -device virtserialport,chardev=char0,name=placemat \
 -monitor unix:/tmp/rack0-ss1.monitor,server,nowait \
 -object rng-random,id=rng0,filename=/dev/urandom \
 -device virtio-rng-pci,rng=rng0 \
 -cpu host &
# Create volume boot-1
qemu-img create -f qcow2 -o backing_file=${NECO_DIR}/dctest/output/cybozu-ubuntu-18.04-server-cloudimg-amd64.img /var/scratch/placemat/volumes/boot-1/root.img
cloud-localds /var/scratch/placemat/volumes/boot-1/seed.img ${NECO_DIR}/dctest/output/seed_boot-1.yml --network-config ${NECO_DIR}/dctest/output/network.yml
# Create tap
ip tuntap add pm6 mode tap
ip link set pm6 master r1-node1
ip link set pm6 up
ip tuntap add pm7 mode tap
ip link set pm7 master r1-node2
ip link set pm7 up
# Start
qemu-system-x86_64 \
 -enable-kvm \
 -smp 8 \
 -m 2G \
 -nographic \
 -serial unix:/tmp/boot-1.socket,server,nowait \
 -smbios type=1,serial=fa362303b7af8c4291773ab496aaca16726beaa3 \
 -drive if=virtio,cache=writeback,aio=threads,file=/var/scratch/placemat/volumes/boot-1/root.img \
 -drive if=virtio,cache=none,aio=native,file=/var/scratch/placemat/volumes/boot-1/seed.img \
 -drive file=fat:16:${NECO_DIR}/dctest/output/sabakan,format=raw,if=virtio,read-only=on \
 -netdev tap,id=r1-node1,ifname=pm6,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r1-node1,mac=52:54:00:d2:d8:5d \
 -netdev tap,id=r1-node2,ifname=pm7,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r1-node2,mac=52:54:00:6c:5b:1f -virtfs local,path=/mnt/placemat/boot-1,mount_tag=placemat,security_model=none \
 -boot reboot-timeout=30000 \
 -chardev socket,id=char0,path=/tmp/boot-1.guest,server,nowait \
 -device virtio-serial \
 -device virtserialport,chardev=char0,name=placemat \
 -monitor unix:/tmp/boot-1.monitor,server,nowait \
 -object rng-random,id=rng0,filename=/dev/urandom \
 -device virtio-rng-pci,rng=rng0 \
 -cpu host &
# Create volume rack1-cs1
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack1-cs1/data1.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack1-cs1/data2.img 30G
# Create tap
ip tuntap add pm8 mode tap
ip link set pm8 master r1-node1
ip link set pm8 up
ip tuntap add pm9 mode tap
ip link set pm9 master r1-node2
ip link set pm9 up
# Start VM
qemu-system-x86_64 \
 -enable-kvm \
 -smp 8 \
 -m 16G \
 -nographic \
 -serial unix:/tmp/rack1-cs1.socket,server,nowait \
 -smbios type=1,serial=4ae0771764376e0184274e24e0b18abd8fa5f285 \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack1-cs1/data1.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack1-cs1/data2.img \
 -netdev tap,id=r1-node1,ifname=pm8,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r1-node1,mac=52:54:00:78:cc:2d \
 -netdev tap,id=r1-node2,ifname=pm9,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r1-node2,mac=52:54:00:bd:4c:98 \
 -virtfs local,path=/mnt/placemat/rack1-cs1,mount_tag=placemat,security_model=none \
 -boot reboot-timeout=30000 -chardev socket,id=char0,path=/tmp/rack1-cs1.guest,server,nowait \
 -device virtio-serial \
 -device virtserialport,chardev=char0,name=placemat \
 -monitor unix:/tmp/rack1-cs1.monitor,server,nowait \
 -object rng-random,id=rng0,filename=/dev/urandom \
 -device virtio-rng-pci,rng=rng0 \
 -cpu host &
# Create volume rack1-ss1
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack1-ss1/data1.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack1-ss1/data2.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack1-ss1/data3.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack1-ss1/data4.img 30G
# Create tap
ip tuntap add pm10 mode tap
ip link set pm10 master r1-node1
ip link set pm10 up
ip tuntap add pm11 mode tap
ip link set pm11 master r1-node2
ip link set pm11 up
# Start VM
qemu-system-x86_64 \
 -enable-kvm \
 -smp 2 \
 -m 10G \
 -nographic \
 -serial unix:/tmp/rack1-ss1.socket,server,nowait \
 -smbios type=1,serial=1145129a085ecf521ab524028302a6b4a4e49a00 \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack1-ss1/data1.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack1-ss1/data2.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack1-ss1/data3.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack1-ss1/data4.img \
 -netdev tap,id=r1-node1,ifname=pm10,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r1-node1,mac=52:54:00:37:4f:2a \
 -netdev tap,id=r1-node2,ifname=pm11,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r1-node2,mac=52:54:00:b2:e3:13 \
 -virtfs local,path=/mnt/placemat/rack1-ss1,mount_tag=placemat,security_model=none \
 -boot reboot-timeout=30000 \
 -chardev socket,id=char0,path=/tmp/rack1-ss1.guest,server,nowait \
 -device virtio-serial \
 -device virtserialport,chardev=char0,name=placemat \
 -monitor unix:/tmp/rack1-ss1.monitor,server,nowait \
 -object rng-random,id=rng0,filename=/dev/urandom \
 -device virtio-rng-pci,rng=rng0 \
 -cpu host &
# Create volume boot-2
qemu-img create -f qcow2 -o backing_file=${NECO_DIR}/dctest/output/cybozu-ubuntu-18.04-server-cloudimg-amd64.img /var/scratch/placemat/volumes/boot-2/root.img
cloud-localds /var/scratch/placemat/volumes/boot-2/seed.img ${NECO_DIR}/dctest/output/seed_boot-2.yml --network-config ${NECO_DIR}/dctest/output/network.yml
# Create tap
ip tuntap add pm12 mode tap
ip link set pm12 master r2-node1
ip link set pm12 up
ip tuntap add pm13 mode tap
ip link set pm13 master r2-node2
ip link set pm13 up
# Start VM
qemu-system-x86_64 \
 -enable-kvm \
 -smp 8 \
 -m 2G \
 -nographic \
 -serial unix:/tmp/boot-2.socket,server,nowait \
 -smbios type=1,serial=846613314f8003728fc0e34eb9678f16217d60a0 \
 -drive if=virtio,cache=writeback,aio=threads,file=/var/scratch/placemat/volumes/boot-2/root.img \
 -drive if=virtio,cache=none,aio=native,file=/var/scratch/placemat/volumes/boot-2/seed.img \
 -drive file=fat:16:${NECO_DIR}/dctest/output/sabakan,format=raw,if=virtio,read-only=on \
 -netdev tap,id=r2-node1,ifname=pm12,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r2-node1,mac=52:54:00:b8:c0:d4 \
 -netdev tap,id=r2-node2,ifname=pm13,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r2-node2,mac=52:54:00:0a:fb:61 \
 -virtfs local,path=/mnt/placemat/boot-2,mount_tag=placemat,security_model=none \
 -boot reboot-timeout=30000 \
 -chardev socket,id=char0,path=/tmp/boot-2.guest,server,nowait \
 -device virtio-serial \
 -device virtserialport,chardev=char0,name=placemat \
 -monitor unix:/tmp/boot-2.monitor,server,nowait \
 -object rng-random,id=rng0,filename=/dev/urandom \
 -device virtio-rng-pci,rng=rng0 \
 -cpu host &
# Create volume rack2-cs1
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack2-cs1/data1.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack2-cs1/data2.img 30G
# Create tap
ip tuntap add pm14 mode tap
ip link set pm14 master r2-node1
ip link set pm14 up
ip tuntap add pm15 mode tap
ip link set pm15 master r2-node2
ip link set pm15 up
# Start VM
qemu-system-x86_64 \
 -enable-kvm \
 -smp 8 \
 -m 16G \
 -nographic \
 -serial unix:/tmp/rack2-cs1.socket,server,nowait \
 -smbios type=1,serial=e623863c198bf4bdfd8b295944982f838a14af6e \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack2-cs1/data1.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack2-cs1/data2.img \
 -netdev tap,id=r2-node1,ifname=pm14,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r2-node1,mac=52:54:00:2e:03:8a \
 -netdev tap,id=r2-node2,ifname=pm15,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r2-node2,mac=52:54:00:0b:18:02 \
 -virtfs local,path=/mnt/placemat/rack2-cs1,mount_tag=placemat,security_model=none \
 -boot reboot-timeout=30000 \
 -chardev socket,id=char0,path=/tmp/rack2-cs1.guest,server,nowait \
 -device virtio-serial \
 -device virtserialport,chardev=char0,name=placemat \
 -monitor unix:/tmp/rack2-cs1.monitor,server,nowait \
 -object rng-random,id=rng0,filename=/dev/urandom \
 -device virtio-rng-pci,rng=rng0 \
 -cpu host &
# Create volume rack2-cs2
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack2-cs2/data1.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack2-cs2/data2.img 30G
# Create Tap
ip tuntap add pm16 mode tap
ip link set pm16 master r2-node1
ip link set pm16 up
ip tuntap add pm17 mode tap
ip link set pm17 master r2-node2
ip link set pm17 up
# Start VM
qemu-system-x86_64 \
 -enable-kvm \
 -smp 8 \
 -m 16G \
 -nographic \
 -serial unix:/tmp/rack2-cs2.socket,server,nowait \
 -smbios type=1,serial=577e2cd4d5a080d41b484924e0a8ce411b001b02 \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack2-cs2/data1.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack2-cs2/data2.img \
 -netdev tap,id=r2-node1,ifname=pm16,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r2-node1,mac=52:54:00:17:c3:ad \
 -netdev tap,id=r2-node2,ifname=pm17,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r2-node2,mac=52:54:00:2d:a6:50 \
 -virtfs local,path=/mnt/placemat/rack2-cs2,mount_tag=placemat,security_model=none \
 -boot reboot-timeout=30000 \
 -chardev socket,id=char0,path=/tmp/rack2-cs2.guest,server,nowait \
 -device virtio-serial \
 -device virtserialport,chardev=char0,name=placemat \
 -monitor unix:/tmp/rack2-cs2.monitor,server,nowait \
 -object rng-random,id=rng0,filename=/dev/urandom \
 -device virtio-rng-pci,rng=rng0 \
 -cpu host &
# Create volume rack2-ss1
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack2-ss1/data1.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack2-ss1/data2.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack2-ss1/data3.img 30G
qemu-img create -f qcow2 /var/scratch/placemat/volumes/rack2-ss1/data4.img 30G
# Create tap
ip tuntap add pm18 mode tap
ip link set pm18 master r2-node1
ip link set pm18 up
ip tuntap add pm19 mode tap
ip link set pm19 master r2-node2
ip link set pm19 up
# Start VM
qemu-system-x86_64 \
 -enable-kvm \
 -smp 2 \
 -m 10G \
 -nographic \
 -serial unix:/tmp/rack2-ss1.socket,server,nowait \
 -smbios type=1,serial=79a31f7d8a4f9a1203a1706e8b0a301d6a66f0d9 \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack2-ss1/data1.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack2-ss1/data2.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack2-ss1/data3.img \
 -drive if=virtio,cache=writeback,aio=threads,format=qcow2,file=/var/scratch/placemat/volumes/rack2-ss1/data4.img \
 -netdev tap,id=r2-node1,ifname=pm18,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r2-node1,mac=52:54:00:63:c1:62 \
 -netdev tap,id=r2-node2,ifname=pm19,script=no,downscript=no,vhost=on \
 -device virtio-net-pci,netdev=r2-node2,mac=52:54:00:3c:9a:fc \
 -virtfs local,path=/mnt/placemat/rack2-ss1,mount_tag=placemat,security_model=none \
 -boot reboot-timeout=30000 \
 -chardev socket,id=char0,path=/tmp/rack2-ss1.guest,server,nowait \
 -device virtio-serial \
 -device virtserialport,chardev=char0,name=placemat \
 -monitor unix:/tmp/rack2-ss1.monitor,server,nowait \
 -object rng-random,id=rng0,filename=/dev/urandom \
 -device virtio-rng-pci,rng=rng0 \
 -cpu host &

# Configure Pod
# core
ip link add pm20 type veth peer name pm20_
ip link set pm20 master internet up
ip link add pm21 type veth peer name pm21_
ip link set pm21 master bmc up
ip link add pm22 type veth peer name pm22_
ip link set pm22 master core-node0 up
ip link add pm23 type veth peer name pm23_
ip link set pm23 master core-ntp0 up
ip link add pm24 type veth peer name pm24_
ip link set pm24 master core-ntp1 up
ip link add pm25 type veth peer name pm25_
ip link set pm25 master core-to-s1 up
ip link add pm26 type veth peer name pm26_
ip link set pm26 master core-to-s2 up
ip link add pm27 type veth peer name pm27_
ip link set pm27 master core-to-ext up
ip link add pm28 type veth peer name pm28_
ip link set pm28 master core-to-op up
ip netns add pm_core
ip netns exec pm_core ip link set lo up
ip netns exec pm_core sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_core sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm20_ netns pm_core name eth0 up
ip netns exec pm_core ip a add 10.0.0.2/24 dev eth0
ip link set pm21_ netns pm_core name eth1 up
ip netns exec pm_core ip a add 10.72.16.2/20 dev eth1
ip link set pm22_ netns pm_core name eth2 up
ip netns exec pm_core ip a add 10.0.49.3/32 dev eth2
ip link set pm23_ netns pm_core name eth3 up
ip netns exec pm_core ip a add 172.16.4.65/32 dev eth3
ip link set pm24_ netns pm_core name eth4 up
ip netns exec pm_core ip a add 172.16.4.66/32 dev eth4
ip link set pm25_ netns pm_core name eth5 up
ip netns exec pm_core ip a add 10.0.2.0/31 dev eth5
ip link set pm26_ netns pm_core name eth6 up
ip netns exec pm_core ip a add 10.0.2.2/31 dev eth6
ip link set pm27_ netns pm_core name eth7 up
ip netns exec pm_core ip a add 10.0.3.1/24 dev eth7
ip link set pm28_ netns pm_core name eth8 up
ip netns exec pm_core ip a add 10.0.4.1/24 dev eth8
ip netns exec pm_core ${NECO_DIR}/dctest/output/setup-iptables
ip netns exec pm_core /usr/local/bird/sbin/bird -c /etc/bird/bird_core.conf -s /var/run/bird/bird_core.ctl
ip netns exec pm_core squid -z && squid
ip netns exec pm_core /usr/local/chrony/sbin/chronyd -f /etc/chrony/chrony.conf
# spine1
ip link add pm29 type veth peer name pm29_
ip link set pm29 master core-to-s1 up
ip link add pm30 type veth peer name pm30_
ip link set pm30 master s1-to-r0-1 up
ip link add pm31 type veth peer name pm31_
ip link set pm31 master s1-to-r0-2 up
ip link add pm32 type veth peer name pm32_
ip link set pm32 master s1-to-r1-1 up
ip link add pm33 type veth peer name pm33_
ip link set pm33 master s1-to-r1-2 up
ip link add pm34 type veth peer name pm34_
ip link set pm34 master s1-to-r2-1 up
ip link add pm35 type veth peer name pm35_
ip link set pm35 master s1-to-r2-2 up
ip netns add pm_spine1
ip netns exec pm_spine1 ip link set lo up
ip netns exec pm_spine1 sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_spine1 sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm29_ netns pm_spine1 name eth0 up
ip netns exec pm_spine1 ip a add 10.0.2.1/31 dev eth0
ip link set pm30_ netns pm_spine1 name eth1 up
ip netns exec pm_spine1 ip a add 10.0.1.0/31 dev eth1
ip link set pm31_ netns pm_spine1 name eth2 up
ip netns exec pm_spine1 ip a add 10.0.1.2/31 dev eth2
ip link set pm32_ netns pm_spine1 name eth3 up
ip netns exec pm_spine1 ip a add 10.0.1.4/31 dev eth3
ip link set pm33_ netns pm_spine1 name eth4 up
ip netns exec pm_spine1 ip a add 10.0.1.6/31 dev eth4
ip link set pm34_ netns pm_spine1 name eth5 up
ip netns exec pm_spine1 ip a add 10.0.1.8/31 dev eth5
ip link set pm35_ netns pm_spine1 name eth6 up
ip netns exec pm_spine1 ip a add 10.0.1.10/31 dev eth6
ip netns exec pm_spine1 /usr/local/bird/sbin/bird -c /etc/bird/bird_spine1.conf -s /var/run/bird/bird_spine1.ctl
# spine2
ip link add pm36 type veth peer name pm36_
ip link set pm36 master core-to-s2 up
ip link add pm37 type veth peer name pm37_
ip link set pm37 master s2-to-r0-1 up
ip link add pm38 type veth peer name pm38_
ip link set pm38 master s2-to-r0-2 up
ip link add pm39 type veth peer name pm39_
ip link set pm39 master s2-to-r1-1 up
ip link add pm40 type veth peer name pm40_
ip link set pm40 master s2-to-r1-2 up
ip link add pm41 type veth peer name pm41_
ip link set pm41 master s2-to-r2-1 up
ip link add pm42 type veth peer name pm42_
ip link set pm42 master s2-to-r2-2 up
ip netns add pm_spine2
ip netns exec pm_spine2 ip link set lo up
ip netns exec pm_spine2 sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_spine2 sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm36_ netns pm_spine2 name eth0 up
ip netns exec pm_spine2 ip a add 10.0.2.3/31 dev eth0
ip link set pm37_ netns pm_spine2 name eth1 up
ip netns exec pm_spine2 ip a add 10.0.1.12/31 dev eth1
ip link set pm38_ netns pm_spine2 name eth2 up
ip netns exec pm_spine2 ip a add 10.0.1.14/31 dev eth2
ip link set pm39_ netns pm_spine2 name eth3 up
ip netns exec pm_spine2 ip a add 10.0.1.16/31 dev eth3
ip link set pm40_ netns pm_spine2 name eth4 up
ip netns exec pm_spine2 ip a add 10.0.1.18/31 dev eth4
ip link set pm41_ netns pm_spine2 name eth5 up
ip netns exec pm_spine2 ip a add 10.0.1.20/31 dev eth5
ip link set pm42_ netns pm_spine2 name eth6 up
ip netns exec pm_spine2 ip a add 10.0.1.22/31 dev eth6
ip netns exec pm_spine2 /usr/local/bird/sbin/bird -c /etc/bird/bird_spine2.conf -s /var/run/bird/bird_spine2.ctl
# rack0-tor1
ip link add pm43 type veth peer name pm43_
ip link set pm43 master s1-to-r0-1 up
ip link add pm44 type veth peer name pm44_
ip link set pm44 master s2-to-r0-1 up
ip link add pm45 type veth peer name pm45_
ip link set pm45 master r0-node1 up
ip netns add pm_rack0-tor1
ip netns exec pm_rack0-tor1 ip link set lo up
ip netns exec pm_rack0-tor1 sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_rack0-tor1 sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm43_ netns pm_rack0-tor1 name eth0 up
ip netns exec pm_rack0-tor1 ip a add 10.0.1.1/31 dev eth0
ip link set pm44_ netns pm_rack0-tor1 name eth1 up
ip netns exec pm_rack0-tor1 ip a add 10.0.1.13/31 dev eth1
ip link set pm45_ netns pm_rack0-tor1 name eth2 up
ip netns exec pm_rack0-tor1 ip a add 10.69.0.65/26 dev eth2
ip netns exec pm_rack0-tor1 /usr/local/bird/sbin/bird -c /etc/bird/bird_rack0-tor1.conf -s /var/run/bird/bird_rack0-tor1.ctl
ip netns exec pm_rack0-tor1 /usr/sbin/dnsmasq --pid-file=/var/run/dnsmasq_rack0-tor1.pid --log-facility=- --dhcp-relay 10.69.0.65,10.69.0.195 --dhcp-relay 10.69.0.65,10.69.1.131
# rack0-tor2
ip link add pm46 type veth peer name pm46_
ip link set pm46 master s1-to-r0-2 up
ip link add pm47 type veth peer name pm47_
ip link set pm47 master s2-to-r0-2 up
ip link add pm48 type veth peer name pm48_
ip link set pm48 master r0-node2 up
ip netns add pm_rack0-tor2
ip netns exec pm_rack0-tor2 ip link set lo up
ip netns exec pm_rack0-tor2 sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_rack0-tor2 sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm46_ netns pm_rack0-tor2 name eth0 up
ip netns exec pm_rack0-tor2 ip a add 10.0.1.3/31 dev eth0
ip link set pm47_ netns pm_rack0-tor2 name eth1 up
ip netns exec pm_rack0-tor2 ip a add 10.0.1.15/31 dev eth1
ip link set pm48_ netns pm_rack0-tor2 name eth2 up
ip netns exec pm_rack0-tor2 ip a add 10.69.0.129/26 dev eth2
ip netns exec pm_rack0-tor2 /usr/local/bird/sbin/bird -c /etc/bird/bird_rack0-tor2.conf -s /var/run/bird/bird_rack0-tor2.ctl
ip netns exec pm_rack0-tor2 /usr/sbin/dnsmasq --pid-file=/var/run/dnsmasq_rack0-tor2.pid --log-facility=- --dhcp-relay 10.69.0.129,10.69.0.195 --dhcp-relay 10.69.0.129,10.69.1.131
# rack1-tor1
ip link add pm49 type veth peer name pm49_
ip link set pm49 master s1-to-r1-1 up
ip link add pm50 type veth peer name pm50_
ip link set pm50 master s2-to-r1-1 up
ip link add pm51 type veth peer name pm51_
ip link set pm51 master r1-node1 up
ip netns add pm_rack1-tor1
ip netns exec pm_rack1-tor1 ip link set lo up
ip netns exec pm_rack1-tor1 sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_rack1-tor1 sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm49_ netns pm_rack1-tor1 name eth0 up
ip netns exec pm_rack1-tor1 ip a add 10.0.1.5/31 dev eth0
ip link set pm50_ netns pm_rack1-tor1 name eth1 up
ip netns exec pm_rack1-tor1 ip a add 10.0.1.17/31 dev eth1
ip link set pm51_ netns pm_rack1-tor1 name eth2 up
ip netns exec pm_rack1-tor1 ip a add 10.69.1.1/26 dev eth2
ip netns exec pm_rack1-tor1 /usr/local/bird/sbin/bird -c /etc/bird/bird_rack1-tor1.conf -s /var/run/bird/bird_rack1-tor1.ctl
ip netns exec pm_rack1-tor1 /usr/sbin/dnsmasq --pid-file=/var/run/dnsmasq_rack1-tor1.pid --log-facility=- --dhcp-relay 10.69.1.1,10.69.0.3 --dhcp-relay 10.69.1.1,10.69.1.131
# rack1-tor2
ip link add pm52 type veth peer name pm52_
ip link set pm52 master s1-to-r1-2 up
ip link add pm53 type veth peer name pm53_
ip link set pm53 master s2-to-r1-2 up
ip link add pm54 type veth peer name pm54_
ip link set pm54 master r1-node2 up
ip netns add pm_rack1-tor2
ip netns exec pm_rack1-tor2 ip link set lo up
ip netns exec pm_rack1-tor2 sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_rack1-tor2 sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm52_ netns pm_rack1-tor2 name eth0 up
ip netns exec pm_rack1-tor2 ip a add 10.0.1.7/31 dev eth0
ip link set pm53_ netns pm_rack1-tor2 name eth1 up
ip netns exec pm_rack1-tor2 ip a add 10.0.1.19/31 dev eth1
ip link set pm54_ netns pm_rack1-tor2 name eth2 up
ip netns exec pm_rack1-tor2 ip a add 10.69.1.65/26 dev eth2
ip netns exec pm_rack1-tor2 /usr/local/bird/sbin/bird -c /etc/bird/bird_rack1-tor2.conf -s /var/run/bird/bird_rack1-tor2.ctl
ip netns exec pm_rack1-tor2 /usr/sbin/dnsmasq --pid-file=/var/run/dnsmasq_rack1-tor2.pid --log-facility=- --dhcp-relay 10.69.1.65,10.69.0.3 --dhcp-relay 10.69.1.65,10.69.1.131
# rack2-tor1
ip link add pm55 type veth peer name pm55_
ip link set pm55 master s1-to-r2-1 up
ip link add pm56 type veth peer name pm56_
ip link set pm56 master s2-to-r2-1 up
ip link add pm57 type veth peer name pm57_
ip link set pm57 master r2-node1 up
ip netns add pm_rack2-tor1
ip netns exec pm_rack2-tor1 ip link set lo up
ip netns exec pm_rack2-tor1 sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_rack2-tor1 sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm55_ netns pm_rack2-tor1 name eth0 up
ip netns exec pm_rack2-tor1 ip a add 10.0.1.9/31 dev eth0
ip link set pm56_ netns pm_rack2-tor1 name eth1 up
ip netns exec pm_rack2-tor1 ip a add 10.0.1.21/31 dev eth1
ip link set pm57_ netns pm_rack2-tor1 name eth2 up
ip netns exec pm_rack2-tor1 ip a add 10.69.1.193/26 dev eth2
ip netns exec pm_rack2-tor1 /usr/local/bird/sbin/bird -c /etc/bird/bird_rack2-tor1.conf -s /var/run/bird/bird_rack2-tor1.ctl
ip netns exec pm_rack2-tor1 /usr/sbin/dnsmasq --pid-file=/var/run/dnsmasq_rack2-tor1.pid --log-facility=- --dhcp-relay 10.69.1.193,10.69.0.3 --dhcp-relay 10.69.1.193,10.69.0.195
# rack2-tor2
ip link add pm58 type veth peer name pm58_
ip link set pm58 master s1-to-r2-2 up
ip link add pm59 type veth peer name pm59_
ip link set pm59 master s2-to-r2-2 up
ip link add pm60 type veth peer name pm60_
ip link set pm60 master r2-node2 up
ip netns add pm_rack2-tor2
ip netns exec pm_rack2-tor2 ip link set lo up
ip netns exec pm_rack2-tor2 sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_rack2-tor2 sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm58_ netns pm_rack2-tor2 name eth0 up
ip netns exec pm_rack2-tor2 ip a add 10.0.1.11/31 dev eth0
ip link set pm59_ netns pm_rack2-tor2 name eth1 up
ip netns exec pm_rack2-tor2 ip a add 10.0.1.23/31 dev eth1
ip link set pm60_ netns pm_rack2-tor2 name eth2 up
ip netns exec pm_rack2-tor2 ip a add 10.69.2.1/26 dev eth2
ip netns exec pm_rack2-tor2 /usr/local/bird/sbin/bird -c /etc/bird/bird_rack2-tor2.conf -s /var/run/bird/bird_rack2-tor2.ctl
ip netns exec pm_rack2-tor2 /usr/sbin/dnsmasq --pid-file=/var/run/dnsmasq_rack2-tor2.pid --log-facility=- --dhcp-relay 10.69.2.1,10.69.0.3 --dhcp-relay 10.69.2.1,10.69.0.195
# external
ip link add pm61 type veth peer name pm61_
ip link set pm61 master core-to-ext up
ip netns add pm_external
ip netns exec pm_external ip link set lo up
ip netns exec pm_external sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_external sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm61_ netns pm_external name eth0 up
ip netns exec pm_external ip a add 10.0.3.2/24 dev eth0
ip netns exec pm_external ${NECO_DIR}/dctest/output/setup-default-gateway-external
# operation
ip link add pm62 type veth peer name pm62_
ip link set pm62 master core-to-op up
ip netns add pm_operation
ip netns exec pm_operation ip link set lo up
ip netns exec pm_operation sysctl -w net.ipv4.ip_forward=1
ip netns exec pm_operation sysctl -w net.ipv6.conf.all.forwarding=1
ip link set pm62_ netns pm_operation name eth0 up
ip netns exec pm_operation ip a add 10.0.4.2/24 dev eth0
ip netns exec pm_operation ${NECO_DIR}/dctest/output/setup-default-gateway-operation

