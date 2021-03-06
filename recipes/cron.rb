#
# Cookbook Name:: magento-ng
# Recipe:: cron
#
# Copyright (C) 2015 Inviqa UK Limited
#
# All rights reserved - Do Not Redistribute
#

%w( apache nginx ).each do |type|
  node[type]['sites'].each do |name, site|
    next unless site['type'] == 'magento'

    if site['type'] == 'magento'
      cron_d "magento-#{name}" do
        if !site['clustered']
          command "sh #{site['docroot']}/cron.sh"
        else
          command "bash -c '[ -f #{site['clustered']['primary_indicator']} ] && sh #{site['docroot']}/cron.sh'"
        end

        if (!site['cron'].nil?) && site['cron']['user']
          user site['cron']['user']
        else
          case type
          when 'apache'
            user node['apache']['user']
          when 'nginx'
            user node['php-fpm']['pools']['www']['user'].nil? ? node['php-fpm']['user'] : node['php-fpm']['pools']['www']['user']
          end
        end
      end
    end
  end
end