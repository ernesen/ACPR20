# Ansible role '*avaloq.acpr-ocp4-webserver*'

**TODO**: 
* Update section 'role variables' and 'example playbook'
* Update meta/main.yml

## Requirements

* Ansible > 2.9

### Privilege escalation

The role requires root privileges.

### Dependencies

None.

## Role variables

Below is a list of all currently supported variables.

### Required variables

None.

### Optional variables
```yaml
acpr_webserver:
  document_root: /var/www/html
  managed: true
```

```yaml
acpr_webserver_ignition_file_path: "{{ acpr_webserver_defaults.document_root }}/ign/{{ os_cluster_name }}"
```
## Usage examples
Usage within a playbook:
```yaml
- name: Prepare for custom document_root
  block:
    - name: httpd templating
      template:
        src: "httpd.conf.j2"
        dest: /etc/httpd/conf/httpd.conf
        mode: 0644
      notify:
        - reload httpd
    - name: Setting new settype
      sefcontext:
        target: '{{ acpr_webserver.document_root }}(/.*)?'
        setype: httpd_sys_content_t
        state: present
  when: '"/var/www/html" != acpr_webserver.document_root'
```
