require 'spec_helper'

describe 'netbox::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) do
        {
          version: '3.5.1',
          user: 'testuser',
          group: 'testgroup',
          software_directory: '/opt/netbox',
          allowed_hosts: ['0.0.0.0/0'],
          database_version: '12',
          database_name: 'testdb',
          database_user: 'testdbuser',
          database_password: 'testdbpass',
          database_host: 'localhost',
          database_port: 5432,
          database_conn_max_age: 10,
          redis_options: {
            webhooks: {
              host: 'redis.example.com',
              port: 6379,
              password: 'redis',
              database: 0,
              default_timeout: 300,
              ssl: true,
            },
            caching: {
              host: 'localhost',
              port: 6379,
              password: 'redis',
              database: 1,
              default_timeout: 300,
              ssl: false,
            },
            tasks: {
              host: 'localhost',
              port: 6379,
              password: '',
              database: 0,
              default_timeout: 300,
              ssl: 'False',
            },
          },
          email_options: {
            server: 'smtp.example.com',
            port: 587,
            username: 'smtpuser',
            password: 'smtppass',
            timeout: 60,
            from_email: 'netbox@example.com',
          },
          secret_key: 'test-secret-key',
          banner_top: '',
          banner_bottom: '',
          banner_login: '',
          base_path: '/',
          admins: [
            {
              name: 'Name Nameson',
              email: 'nameson@example.com',
            },
            {
              name: 'Another Guy',
              email: 'guy@example.com',
            },
          ],
          debug: false,
          enforce_global_unique: false,
          login_required: false,
          metrics_enabled: false,
          prefer_ipv4: false,
          exempt_view_permissions: [],
          napalm_username: 'some_username',
          napalm_password: 'some_secret_password',
          napalm_timeout: 30,
          time_zone: 'UTC+01:00',
          date_format: 'N j, Y',
          short_date_format: 'Y-m-d',
          time_format: 'g:i a',
          short_time_format: 'H:i:s',
          datetime_format: 'N j, Y g:i a',
          short_datetime_format: 'Y-m-d H:i',
          include_napalm: true,
          include_django_storages: true,
          include_ldap: true,
          python_version: '3.8',
          log_dir_path: '/opt/netbox/logs',
          log_file: 'django-ldap-debug.log',
          ldap_server: 'server',
          ldap_service_account_cn: 'netbox',
          ldap_service_account_password: 'password123!',
          ldap_service_account_ou: 'Service Accounts',
          ldap_dc: 'dc=example,dc=com',
          ldap_netbox_group_ou: 'groups',
          ldap_netbox_ro_user_cn: 'ro_group',
          ldap_netbox_admin_user_cn: 'admin_group',
          ldap_netbox_super_user_cn: 'super_user_group',
        }
      end

      it { is_expected.to compile }
    end
  end
end
