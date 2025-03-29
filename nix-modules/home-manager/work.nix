{ pkgs, ... }: {
  home.username = "jelsesiy"; 
  home.homeDirectory = "/Users/jelsesiy"; 

  home.packages = with pkgs; [
    argocd
    aws-iam-authenticator
    awscli2
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
    insomnia
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
    qemu
    redis
    tfswitch
    vault
    zstd
  ];
}
