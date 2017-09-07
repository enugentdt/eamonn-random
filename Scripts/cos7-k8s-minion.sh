echo "[virt7-docker-common-release]
name=virt7-docker-common-release
baseurl=http://cbs.centos.org/repos/virt7-docker-common-release/x86_64/os/
gpgcheck=0" >> /etc/yum.repos.d/virt7-docker-common-release.repo

yum -y install --enablerepo=virt7-docker-common-release kubernetes etcd flannel

setenforce 0
systemctl disable iptables-services firewalld
systemctl stop iptables-services firewalld


echo '# The address for the info server to serve on
KUBELET_ADDRESS="--address=0.0.0.0"

# The port for the info server to serve on
KUBELET_PORT="--port=10250"

# You may leave this blank to use the actual hostname
# Check the node number!
KUBELET_HOSTNAME="--hostname-override=centos-minion-n"

# Location of the api-server
KUBELET_API_SERVER="--api-servers=http://centos-master:8080"

# Add your own!
KUBELET_ARGS=""
' >> /etc/kubernetes/kubelet


echo '# Flanneld configuration options

# etcd url location.  Point this to the server where etcd runs
FLANNEL_ETCD_ENDPOINTS="http://centos-master:2379"

# etcd config key.  This is the configuration key that flannel queries
# For address range assignment
FLANNEL_ETCD_PREFIX="/kube-centos/network"

# Any additional options that you want to pass
#FLANNEL_OPTIONS=""' >> /etc/sysconfig/flanneld


for SERVICES in kube-proxy kubelet flanneld docker; do
    systemctl restart $SERVICES
    systemctl enable $SERVICES
    systemctl status $SERVICES
done

kubectl config set-cluster default-cluster --server=http://centos-master:8080
kubectl config set-context default-context --cluster=default-cluster --user=default-admin
kubectl config use-context default-context

kubectl get nodes
