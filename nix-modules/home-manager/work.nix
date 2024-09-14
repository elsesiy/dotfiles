{ pkgs, ... }: {
  home.username = "jelsesiy"; 
  home.homeDirectory = "/Users/jelsesiy"; 

  home.packages = with pkgs; [
    argocd
    aws-iam-authenticator
    awscli2
    azure-cli
    bazelisk
    buf
    dive
    ghz
    git-lfs
    git-secrets
    gnupg
    google-cloud-sdk
    grpcui
    grype
    istioctl
    jsonnet
    k9s
    kube-linter
    kubeconform
    kubernetes-helm
    kubeval
    kustomize
    lcov
    maven
    mdp
    open-policy-agent
    protoc-gen-go
    protoc-gen-go-grpc
    protoc-gen-grpc-web
    qemu
    redis
    tfswitch
    vault
  ];
}
