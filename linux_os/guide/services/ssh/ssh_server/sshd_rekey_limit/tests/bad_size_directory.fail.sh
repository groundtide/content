# platform = multi_platform_fedora,Oracle Linux 9,Red Hat Enterprise Linux 9

mkdir -p /etc/ssh/sshd_config.d
touch /etc/ssh/sshd_config.d/nothing

if grep -q "^\s*RekeyLimit" /etc/ssh/sshd_config /etc/ssh/sshd_config.d/* ; then
	sed -i "/^\s*RekeyLimit.*/Id" /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*
fi

echo "RekeyLimit 812M 1h" > /etc/ssh/sshd_config.d/bad_config.conf
