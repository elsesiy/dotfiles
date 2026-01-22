{ pkgs, ... }: {

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
    grpcui
    grype
    imagemagick
    jsonnet
    k3d
    k9s
    kube-linter
    kubeconform
    kubelogin-oidc
    kubernetes-helm
    kubeval
    kustomize
    lcov
    maven
    mdp
    # open-policy-agent broken
    qemu
    redis
    tfswitch
    utm
    vault
    zstd
  ];
}
