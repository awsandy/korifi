#!/bin/bash

dst_dir="${K14SIO_INSTALL_BIN_DIR:-/usr/local/bin}"

  if [ -x "$(command -v wget)" ]; then
    dl_bin="wget -nv -O-"
  else
    dl_bin="curl -s -L"
  fi

  if [[ `uname` == Darwin ]]; then
    binary_type=darwin-amd64
  else
    binary_type=linux-amd64
  fi

  echo "Installing ${binary_type} binaries..."

  echo "Installing ytt..."
  $dl_bin github.com/vmware-tanzu/carvel-ytt/releases/download/v0.43.0/ytt-${binary_type} > /tmp/ytt
  chmod +x /tmp/ytt
  sudo mv /tmp/ytt ${dst_dir}/ytt
  echo "Installed ${dst_dir}/ytt v0.43.0"
  
  echo "Installing imgpkg..."
  $dl_bin github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.33.0/imgpkg-${binary_type} > /tmp/imgpkg
  chmod +x /tmp/imgpkg
  sudo mv /tmp/imgpkg ${dst_dir}/imgpkg
  echo "Installed ${dst_dir}/imgpkg v0.33.0"
  
  echo "Installing kbld..."
  $dl_bin github.com/vmware-tanzu/carvel-kbld/releases/download/v0.35.0/kbld-${binary_type} > /tmp/kbld
  chmod +x /tmp/kbld
  sudo mv /tmp/kbld ${dst_dir}/kbld
  echo "Installed ${dst_dir}/kbld v0.35.0"
  
  echo "Installing kapp..."
  $dl_bin github.com/vmware-tanzu/carvel-kapp/releases/download/v0.53.0/kapp-${binary_type} > /tmp/kapp
  chmod +x /tmp/kapp
  sudo mv /tmp/kapp ${dst_dir}/kapp
  echo "Installed ${dst_dir}/kapp v0.53.0"
  
  echo "Installing kwt..."
  $dl_bin https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-${binary_type} > /tmp/kwt
  chmod +x /tmp/kwt
  sudo mv /tmp/kwt ${dst_dir}/kwt
  echo "Installed ${dst_dir}/kwt v0.0.6"
  
  echo "Installing vendir..."
  $dl_bin github.com/vmware-tanzu/carvel-vendir/releases/download/v0.32.0/vendir-${binary_type} > /tmp/vendir
  chmod +x /tmp/vendir
  sudo mv /tmp/vendir ${dst_dir}/vendir
  echo "Installed ${dst_dir}/vendir v0.32.0"
  
  echo "Installing kctrl..."
  $dl_bin github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.42.0/kctrl-${binary_type} > /tmp/kctrl
  chmod +x /tmp/kctrl
  sudo mv /tmp/kctrl ${dst_dir}/kctrl
  echo "Installed ${dst_dir}/kctrl v0.42.0"


