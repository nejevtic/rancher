
# Instructions

As per https://rancher.com/docs/rancher/v2.x/en/installation/air-gap-high-availability/prepare-private-registry/

```
wget https://github.com/rancher/rancher/releases/download/v2.2.8/rancher-images.txt
wget https://github.com/rancher/rancher/releases/download/v2.2.8/rancher-save-images.sh
wget https://github.com/rancher/rancher/releases/download/v2.2.8/rancher-load-images.sh
wget https://github.com/rancher/rke/releases/download/v0.2.8/rke_linux-amd64
mv rke_linux-amd64 rke
chmod +x rke
./rke config --system-images >> ./rancher-images.txt
```
