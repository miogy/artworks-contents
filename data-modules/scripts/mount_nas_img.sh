cat > scripts/mount_nas_img.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

NAS_HOST="miogy.synology.me"
NAS_PORT="22"
NAS_USER="jjangrl87"
NAS_PATH="/miogy-content/data/img"

MOUNT_POINT="/workspaces/artworks-contents/data-modules/img"

SSHFS_OPTS=(
  "-p" "${NAS_PORT}"
  "-o" "reconnect,ServerAliveInterval=15,ServerAliveCountMax=3"
  "-o" "StrictHostKeyChecking=accept-new"
  "-o" "IdentityFile=/home/codespace/.ssh/id_ed25519"
)

echo "[mount] mount point: ${MOUNT_POINT}"
mkdir -p "${MOUNT_POINT}"

if ! command -v sshfs >/dev/null 2>&1; then
  echo "[mount] sshfs not found. Installing..."
  sudo apt-get update
  sudo apt-get install -y sshfs
fi

if mount | grep -q "on ${MOUNT_POINT} type fuse.sshfs"; then
  echo "[mount] already mounted."
  exit 0
fi


fusermount3 -u "${MOUNT_POINT}" 2>/dev/null || true
sudo umount "${MOUNT_POINT}" 2>/dev/null || true

echo "[mount] mounting ${NAS_USER}@${NAS_HOST}:${NAS_PATH} -> ${MOUNT_POINT}"
sshfs "${SSHFS_OPTS[@]}" "${NAS_USER}@${NAS_HOST}:${NAS_PATH}" "${MOUNT_POINT}"

echo "[mount] done."
echo "[mount] sample: ls -al ${MOUNT_POINT}/2025 | tail -n 20"
EOF

chmod +x scripts/mount_nas_img.sh



cat > scripts/unmount_nas_img.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

MOUNT_POINT="/workspaces/artworks-contents/data-modules/img"

echo "[unmount] ${MOUNT_POINT}"
fusermount3 -u "${MOUNT_POINT}" 2>/dev/null || true
sudo umount "${MOUNT_POINT}" 2>/dev/null || true
echo "[unmount] done."
EOF

chmod +x scripts/unmount_nas_img.sh
