{% for user, data in pillar.get('admin_users', {}).items() %}
user_{{ user }}
  user.present:
    - name: {{ data['name'] }}
    - fullname: {{ data['fullname'] }}
    - shell: {{ data['shell'] }}
    - home: {{ data['home'] }}
    - gid_from_name: {{ data['gid_from_name'] }}
    - groups: {{ data['groups'] }}
{{ user }}_key:
  ssh_auth.present:
    - name: {{ data['ssh_key'] }}  
    - user: {{ user }}
{% endfor %}
