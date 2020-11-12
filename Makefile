KUBERNETES_VERSION=1.18.8
KIND_VERSION=0.9.0
KIND_CLUSTER_NAME=qemu-on-k8s

KUBEADM_APIVERSION=kubeadm.k8s.io/v1beta2

.PHONY: launch-kind
launch-kind: kind
	if [ ! "$(shell kind get clusters | grep $(KIND_CLUSTER_NAME))" ]; then \
		sed -e "s|@KUBERNETES_VERSION@|$(KUBERNETES_VERSION)|" \
			-e "s|@KUBEADM_APIVERSION@|$(KUBEADM_APIVERSION)|" kind-cluster.yaml > /tmp/kind-cluster.yaml; \
		kind create cluster --name=$(KIND_CLUSTER_NAME) --config /tmp/kind-cluster.yaml --image kindest/node:v$(KUBERNETES_VERSION); \
	fi

.PHONY: shutdown-kind
shutdown-kind: kind
	if [ "$(shell kind get clusters | grep $(KIND_CLUSTER_NAME))" ]; then \
		kind delete cluster --name=$(KIND_CLUSTER_NAME) || true; \
	fi

.PHONY: kind
kind:
	if [ ! "$(shell kind version | grep $(KIND_VERSION))" ]; then \
		cd /tmp; env GOFLAGS= GO111MODULE=on go get sigs.k8s.io/kind@v$(KIND_VERSION); \
	fi

.PHONY: load-dctest-image
load-dctest-image: build-dctest-image
	ID=$$(docker image inspect --format='{{.ID}}' dctest:dev); \
	if [ ! "$$(docker exec -it $(KIND_CLUSTER_NAME)-control-plane ctr --namespace=k8s.io images list | grep $$ID)" ]; then \
		kind load docker-image --name=$(KIND_CLUSTER_NAME) dctest:dev; \
	fi

.PHONY: build-dctest-image
build-dctest-image: Dockerfile
	docker build . -t dctest:dev

