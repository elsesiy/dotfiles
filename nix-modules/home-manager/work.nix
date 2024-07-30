{ pkgs, ... }: {
  home.username = "jelsesiy"; 
  home.homeDirectory = "/Users/jelsesiy"; 

  home.packages = [
    pkgs.argocd
    pkgs.aws-iam-authenticator
    pkgs.awscli2
    pkgs.azure-cli
    pkgs.bazelisk
    pkgs.buf
    pkgs.dive
    pkgs.ghz
    pkgs.git-secrets
    pkgs.gnupg
    pkgs.google-cloud-sdk
    pkgs.grpcui
    pkgs.grype
    pkgs.istioctl
    pkgs.jsonnet
    pkgs.k9s
    pkgs.kube-linter
    pkgs.kubeconform
    pkgs.kubernetes-helm
    pkgs.kubeval
    pkgs.kustomize
    pkgs.lcov
    pkgs.maven
    pkgs.mdp
    pkgs.open-policy-agent
    pkgs.protoc-gen-go
    pkgs.protoc-gen-go-grpc
    pkgs.protoc-gen-grpc-web
    pkgs.qemu
    pkgs.redis
    pkgs.tfswitch
    pkgs.vault
    pkgs.vhs
    pkgs.wrk
  ];
}
