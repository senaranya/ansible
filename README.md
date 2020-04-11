<p align="center">
<a href="https://travis-ci.org/senaranya/ansible"><img src="https://travis-ci.org/senaranya/ansible.svg?branch=master" alt="Lint status"></a>
</p>

A lightweight Docker container with pre-installed Ansible and related toolset

#### Description
This image provides all core Ansible tools (e.g., `ansible`, `ansible-playbook`, `ansible-doc`, `ansible-galaxy` etc.), Linter `ansible-lint` and Ansible Molecule in an ready-to-use container.

#### To use:
```bash
docker run -t -v "${PWD}":"${PWD}" -w="${PWD}" senaranya/ansible ansible-playbook -i inventory playbook.yml
```
* `-t`: to output in colors. Not required for use in CI pipelines
* `-v "${PWD}":"${PWD}" -w="${PWD}"`: Ensures path in container is same as current path on host. Without this, paths hard-coded in Ansible config will fail as it'll be different in the container
